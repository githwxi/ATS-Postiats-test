(* ****** ****** *)

#include
"share/atspre_staload.hats"
#include
"share/HATS/atspre_staload_libats_ML.hats"

(* ****** ****** *)

staload "./lambda.sats"

(* ****** ****** *)

implement
print_term(t0) = fprint(stdout_ref, t0)

(* ****** ****** *)

implement
fprint_val<term> = fprint_term

(* ****** ****** *)

implement
fprint_term
  (out, t0) =
(
case+ t0 of
//
| TMvar(x) => fprint! (out, "TMvar(", x, ")")
//
| TMlam(x, t) =>
    fprint! (out, "TMlam(", x, " => ", t, ")")
| TMapp(t1, t2) =>
    fprint! (out, "TMapp(", t1, "; ", t2, ")")
//
| TMint(i0) => fprint! (out, "TMint(", i0, ")")
| TMstr(s0) => fprint! (out, "TMstr(", s0, ")")
//
| TMopr(opr, ts) => fprint! (out, "TMopr(", opr, "; ", ts)
//
| TMfix(f, x, t) =>
    fprint! (out, "TMfix(", f, "(", x, ") => ", t, ")")
//
| TMifnz(t1, t2, t3) =>
    fprint! (out, "TMifnz(", t1, "; ", t2, "; ", t3, ")")
)

(* ****** ****** *)

implement
subst0
(t0, x0, sub) = let
//
fun
mysubst(t0: term): term = subst0(t0, x0, sub)
//
in
//
case+ t0 of
//
| TMvar(x) => if x0 = x then sub else t0
//
| TMlam(x, t) =>
    if x0 = x then t0 else TMlam(x, mysubst(t))
  // end of [TMlam]
//
| TMapp(t1, t2) => TMapp(mysubst(t1), mysubst(t2))
//
| TMint _ => t0
| TMstr _ => t0
//
| TMopr(opr, ts) =>
    TMopr(opr, ts.map(TYPE{term})(lam t => mysubst(t)))
//
| TMfix(f, x, t) =>
    if x0 = f then t0 else
      if x0 = x then t0 else TMfix(f, x, mysubst(t))
    // end of [if]
//
| TMifnz(t1, t2, t3) =>
    TMifnz(mysubst(t1), mysubst(t2), mysubst(t3))
//
end // end of [subst0]

(* ****** ****** *)

(*
implement
eval_cbn(t0) =
(
case+ t0 of
| TMvar _ => t0
| TMlam _ => t0
//
| TMapp(t1, t2) => let
    val t1 = eval_cbn(t1)
  in
    case+ t1 of
    | TMlam(x, t10) =>
        eval_cbn(subst0(t10, x, t2))
      // end of [TMlam]
    | _(*non-TMlam*) => TMapp(t1, t2)
  end // end of [TMapp]
//
| TMint _ => t0
//
| TMfix(f, x, t_def) =>
    TMlam(x, subst0(t_def, f, t0))
  // end of [TMfix]
//
| TMifnz
  (
    t1, t2, t3
  ) => let
    val t1 =
      eval_cbn(t1)
    // end of [val]
  in
    case+ t1 of
    | TMint(i0) =>
      if i0 != 0
        then eval_cbn(t2)
        else eval_cbn(t3)
      // end of [if]
    | _(*non-TMint*) => TMifnz(t1, t2, t3)
  end // end of [TMifnz]
//
) (* end of [eval_cbn] *)
*)

(* ****** ****** *)

fun
eval_cbv_opr
(
  opr: string, ts: termlst
) : term = let
  val ts = ts.map(TYPE{term})(lam t => eval_cbv(t))
in
//
case+ opr of
| "+" => (
    case+ ts of
    | cons0(TMint(i1), cons0(TMint(i2), nil0())) => TMint(i1+i2)
(*
    | cons0(TMstring(s1), cons0(TMstring(s2), nil0())) => TMstring(s1+s2)
*)
    | _(*type-error*) => TMopr(opr, ts)
  )
| "-" => (
    case+ ts of
    | cons0(TMint(i1), cons0(TMint(i2), nil0())) => TMint(i1-i2)
    | _(*type-error*) => TMopr(opr, ts)
  )
| "*" => (
    case+ ts of
    | cons0(TMint(i1), cons0(TMint(i2), nil0())) => TMint(i1*i2)
    | _(*type-error*) => TMopr(opr, ts)
  )
| "/" => (
    case+ ts of
    | cons0(TMint(i1), cons0(TMint(i2), nil0())) => TMint(i1/i2)
    | _(*type-error*) => TMopr(opr, ts)
  )
| ">" => (
    case+ ts of
    | cons0(TMint(i1), cons0(TMint(i2), nil0())) => TMint(bool2int(i1 > i2))
    | _(*type-error*) => TMopr(opr, ts)
  )
| ">=" => (
    case+ ts of
    | cons0(TMint(i1), cons0(TMint(i2), nil0())) => TMint(bool2int(i1 >= i2))
    | _(*type-error*) => TMopr(opr, ts)
  )
| _(*unrecognized*) => TMopr(opr, ts)
//
end // end of [eval_cbv_opr]

(* ****** ****** *)

implement
eval_cbv(t0) =
(
case+ t0 of
| TMvar _ => t0
| TMlam _ => t0
//
| TMapp(t1, t2) => let
    val t1 = eval_cbv(t1)
    val t2 = eval_cbv(t2)
  in
    case+ t1 of
    | TMlam(x, t10) =>
        eval_cbv(subst0(t10, x, t2))
      // end of [TMlam]
    | _(*non-TMlam*) => TMapp(t1, t2)
  end // end of [TMapp]
//
| TMint _ => t0
| TMstr _ => t0
//
| TMopr(opr, ts) => eval_cbv_opr(opr, ts)
//
| TMfix(f, x, t_def) =>
    TMlam(x, subst0(t_def, f, t0))
  // end of [TMfix]
//
| TMifnz
  (
    t1, t2, t3
  ) => let
    val t1 =
      eval_cbv(t1)
    // end of [val]
  in
    case+ t1 of
    | TMint(i0) =>
      if i0 != 0
        then eval_cbv(t2)
        else eval_cbv(t3)
      // end of [if]
    | _(*non-TMint*) => TMifnz(t1, t2, t3)
  end // end of [TMifnz]
//
) (* end of [eval_cbv] *)

(* ****** ****** *)

(* end of [lambda_term.dats] *)

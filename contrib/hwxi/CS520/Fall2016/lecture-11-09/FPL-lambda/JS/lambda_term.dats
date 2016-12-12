(* ****** ****** *)
(*
staload "./lambda.sats"
*)
(* ****** ****** *)
(*
#include
"share/atspre_define.hats"
#include
"{$LIBATSCC2JS}/staloadall.hats"
*)
(* ****** ****** *)
//
implement Int(i) = TMint(i)
//
implement Var(x) = TMvar(x)
implement Lam(x, t) = TMlam(x, t)
implement App(t1, t2) = TMapp(t1, t2)
//
implement Fix(f, x, t) = TMfix(f, x, t)
//
implement Ifnz(t1, t2, t3) = TMifnz(t1, t2, t3)
//
(* ****** ****** *)
//
implement
print_term
  (t0) = (
//
case+ t0 of
//
| TMint(i) => print! ("Int(", i, ")")
//
| TMvar(x) => print! ("Var(", x, ")")
//
| TMlam(x, t) =>
    print! ("Lam(", x, " => ", t, ")")
| TMapp(t1, t2) =>
    print! ("App(", t1, "; ", t2, ")")
//
| TMfix(f, x, t) =>
    print! ("Fix(", f, "(", x, ") => ", t, ")")
//
| TMifnz(t1, t2, t3) =>
    print! ("Ifnz(", t1, "; ", t2, "; ", t3, ")")
//
) (* end of [print_term] *)
//
(* ****** ****** *)
//
implement
tostring_term
  (t0) = (
//
case+ t0 of
//
| TMint(i) => "Int(" + String(i) + ")"
//
| TMvar(x) => "Var(" + String(x) + ")"
//
| TMlam(x, t) =>
    "Lam(" + String(x) + " => " + tostring(t) + ")"
| TMapp(t1, t2) =>
    "App(" + tostring(t1) + "; " + tostring(t2) + ")"
//
| TMfix(f, x, t) =>
    "Fix(" + String(f) + "(" + String(x) + ") => " + tostring(t) + ")"
//
| TMifnz(t1, t2, t3) =>
    "Ifnz(" + tostring(t1) + "; " + tostring(t2) + "; " + tostring(t3) + ")"
//
) (* end of [tostring_term] *)
//
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

implement
eval_cbn(t0) =
(
case+ t0 of
| TMvar _ => t0
| TMlam _ => t0
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
| TMfix _ => t0
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

(* ****** ****** *)

implement
eval_cbv(t0) =
(
case+ t0 of
| TMvar _ => t0
| TMlam _ => t0
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
//
| TMfix _ => t0
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
//
extern val K : term = "mac#"
extern val S : term = "mac#"
//
local
val x = TMvar "x"
val y = TMvar "y"
val z = TMvar "z"
in
implement K = TMlam ("x", TMlam("y", x))
implement S = TMlam ("x", TMlam("y", TMlam("z", TMapp(TMapp(x, z), TMapp(y, z)))))
end // end of [local]
//
(* ****** ****** *)

(* end of [lambda_term.dats] *)

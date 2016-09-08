(* ****** ****** *)
//
// Implement <term>
//
(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
//
(* ****** ****** *)

staload "./lambda.sats"

(* ****** ****** *)

implement
print_term(x) = fprint_term(stdout_ref, x)
implement
prerr_term(x) = fprint_term(stderr_ref, x)

(* ****** ****** *)

implement
fprint_term(out, t0) =
(
case+ t0 of
//
| TMint(i) => fprint! (out, "TMint(", i, ")")
| TMbool(b) => fprint! (out, "TMbool(", b, ")")
//
| TMvar(x) => fprint! (out, "TMvar(", x, ")")
| TMlam(x, t) => fprint! (out, "TMlam(", x, ", ", t, ")")
| TMapp(t1, t2) => fprint! (out, "TMapp(", t1, ", ", t2, ")")
//
| TMopr(opr, ts) => fprint! (out, "TMopr(", opr,  "; ", ts, ")")
| TMcond(t0, t1, t2) => fprint! (out, "TMcond(", t0, ", ", t1, ", ", t2)
//
| TMfix(f, t) => fprint! (out, "TMfix(", f, ", ", t, ")")
//
)

(* ****** ****** *)

implement
fprint_termlst
  (out, ts) = let
//
implement
fprint_val<term> (out, x) = fprint_term(out, x)
//
in
  fprint_list<term>(out, ts)
end // end of [fprint_termlst]

(* ****** ****** *)

#if(0)

implement
FV (t0) = let
//
fun auxlst (ts: termlst): fvset =
(
  case+ ts of
  | nil() => fvset_nil()
  | cons(t, ts) => fvset_union(FV(t), auxlst(ts))
)
//
in
//
case+ t0 of
//
| TMint _ => fvset_nil()
| TMbool _ => fvset_nil()
//
| TMvar x => fvset_sing(x)
| TMlam (x1, t2) => fvset_rmv(FV(t2), x1)
| TMapp (t1, t2) => fvset_union(FV(t1), FV(t2))
//
| TMopr (opr, ts) => auxlst (ts)
//
| TMcond (t0, t1, t2) =>
    fvset_union(FV(t0), fvset_union(FV(t1), FV(t2)))
//
end // end of [FV]

#endif // end of [if(0)]

(* ****** ****** *)

implement
subst0 (t0, x0, sub) = let
//
macdef
subst(t) = subst0(,(t), x0, sub)
//
fun auxlst(ts: termlst): termlst =
(
case+ ts of
| nil() => nil()
| cons(t, ts) => cons(subst(t), auxlst(ts))
)
//
in
//
case+ t0 of
//
| TMint _ => t0
| TMbool _ => t0
//
| TMvar(x1) =>
  if x0 = x1 then sub else t0
//
| TMlam(x1, t1) =>
  if x0 = x1
    then t0 else TMlam(x1, subst(t1))
  // end of [TMlam]
//
| TMapp(t1, t2) => TMapp(subst(t1), subst(t2))
//
| TMopr(opr, ts) => TMopr(opr, auxlst(ts))
| TMcond(t0, t1, t2) =>
    TMcond(subst(t0), subst(t1), subst(t2))
  // end of [TMcond]
//
| TMfix(f1, t1) =>
  if x0 = f1
    then t0 else TMfix(f1, subst(t1))
  // end of [TMfix]
//
end // end of [subst0]

(* ****** ****** *)

exception
FatalError_cbn of (string)

extern
fun eval_cbn_opr : (string, termlst) -> term

(* ****** ****** *)

implement
eval_cbn(t0) =
(
case+ t0 of
//
| TMint _ => t0
| TMbool _ => t0
//
| TMlam _ => t0
| TMapp(t1, t2) => let
    val t1 = eval_cbn(t1)
  in
    case+ t1 of
    | TMlam
      (
        x, t1_body
      ) =>
        eval_cbn(subst0(t1_body, x, t2))
      // TMlam
    | _ (*non-TMlam*) =>
        $raise FatalError_cbn("type-error")
  end
//
| TMopr
  (
    opr, ts
  ) => let
    val ts =
      list_map_fun<term><term> (ts, eval_cbn)
    // end of [val]
  in
    eval_cbn_opr(opr, list_vt2t(ts))
  end // end of [TMopr]
//
| TMcond
  (
    t0, t1, t2
  ) => let
    val t0 = eval_cbn(t0)
  in
    case+ t0 of
    | TMbool(test) =>
      if test
        then eval_cbn(t1) else eval_cbn(t2)
      // end of [if]
    | _ => $raise FatalError_cbn("type-error")
  end // end of [TMcond]
//
| TMfix(f, t_body) => eval_cbn(subst0(t_body, f, t0))
//
| TMvar _ => $raise FatalError_cbn("unbound-variable")
)

(* ****** ****** *)

implement
eval_cbn_opr
  (opr, ts) = let
in
//
case+ opr of
//
| "+" => (
    case+ ts of
    | $list
      (
        TMint(i1), TMint(i2)
      ) => TMint(i1+i2)
    | _ => $raise FatalError_cbn("type-error")
  )
//
| "-" => (
    case+ ts of
    | $list
      (
        TMint(i1), TMint(i2)
      ) => TMint(i1-i2)
    | _ => $raise FatalError_cbn("type-error")
  )
//
| "*" => (
    case+ ts of
    | $list
      (
        TMint(i1), TMint(i2)
      ) => TMint(i1*i2)
    | _ => $raise FatalError_cbn("type-error")
  )
//
| "/" => (
    case+ ts of
    | $list
      (
        TMint(i1), TMint(i2)
      ) => TMint(i1/i2)
    | _ => $raise FatalError_cbn("type-error")
  )
//
| "%" => (
    case+ ts of
    | $list
      (
        TMint(i1), TMint(i2)
      ) => TMint(i1%i2)
    | _ => $raise FatalError_cbn("type-error")
  )
//
| "<" => (
    case+ ts of
    | $list
      (
        TMint(i1), TMint(i2)
      ) => TMbool(i1 < i2)
    | _ => $raise FatalError_cbn("type-error")
  )
| "<=" => (
    case+ ts of
    | $list
      (
        TMint(i1), TMint(i2)
      ) => TMbool(i1 <= i2)
    | _ => $raise FatalError_cbn("type-error")
  )
//
| ">" => (
    case+ ts of
    | $list
      (
        TMint(i1), TMint(i2)
      ) => TMbool(i1 > i2)
    | _ => $raise FatalError_cbn("type-error")
  )
| ">=" => (
    case+ ts of
    | $list
      (
        TMint(i1), TMint(i2)
      ) => TMbool(i1 >= i2)
    | _ => $raise FatalError_cbn("type-error")
  )
//
| "=" => (
    case+ ts of
    | $list
      (
        TMint(i1), TMint(i2)
      ) => TMbool(i1 = i2)
    | _ => $raise FatalError_cbn("type-error")
  )
| "!=" => (
    case+ ts of
    | $list
      (
        TMint(i1), TMint(i2)
      ) => TMbool(i1 != i2)
    | _ => $raise FatalError_cbn("type-error")
  )
//
| _ (*rest*) => let
    val () =
      prerrln!("eval_cbn_opr: opr = ", opr)
    // end of [val]
  in
    $raise FatalError_cbn("unrecognized-operator")
  end // end of [rest]
//
end // end of [eval_cbn_opr]

(* ****** ****** *)

exception
FatalError_cbv of (string)

(* ****** ****** *)

extern
fun eval_cbv_opr : (string, termlst) -> term

(* ****** ****** *)

implement
eval_cbv(t0) =
(
case+ t0 of
//
| TMint _ => t0
| TMbool _ => t0
//
| TMlam _ => t0
| TMapp(t1, t2) => let
    val t1 = eval_cbv(t1)
    val t2 = eval_cbv(t2)
  in
    case+ t1 of
    | TMlam(x, t1_body) =>
        eval_cbv(subst0(t1_body, x, t2))
      // end of [TMlam]
    | _ => $raise FatalError_cbv("type-error")
  end
//
| TMopr
  (
    opr, ts
  ) => let
    val ts =
      list_map_fun<term><term> (ts, eval_cbv)
    // end of [val]
  in
    eval_cbv_opr(opr, list_vt2t(ts))
  end // end of [TMopr]
//
| TMcond
  (
    t0, t1, t2
  ) => let
    val t0 = eval_cbv(t0)
  in
    case+ t0 of
    | TMbool(test) =>
      if test
        then eval_cbv(t1) else eval_cbv(t2)
      // end of [if]
    | _ (*non-TMbool*) => $raise FatalError_cbv("type-error")
  end // end of [TMcond]
//
| TMfix(f, t_body) => eval_cbv(subst0(t_body, f, t0))
//
| TMvar _ => $raise FatalError_cbv("unbound-variable")
)

(* ****** ****** *)

implement
eval_cbv_opr
  (opr, ts) = let
in
//
case+ opr of
//
| "+" => (
    case+ ts of
    | $list
      (
        TMint(i1), TMint(i2)
      ) => TMint(i1+i2)
    | _ => $raise FatalError_cbv("type-error")
  )
//
| "-" => (
    case+ ts of
    | $list
      (
        TMint(i1), TMint(i2)
      ) => TMint(i1-i2)
    | _ => $raise FatalError_cbv("type-error")
  )
//
| "*" => (
    case+ ts of
    | $list
      (
        TMint(i1), TMint(i2)
      ) => TMint(i1*i2)
    | _ => $raise FatalError_cbv("type-error")
  )
//
| "/" => (
    case+ ts of
    | $list
      (
        TMint(i1), TMint(i2)
      ) => TMint(i1/i2)
    | _ => $raise FatalError_cbv("type-error")
  )
//
| "%" => (
    case+ ts of
    | $list
      (
        TMint(i1), TMint(i2)
      ) => TMint(i1%i2)
    | _ => $raise FatalError_cbv("type-error")
  )
//
| "<" => (
    case+ ts of
    | $list
      (
        TMint(i1), TMint(i2)
      ) => TMbool(i1 < i2)
    | _ => $raise FatalError_cbv("type-error")
  )
| "<=" => (
    case+ ts of
    | $list
      (
        TMint(i1), TMint(i2)
      ) => TMbool(i1 <= i2)
    | _ => $raise FatalError_cbv("type-error")
  )
//
| ">" => (
    case+ ts of
    | $list
      (
        TMint(i1), TMint(i2)
      ) => TMbool(i1 > i2)
    | _ => $raise FatalError_cbv("type-error")
  )
| ">=" => (
    case+ ts of
    | $list
      (
        TMint(i1), TMint(i2)
      ) => TMbool(i1 >= i2)
    | _ => $raise FatalError_cbv("type-error")
  )
//
| "=" => (
    case+ ts of
    | $list
      (
        TMint(i1), TMint(i2)
      ) => TMbool(i1 = i2)
    | _ => $raise FatalError_cbv("type-error")
  )
| "!=" => (
    case+ ts of
    | $list
      (
        TMint(i1), TMint(i2)
      ) => TMbool(i1 != i2)
    | _ => $raise FatalError_cbv("type-error")
  )
//
| _ (*rest*) => let
    val () =
      prerrln!("eval_cbv_opr: opr = ", opr)
    // end of [val]
  in
    $raise FatalError_cbv("unrecognized-operator")
  end // end of [rest]
//
end // end of [eval_cbv_opr]

(* ****** ****** *)

(* end of [lambda_term.dats] *)

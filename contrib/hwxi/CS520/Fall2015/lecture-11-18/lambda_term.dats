(* ****** ****** *)

staload "lambda.sats"

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
| TMvar(x) => fprint! (out, "TMvar(", x, ")")
| TMlam(x, t) => fprint! (out, "TMlam(", x, ", ", t, ")")
| TMapp(t1, t2) => fprint! (out, "TMapp(", t1, ", ", t2, ")")
)

(* ****** ****** *)

implement
FV (t0) =
(
case+ t0 of
| TMvar x => fvset_sing(x)
| TMlam (x1, t2) => fvset_rmv(FV(t2), x1)
| TMapp (t1, t2) => fvset_union(FV(t1), FV(t2))
)

(* ****** ****** *)

implement
subst0 (t0, x, sub) =
(
case+ t0 of
| TMvar(x1) => if x = x1 then sub else t0
| TMlam(x1, t1) =>
    if x = x1 then t0 else TMlam(x1, subst0(t1, x, sub))
  // end of [TMlam]
| TMapp(t1, t2) => TMapp(subst0(t1, x, sub), subst0(t2, x, sub))
)

(* ****** ****** *)

(* end of [lambda_term.dats] *)

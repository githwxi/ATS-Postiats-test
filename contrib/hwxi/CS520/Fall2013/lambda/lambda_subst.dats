(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
//
(* ****** ****** *)

staload "lambda.sats"

(* ****** ****** *)

staload "libats/ML/SATS/basis.sats"
staload "libats/ML/SATS/list0.sats"
staload _ = "libats/ML/DATS/list0.dats"

(* ****** ****** *)
//
// HX: [t2] is assumed to be closed
//
implement
subst (t1, x0, t2) = let
//
macdef sub (t) = subst (,(t), x0, t2)
macdef sublst (ts) = list0_map<term><term> (,(ts), lam t => sub (t))
//
in
//
case+ t1 of
| TMint _ => t1
| TMvar (x) => if x0 = x then t2 else t1
| TMlam (x, t11) =>
    if x0 = x then t1 else TMlam (x, sub (t11))
| TMfix (f, x, t11) =>
    if x0 = f then t1 else
      if x0 = x then t1 else TMfix (f, x, sub (t11))
    // end of [if]
| TMapp (t11, t12) => TMapp (sub (t11), sub (t12))
| TMopr (opr, ts) => TMopr (opr, sublst (ts))
| TMifnz (t11, t12, t13) => TMifnz (sub (t11), sub (t12), sub (t13))
//
end // end of [subst]

(* ****** ****** *)

(* end of [lambda_subst.dats] *)

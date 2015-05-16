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

implement
size (t0) =
(
case+ t0 of
| TMint _ => 1
| TMvar _ => 1
| TMlam (_, t) => 1 + size (t)
| TMfix (_, _, t) => 1 + size (t)
| TMapp (t1, t2) => 1 + size (t1) + size (t2)
| TMopr (opr, ts) =>
    list0_foldleft<term><int> (ts, 1, lam (res, t) => res + size (t))
| TMifnz (t1, t2, t3) => 1 + size (t1) + size (t2) + size (t3)
)

(* ****** ****** *)

(* end of [lambda_size.dats] *)

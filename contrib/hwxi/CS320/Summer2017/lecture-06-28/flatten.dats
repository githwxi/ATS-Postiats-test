(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
#include
"share/HATS/atspre_staload_libats_ML.hats"
//
(* ****** ****** *)
//
datatype tree =
| E | B of (tree, int, tree)
//
(* ****** ****** *)
//
fun
flatten
(
t0: tree
) : list0(int) =
(
case+ t0 of
| E() =>
  list0_nil()
| B(tl, x, tr) =>
  list0_append
  (flatten(tl), list0_cons(x, flatten(tr)))
)
//
(* ****** ****** *)

(*
Worst case:
T(n) = T(n-1) + O(n); T(n) = O(n^2)
Perfect tree case:
T(n) = 2*T(n/2) + O(n); T(n) = O(n(log(n)))
*)

(* ****** ****** *)

implement main0() = ()

(* ****** ****** *)

(* end of [flatten.dats] *)

(* ****** ****** *)
//
// Functions on arrays
//
(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
#include
"share/HATS/atspre_staload_libats_ML.hats"
//
(* ****** ****** *)
(*
//
fun{a:t@ype}
matrix_make_elt
  (nrows: int, ncol: int, x0: a): void
fun{a:t@ype}
matrix_get_at
  (M: matrix0(a), i: int, j: int): a
fun{a:t@ype}
matrix_set_at
  (M: matrix0(a), i: int, j: int, x0: a): void
//
*)
(* ****** ****** *)
//
extern
fun{a:t@ype}
mymatrix_foreach_cloref
  : (matrix0(a), (a) -<cloref1> void) -> void
extern
fun{a:t@ype}
mymatrix_iforeach_cloref
  : (matrix0(a), (int, int, a) -<cloref1> void) -> void
//
(* ****** ****** *)

implement
{a}(*tmp*)
mymatrix_foreach_cloref
  (M, fwork) = let
//
val nrow = sz2i(M.nrow())
val ncol = sz2i(M.ncol())
//
fun loop1(i: int): void =
  if i < nrow then loop2(i, 0) else ()
and loop2(i: int, j: int): void =
  if i < ncol then (fwork(M[i,j]); loop2(i,j+1)) else loop1(i+1)
//
in
  loop1(0)
end // end of [mymatrix_foreach_cloref]

(* ****** ****** *)

implement
{a}(*tmp*)
mymatrix_iforeach_cloref
  (M, fwork) = let
//
val nrow = sz2i(M.nrow())
val ncol = sz2i(M.ncol())
//
fun loop1(i: int): void =
  if i < nrow then loop2(i, 0) else ()
and loop2(i: int, j: int): void =
  if i < ncol then (fwork(i, j, M[i,j]); loop2(i,j+1)) else loop1(i+1)
//
in
  loop1(0)
end // end of [mymatrix_iforeach_cloref]

(* ****** ****** *)

(* end of [mymatrix.dats] *)

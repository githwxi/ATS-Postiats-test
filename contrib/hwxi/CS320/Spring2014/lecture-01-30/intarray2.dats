(* ****** ****** *)
//
// HX-2014-01-30:
// An abstract interface for integer 2D-arrays
//
(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
//
(* ****** ****** *)

staload "./intarray.sats"
staload "./intarray2.sats"

(* ****** ****** *)

assume intarray2 = '(intarray, int, int)

(* ****** ****** *)

implement
intarray2_make
  (nrow, ncol, x0) = let
  val A = intarray_make (nrow * ncol, x0) in '(A, nrow, ncol)
end // end of [intarray2_make]

(* ****** ****** *)

implement intarray2_get_nrow (A2) = A2.1
implement intarray2_get_ncol (A2) = A2.2

(* ****** ****** *)
//
// We use row-major representation
//
(* ****** ****** *)

implement
intarray2_get_at (A2, i, j) =
  let val ncol = A2.2 in intarray_get_at (A2.0, i*ncol+j) end
implement
intarray2_set_at (A2, i, j, x) =
  let val ncol = A2.2 in intarray_set_at (A2.0, i*ncol+j, x) end

(* ****** ****** *)

(* end of [intarray2.dats] *)

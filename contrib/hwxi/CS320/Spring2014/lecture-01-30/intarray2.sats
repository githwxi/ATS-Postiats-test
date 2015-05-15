(* ****** ****** *)
//
// HX-2014-01-30:
// An abstract interface for integer 2D-arrays
//
(* ****** ****** *)

abstype intarray2 = ptr

(* ****** ****** *)
//
fun intarray2_make
  (nrow: int, ncol: int, x0: int): intarray2
//
(* ****** ****** *)

fun intarray2_get_at (A: intarray2, i: int, j: int): int
fun intarray2_set_at (A: intarray2, i: int, j: int, x: int): void

(* ****** ****** *)

overload [] with intarray2_get_at // A[i,j]
overload [] with intarray2_set_at // A[i,j] := x

(* ****** ****** *)

fun intarray2_get_nrow (A: intarray2): int
fun intarray2_get_ncol (A: intarray2): int

(* ****** ****** *)

symintr .nrow .ncol
overload .nrow with intarray2_get_nrow
overload .ncol with intarray2_get_ncol

(* ****** ****** *)

fun print_intarray2 (intarray2): void
fun fprint_intarray2 (FILEref, intarray2): void

(* ****** ****** *)

overload print with print_intarray2
overload fprint with fprint_intarray2

(* ****** ****** *)

(* end of [intarray2.sats] *)

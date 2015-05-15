(* ****** ****** *)
//
// HX-2014-01-30:
// An abstract interface for integer arrays
//
(* ****** ****** *)

abstype intarray = ptr

(* ****** ****** *)

fun intarray_make (n: int, x0: int): intarray

(* ****** ****** *)
//
// O(1)-time functions
//
fun intarray_get_at (A: intarray, i: int): int
fun intarray_set_at (A: intarray, i: int, x: int): void

(* ****** ****** *)

overload [] with intarray_get_at // A[i]
overload [] with intarray_set_at // A[i] := x

(* ****** ****** *)

fun intarray_length (A: intarray): int

(* ****** ****** *)

overload length with intarray_length

(* ****** ****** *)
//
// HX:
// Some utility functions on integer arrays
//
(* ****** ****** *)

fun print_intarray (intarray): void
fun fprint_intarray (FILEref, intarray): void

(* ****** ****** *)

overload print with print_intarray
overload fprint with fprint_intarray

(* ****** ****** *)

fun intarray_sort (intarray): void

(* ****** ****** *)

(* end of [intarray.sats] *)

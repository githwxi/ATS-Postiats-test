(* ****** ****** *)
//
// HX-2014-01-30:
// An abstract interface for integer arrays
//
(* ****** ****** *)

#define ATS_DYNLOADFLAG 0

(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
//
(* ****** ****** *)

staload "./intarray.sats"

(* ****** ****** *)

extern
fun swap
  (A: intarray, i: int, j: int): void
extern
fun insord (A: intarray, i: int): void

(* ****** ****** *)

implement
intarray_sort (A) = let
//
val n = length (A)
//
fun loop (i: int): void =
  if i < n then (insord (A, i); loop (i+1)) else ()
//
in
  loop (1)
end // end of [intarray_sort]

(* ****** ****** *)

implement
swap (A, i, j) =
  let val tmp = A[i] in A[i] := A[j]; A[j] := tmp end

implement
insord (A, i) =
  if i > 0 then 
    if (A[i-1] > A[i]) then (swap (A, i-1, i); insord (A, i-1)) else ()
  // end of [if]

(* ****** ****** *)

(* end of [intarray_sort.dats] *)

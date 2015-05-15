(* ****** ****** *)
//
// HX-2014-01-30:
// Some array utility functions
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

(*
dynload "./intarray.sats"
*)
dynload "./intarray.dats"

(* ****** ****** *)

(*
dynload "./intarray2.sats"
*)
dynload "./intarray2.dats"

(* ****** ****** *)

fun tally
  (A: intarray): int = let
//
val n = intarray_length (A)
//
(*
fun aux (i: int): int =
  if i < n then A[i] + aux(i+1) else 0
*)
//
fun loop (i: int, res: int): int =
  if i < n then loop (i+1, res + A[i]) else res
//
in
  loop (0(*i*), 0(*res*))
end // end of [tally]

(* ****** ****** *)

implement
main0 () =
{
//
val A = intarray_make (10, 0)
//
val () = println! ("A = ", A)
//
val () = A[0] := 8
val () = A[1] := 1
val () = A[2] := 5
val () = A[3] := 9
val () = A[4] := 3
val () = A[5] := 2
val () = A[6] := 6
val () = A[7] := 4
val () = A[8] := 7
val () = A[9] := 0
//
val () = println! ("A = ", A)
//
val () = intarray_sort (A)
val () = println! ("A = ", A)
//
val () = println! ("tally(A) = ", tally(A))
//
val A2 = intarray2_make (10, 10, 0)
val () = println! ("A2 =\n", A2)
//
val () = A2[1, 1] := 1
val () = A2[2, 2] := 2
val () = A2[3, 3] := 3
val () = A2[4, 4] := 4
val () = A2[5, 5] := 5
val () = A2[6, 6] := 6
val () = A2[7, 7] := 7
val () = A2[8, 8] := 8
val () = A2[9, 9] := 9
//
val () = println! ("A2 =\n", A2)
//
} (* end of [main0] *)

(* ****** ****** *)

(* end of [test.dats] *)

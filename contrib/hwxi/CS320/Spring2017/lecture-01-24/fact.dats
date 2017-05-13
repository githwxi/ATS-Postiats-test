(* ****** ****** *)
//
// HX: how to compile:
//
// patscc -o fact fact.dats
//
(* ****** ****** *)

#include
"share/atspre_staload.hats"
#include
"share/HATS/atspre_staload_libats_ML.hats"

(* ****** ****** *)
//
extern
fun
fact(n: int): int
//
implement
fact(n) =
if
(n > 0)
then let
  val n1 = n - 1
in
  n * fact(n-1)
end // end of [then]
else 1 // end of [else]
//
(* ****** ****** *)
//
implement
main0() =
println! ("fact(10) = ", fact(10))
//
(* ****** ****** *)

(* end of [fact.dats] *)

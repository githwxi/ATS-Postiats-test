(* ****** ****** *)
//
// HX: how to compile:
//
// patscc -o fact2 fact2.dats
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
extern
fun
fact2(n: int, res: int): int
//
implement
fact(n) =
fact2(n, 1)
//
implement
fact2(n, res) =
if
(n > 0)
then let
  val n1 = n - 1
in
  fact2(n-1, n * res)
end // end of [then]
else res // end of [else]
//
(* ****** ****** *)
//
implement
main0() =
println! ("fact(10) = ", fact(10))
//
(* ****** ****** *)

(* end of [fact2.dats] *)

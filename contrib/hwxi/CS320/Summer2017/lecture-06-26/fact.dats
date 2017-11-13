(* ****** ****** *)

#include
"share/atspre_staload.hats"
#include
"share/HATS/atspre_staload_libats_ML.hats"

(* ****** ****** *)

extern
fun
fact(n: int): int

implement
fact(n) =
loop(0, 1) where
{
//
fun loop(i: int, res: int): int =
  if i < n then loop(i+1, res*(i+1)) else res
}

(* ****** ****** *)

implement
main0() = println! ("fact(10) = ", fact(10))

(* ****** ****** *)

(* end of [fact.dats] *)

//
// How to test:
// ./fact
//
// How to compile:
// patscc -o fact fact.dats
//
#include
"share/atspre_staload.hats"
//
extern fun fact (n: int): int
//
implement
fact(n) = let
//
fun
loop(n:int, res:int): int =
  if n > 0 then loop(n-1, n*res) else res
//
in
  loop(n, 1)
end // end of [fact]
//
implement main0 () =
{
//
val N = 1000000
val () = println! ("fact(", N, ") = ", fact(N))
val () = assertloc (fact(10) = 1 * 2 * 3 * 4 * 5 * 6 * 7 * 8 * 9 * 10)
//
} (* end of [main0] *)

(* ****** ****** *)

(* end of [fact.dats] *)

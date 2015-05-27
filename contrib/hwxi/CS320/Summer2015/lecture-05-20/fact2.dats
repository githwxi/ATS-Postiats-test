//
// How to test:
// ./fact2
//
// How to compile:
// patscc -o fact2 fact2.dats
//
#include
"share/atspre_staload.hats"
//
extern fun fact (n: int): int
extern fun fact2 (n: int, res: int): int
//
implement
fact(n) = fact2(n, 1)
//
implement
fact2(n, res) =
  if n > 0 then fact2(n-1, n*res) else res
//
implement main0 () =
{
//
val N = 1000000
val () = println! ("fact(", N, ") = ", fact(N))
// val () = assertloc (fact(N) = 1 * 2 * 3 * 4 * 5 * 6 * 7 * 8 * 9 * 10)
//
} (* end of [main0] *)

(* ****** ****** *)

(* end of [fact2.dats] *)

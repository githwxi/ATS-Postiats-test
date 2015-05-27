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
fact(n) = if n > 0 then n * fact(n-1) else 1
//
implement main0 () =
{
//
val N = 10
val () = println! ("fact(", N, ") = ", fact(N))
val () = assertloc (fact(N) = 1 * 2 * 3 * 4 * 5 * 6 * 7 * 8 * 9 * 10)
//
} (* end of [main0] *)

(* ****** ****** *)

(* end of [fact.dats] *)

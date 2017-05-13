(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
//
(* ****** ****** *)
//
#staload "./while-loop.dats"
//
(* ****** ****** *)

fun
try_fact(): int = let
//
val fact =
fix f(n:int): int =>
  if n > 0 then n * f(n-1) else 1
//
in
  while_loop(lam(i) => fact(i) != 0)
end // end of [try_fact]

(* ****** ****** *)
//
implement
main0((*void*)) =
{
val () = println! ("try_fact() = ", try_fact())
} (* end of [main0] *)
//
(* ****** ****** *)

(* end of [test-while-loop.dats] *)

(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
//
#staload "./for-loop.dats"
//
(* ****** ****** *)

implement main0() =
{
val () = for_loop(10, lam(i) => println!(i))
}

(* ****** ****** *)

(* end of [test-for-loop.dats] *)
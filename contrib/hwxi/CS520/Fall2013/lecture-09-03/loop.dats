//
// implementing a loop
//
(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
//
(* ****** ****** *)

fun loop
  (n: int): void =
  if n > 0 then (println! ("Hello from loop(", n, ")!"); loop (n-1)) else ()
// end of [loop]

(* ****** ****** *)

implement main0 ((*void*)) = loop (10)

(* ****** ****** *)

(* end of [loop.dats] *)

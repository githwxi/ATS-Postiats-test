(* ****** ****** *)

#include
"share/atspre_staload.hats"

(* ****** ****** *)
//
fun f(x: int): int =
  if x >= 0 then f(x+1) else x
//
(* ****** ****** *)

implement
main0() = println! ("f(0) = ", f(0))

(* ****** ****** *)

(* end of [quiz_test.dats] *)

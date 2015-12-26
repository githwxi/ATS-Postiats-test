(* ****** ****** *)
//
// Code for lecture-09-14
//
(* ****** ****** *)

#include "share/atspre_staload.hats"

(* ****** ****** *)

fun
find_root
  (f: int -> int): int = let
//
fun loop (n: int): int =
  if f(n) = 0 then n else loop(n+1)
//
in
  loop(0)
end // end of [find_root]

(* ****** ****** *)

val n = find_root(lam (x) => x**2 - x - 110)

(* ****** ****** *)

implement main0 () = println! ("n = ", n)

(* ****** ****** *)

(* end of [higher-order.dats] *)

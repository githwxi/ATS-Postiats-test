(*
** lecture-05-27
*)

(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
//
(* ****** ****** *)

extern
fun power2 (n: int): int

(* ****** ****** *)
(*
//
implement
power2(n) =
  if n > 0 then power2(n-1) + power2(n-1) else 1
//
*)
//
implement
power2(n) = if n > 0 then 2 * power2(n-1) else 1
//
(* ****** ****** *)

implement
main0() =
{
//
val power2_10 = power2(10)
//
val ((*void*)) = println! ("power2_10 = ", power2_10)
//
} (* end of [main0] *)

(* ****** ****** *)

(* end of [power.dats] *)

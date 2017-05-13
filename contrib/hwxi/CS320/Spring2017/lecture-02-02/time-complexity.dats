(*
** HX: an example used in class
*)

(* ****** ****** *)

#include "share/atspre_staload.hats"

(* ****** ****** *)
//
// HX: T(n) is approaximately sqrt(n)
//
fun T(n: int): int = if n >= 2 then 2*T(n/4) else 1
//
(* ****** ****** *)

implement
main0((*void*)) =
{
//
val () = println! ("T(100) = ", T(100))
val () = println! ("T(10000) = ", T(10000))
val () = println! ("T(1000000) = ", T(1000000))
//
} (* end of [main0] *)

(* ****** ****** *)

(* end of [tmie-complexity.dats] *)
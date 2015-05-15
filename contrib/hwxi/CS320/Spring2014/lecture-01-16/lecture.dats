//
// lecture-01-16
//
(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
//
(* ****** ****** *)

val PI = 3.1416
val radius = 3.0
val area = PI * radius * radius
val () = println! ("area = ", area)

(* ****** ****** *)

fun square (x: int): int = x * x

(* ****** ****** *)

fun
square_float (x: double): double = x * x

(* ****** ****** *)

fun area_of_circle
  (rad: double): double = PI*square_float(rad)

(* ****** ****** *)
//
fun sumup (n: int): int =
  if n > 0 then n + sumup (n-1) else 0
//
(* ****** ****** *)

implement
main0 () = () where
{
//
val () = assertloc (square(10) = 10*10)
//
val () = assertloc (sumup(10) = 10*11/2)
//
} (* end of [main0] *)

(* ****** ****** *)

(* end of [lecture.dats] *)

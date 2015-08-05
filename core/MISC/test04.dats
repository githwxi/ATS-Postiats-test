(*
** Factorials
*)

(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
//
(* ****** ****** *)
//
fun
fact(n:int):int=if n>0 then n*fact(n-1) else 1
//
val () = assertloc(fact(10)=1*2*3*4*5*6*7*8*9*10)
//
(* ****** ****** *)

val x = 10

(* ****** ****** *)

val () = assertloc(1 = x**0)
val () = assertloc(x = x**1)
val () = assertloc(~x**2 < 0)
val () = assertloc(2*x*x*x = 2*x**3)
val () = assertloc(x*x*x*x = x**2 * x**2)

(* ****** ****** *)

val x = 10.0

(* ****** ****** *)
//
#define EPSILON 1E-6
//
fun
double_equal
  (x:double, y:double): bool = abs(x-y) < EPSILON
//
overload = with double_equal of 1000
//
(* ****** ****** *)

val () = assertloc(1.0 = x**0)
val () = assertloc(1*x = x**1)
val () = assertloc(~x**2 < 0.0)
val () = assertloc(2*x*x*x = 2*x**3)
val () = assertloc(x*x*x*x = x**2 * x**2)

(* ****** ****** *)

implement main0() = ((*void*))

(* ****** ****** *)

(* end of [test04.dats] *)

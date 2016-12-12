(* ****** ****** *)
//
// HX-2016-11-07:
//
// Encoding some lambda-terms
//
(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
//
(* ****** ****** *)
//
val
double = lam(x:int): int => x + x
val
app_double_10 = double(10)
//
val my_app = lam (f: int -> int): int -<cloref1> int => lam (x: int): int => f(x)
val my_app_double : int -<cloref1> int = my_app(double)
//
(* ****** ****** *)

val () = println! ("my_app_double(10) = ", my_app_double(10))

(* ****** ****** *)

implement main0 () = ()

(* ****** ****** *)

(* end of [testing.dats] *)

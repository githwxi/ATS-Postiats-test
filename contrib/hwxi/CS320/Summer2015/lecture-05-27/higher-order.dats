(*
** Higher-order functions
*)

(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
//
(* ****** ****** *)

val plus1 = (lam(x:int) => x+1)

(* ****** ****** *)

val x = 10
val x1 = plus1(x)
val () = println! ("x1 = ", x1)

(* ****** ****** *)

implement main0 () = ()

(* ****** ****** *)

(* end of [higher-order.dats] *)

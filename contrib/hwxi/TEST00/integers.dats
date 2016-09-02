(* ****** ****** *)

(*
**
** HX-2016-08-20:
** For testing operations on
** integers of different sizes
**
*)

(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
//
(* ****** ****** *)
//
staload UN = $UNSAFE
//
(* ****** ****** *)

val x = $UN.cast{sint}(10)
val y = $UN.cast{sint}(10)
val () = println!("x + y = ", $UN.cast{int}(x+y))

(* ****** ****** *)

implement main0 () = ()

(* ****** ****** *)

(* end of [integers.dats] *)

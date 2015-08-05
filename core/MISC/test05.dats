(*
** Testing prelude/grandom
*)

(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
//
staload
TIME = "libc/SATS/time.sats"
staload
STDLIB = "libc/SATS/stdlib.sats"
//
(* ****** ****** *)

implement
grandom_int<> () =
  $UNSAFE.cast{int}($STDLIB.random()) % 10

(* ****** ****** *)

val () = $STDLIB.srandom($UNSAFE.cast($TIME.time()))

(* ****** ****** *)
//
val xs = grandom_list<int>(10)
val ys = grandom_list<int>(20)
//
val () = println! ("xs = ", xs)
val () = println! ("ys = ", ys)
//
val () = assertloc(length(xs)+length(ys) = length(list_append(xs, ys)))
//
(* ****** ****** *)

implement main0() = ((*void*))

(* ****** ****** *)

(* end of [test01.dats] *)

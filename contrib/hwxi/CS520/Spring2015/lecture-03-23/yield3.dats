(*
** A demo for
** template-based late-binding
*)

(* ****** ****** *)
//
// How to compile:
// patscc -o yield3 yield3.dats
//
(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
//
(* ****** ****** *)

extern
fun{} yield (): void
extern
fun{} yield3 (): void

(* ****** ****** *)
//
implement
yield<> () =
  println! ("Hello, there!")
//
(* ****** ****** *)

implement
{}(*tmp*)
yield3() = (yield(); yield(); yield())

(* ****** ****** *)

implement
main0 () =
{
//
local
//
implement
yield<> () =
  println! ("What is your name?")
//
in(*in-of-local*)
val () = yield3()
end // end of [local]
//
val () = yield3()
//
} (* end of [main0] *)

(* ****** ****** *)

(* end of [yield3.dats] *)

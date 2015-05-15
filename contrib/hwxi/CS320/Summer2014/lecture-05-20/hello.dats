#include
"share/atspre_staload.hats"

(* ****** ****** *)

(*
//
How to compile:
patscc -o hello hello.dats
//
How to test: ./hello
//
*)

(* ****** ****** *)

(*
main0: () -> void
*)

implement
main0 () = {
  val () = print! ("Hello, world!\n")
  val () = println! ("Hello, world!")
} (* end of [main0] *)

(* ****** ****** *)

(* end of [hello.dats] *)

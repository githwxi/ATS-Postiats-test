//
// How to test:
// ./hello
//
// How to compile:
// patscc -o hello hello.dats
//
#include
"share/atspre_staload.hats"
//
extern fun hello(): void
//
implement
hello() = print("Hello, world!\n")
//
implement main0 () = (hello(); hello())

(* ****** ****** *)

(* end of [hello.dats] *)

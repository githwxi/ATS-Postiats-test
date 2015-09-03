(*
** Code used for lecture-09-02
*)
//
// How to compile:
// patscc -o hello hello.dats
// How to test: ./hello
//
extern
fun
hello_from
  (name: string): void // fun declaration
//
implement // fun implementation
hello_from(name) = println!("Hello from ", name)
//
implement main0 () = hello_from("Hongwei")
//
(* ****** ****** *)

(* end of [hello.dats] *)



(* ****** ****** *)
//
// HX: how to compile:
//
// patscc -o fact fact.dats
//
(* ****** ****** *)
//
// HX:
// It tells the compiler
// where to find library functions
//
#include
"share/atspre_staload.hats"
//
(* ****** ****** *)

(*
/*
// fun fact(n: int): int
*/
*)

(* ****** ****** *)

(*
fun fact: (int) -> int
fun fact2 : (int, int) -> int
*)

(* ****** ****** *)

extern
fun
fact: (int) -> int

implement
fact(n) =
if n > 0 then n * fact(n-1) else 1

(* ****** ****** *)

implement
main0() = println! ("fact(10) = ", fact(10))

(* ****** ****** *)

(* end of [fact.dats] *)

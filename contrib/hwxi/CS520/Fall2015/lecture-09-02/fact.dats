(*
** Code used for lecture-09-02
*)
//
// How to compile:
// patscc -o fact fact.dats
// How to test: ./fact
//
(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
//
(*
** fact(n) = 1 * 2 * 3 ... * n
*)
//
// HX:
// [fact] is not tail-recursive
//
extern
fun fact : int -> int
implement
fact(n) = if n > 0 then n * fact(n-1) else 1

(* ****** ****** *)
//
// HX: [fact2] is tail-recursive
//
extern
fun fact2 : (Nat, int) -> int
implement
fact2(n, res) = if n > 0 then fact2(n-1, n*res) else res

(* ****** ****** *)

implement
main0() =
{
  val () = println! ("fact(", 10, ") = ", fact(10))
  val () = println! ("fact2(", 10, ", ", 1, ") = ", fact2(10, 1))
}

(* ****** ****** *)

(* end of [fact.dats] *)

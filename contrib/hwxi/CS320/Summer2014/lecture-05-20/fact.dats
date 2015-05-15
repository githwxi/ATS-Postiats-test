#include
"share/atspre_staload.hats"

(* ****** ****** *)

(*
//
How to compile:
patscc -o fact fact.dats
//
How to test: ./fact
//
*)

(* ****** ****** *)

(*
extern fun fact : int -> int
*)
extern fun fact (x: int): int

(* ****** ****** *)

(*

implement
fact (n) =
  if n > 0 then fact (n-1) * n else 1
// end of [fact]

*)

(* ****** ****** *)

(*
// tail-recursive call
*)

fun fact2 (n: int, res: int): int =
  if n > 0 then fact2 (n-1, n * res) else res
  

(* ****** ****** *)

implement fact (n) = fact2 (n, 1)

(* ****** ****** *)

implement
main0 () = {
//
val N = 10
val result = fact (N)
val () = println! ("fact(", N, ") = ", result)
//
} (* end of [main0] *)

(* ****** ****** *)

(* end of [fact.dats] *)

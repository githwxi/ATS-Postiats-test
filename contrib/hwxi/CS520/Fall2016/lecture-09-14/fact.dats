(* ****** ****** *)

#include
"share/atspre_define.hats" // defines some names
#include
"share/atspre_staload.hats" // for targeting C
#include
"share/HATS/atspre_staload_libats_ML.hats" // for ...

(* ****** ****** *)

extern
fun
fact : int -> int

(* ****** ****** *)

(*
implement
fact(n) =
if n > 0 then n * fact(n-1) else 1
*)

(* ****** ****** *)
//
// HX: this one is tail-recursive
//
implement
fact(n) = let
//
fun
loop(n: int, res: int): int =
  if n > 0 then loop(n-1, n*res) else res
//
in
  loop(n, 1)
end // end of [fact]
//
(* ****** ****** *)

implement
main0() = () where
{
//
val N = 1000000
val () = println! ("fact(", N, ") = ", fact(N))
//
} (* end of [main0] *)

(* ****** ****** *)

(* end of [fact.dats] *)


(* ****** ****** *)

#include "share/atspre_staload.hats"

(* ****** ****** *)

(*

int fact(int n)
{
  int res = 1 ;
  // assert(n >= 0);
  while(n > 0) { res = n * res; n = n - 1; }
  return res ;
}

*)

(* ****** ****** *)

(*
extern
fun fact(n: int): int
*)
extern
fun fact : int -> int

implement
fact(n) = if n > 0 then n * fact(n-1) else 1

(* ****** ****** *)

implement
main0() = println! ("fact(10) = ", fact(10))

(* ****** ****** *)

(* end of [fact.dats] *)

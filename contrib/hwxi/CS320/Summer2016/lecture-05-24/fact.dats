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
//
// Let's implement [fact] in a tail-recursive
// (iterative) manner
//
(* ****** ****** *)
//
extern
fun fact_tr : int -> int
extern
fun fact_tr_loop : (int, int) -> int
//
implement
fact_tr(n) = fact_tr_loop(n, 1)
implement
fact_tr_loop(n, res) =
  if n > 0 then fact_tr_loop(n-1, n*res) else res
//
(* ****** ****** *)

(*
val N = 1000000
*)

#define N 1000000

implement
main0() = println! ("fact_tr(N) = ", fact_tr(N))

(* ****** ****** *)

(* end of [fact.dats] *)

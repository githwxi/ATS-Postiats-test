(* ****** ****** *)
//
// Lecture-12-03-2013
//
(* ****** ****** *)
//
// Continuation-Passing Style
//
(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
//
(* ****** ****** *)
//
// How to compile:
//
// patscc -cleanaft -DATS_MEMALLOC_LIBC -o CPS_fact_fib CPS_fact_fib.dats
//
(* ****** ****** *)

typedef K (a:t@ype, b:t@ype) = (a) -<cloref1> b

(* ****** ****** *)

fun fact (n: int): int =
  if n > 0 then n * fact (n-1) else 1

fun kfact (n: int, k: K(int, int)): int =
  if n > 0 then kfact (n-1, lam res => k(n * res)) else k(1)

val N = 5
val () = println! ("fact(", N, ") = ", fact(N))
val K0 = (lam res => res): K(int, int)
val () = println! ("kfact(", N, ") = ", kfact(N, K0))

(* ****** ****** *)

fun fib (n: int): int =
  if n >= 2 then fib(n-1) + fib(n-2) else n

fun kfib (n: int, k: K(int, void)): void =
  if n >= 2 then
    kfib (n-1, lam res1 => kfib (n-2, lam res2 => k(res1+res2)))
  else
    k (n)

val N = 10
val () = println! ("fib(", N, ") = ", fib(N))

fun Kf (res:int): void =
  println! ("kfib(", N, ") = ", res)

val K0 = (lam res => Kf (res)): K(int, void)

val () = kfib (N, K0)

(* ****** ****** *)

implement main0 () = ()

(* ****** ****** *)

(* end of [CPS_fact_fib.dats] *)

//
// Code used in CS520, Fall, 2013
//
(* ****** ****** *)
(*
// Lazy-evaluation:
// Erathosthene's sieve for primes
*)
(* ****** ****** *)
//
// Author: Hongwei Xi
// Authoremail: gmhwxiATgmailDOTcom
// Start time: September, 2007
//
(* ****** ****** *)

(*
** Ported to ATS2 by HX-2013-09
*)

(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
//
(* ****** ****** *)

#define :: stream_cons
#define cons stream_cons
#define nil stream_nil

(* ****** ****** *)
//
fun from (n:int)
  : stream (int) = $delay (cons{int}(n, from (n+1)))
//
(* ****** ****** *)

fun sieve (
  ns: stream int
) : stream (int) = $delay
(
let
  val-cons(n, ns) = !ns
in
  cons{int}(n, sieve (stream_filter_cloref<int> (ns, lam x => x mod n > 0)))
end
) // end of [$delay] // end of [sieve]

//

val primes: stream (int) = sieve (from(2))

//

fun prime_get (n: intGte(0)): int = stream_nth_exn (primes, n)

//

implement
main0 () =
(
println! ("prime 1000 = ", prime_get (1000)) ; // = 7927
) // end of [main0]

(* ****** ****** *)

(* end of [sieve.dats] *)

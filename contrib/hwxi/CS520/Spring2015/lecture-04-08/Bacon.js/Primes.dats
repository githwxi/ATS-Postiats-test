(*
** FRP via Bacon.js
*)

(* ****** ****** *)

#define ATS_MAINATSFLAG 1
#define ATS_DYNLOADNAME "my_dynload"

(* ****** ****** *)
//
#include
"share/atspre_define.hats"
//
(* ****** ****** *)
//
#include
"{$LIBATSCC2JS}/staloadall.hats"
//
(* ****** ****** *)
//
staload
"{$LIBATSCC2JS}/SATS/Bacon.js/baconjs.sats"
//
(* ****** ****** *)
//
extern
fun
EStream_map_stream
  {a,b:t0p}
  (xs: EStream(a), ys: stream(b)): EStream(b)
//
(* ****** ****** *)

implement
EStream_map_stream
  {a,b}(xs, ys) = let
//
val rys = ref{stream(b)}(ys)
//
fun
fopr
(
  x: a
) : b = y where
{
  val ys = rys[]
  val-stream_cons(y, ys) = !ys
  val () = rys[] := ys
}
//
in
  EStream_map{a}{b}(xs, lam(x) => fopr(x))
end // end of [EStream_map_stream]

(* ****** ****** *)

#define :: stream_cons
#define cons stream_cons
#define nil stream_nil

(* ****** ****** *)
//
fun
from{n:int} (n: int n)
  :<!laz> stream (intGte(n)) = $delay (cons{intGte(n)}(n, from (n+1)))
//
(* ****** ****** *)

typedef N2 = int

(* ****** ****** *)

fun sieve
(
  ns: stream N2
) :<!laz>
  stream (N2) = $delay
(
let
  val-cons(n, ns) = !ns
in
  cons{N2}(n, sieve (stream_filter_cloref{N2}(ns, lam x => (x%n) > 0)))
end : stream_con (N2)
) // end of [sieve]

//

val thePrimes: stream (N2) = sieve (from(2))

(* ****** ****** *)

%{^
//
var
theClicks = $("#next").asEventStream("click")
//
var thePrimes = 0
//
%} // end of [%{^]

(* ****** ****** *)
//
val theClicks =
  $extval(EStream(void), "theClicks")
//
val thePrimes =
  EStream_map_stream(theClicks, thePrimes)
//
extvar "thePrimes" = thePrimes
//
(* ****** ****** *)

%{$
//
function
Primes_initize()
{
var _ = my_dynload()
var _ = thePrimes.assign($("#theCurrentPrime"), "text")
}
//
jQuery(document).ready(function(){Primes_initize();});
//
%} // end of [%{$]

(* ****** ****** *)

(* end of [Primes.dats] *)

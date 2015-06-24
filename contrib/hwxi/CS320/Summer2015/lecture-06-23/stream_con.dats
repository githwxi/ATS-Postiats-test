//
#include
"share/atspre_define.hats"
#include
"share/atspre_staload.hats"
#include
"share/HATS/atspre_staload_libats_ML.hats"
//
(* ****** ****** *)
//
val theNats_0 = stream_tabulate_fun<int> (lam n => n)
val theNats_2 = stream_tabulate_fun<int> (lam n => n+2)
//
val theSquares_0 = stream_map_fun(theNats_0, lam n => n * n)
//
(* ****** ****** *)

fun
sieve
(
  xs: stream(int)
) : stream(int) = $delay
(
let
  val-stream_cons(x0, xs2) = !xs
in
  stream_cons(x0, sieve(stream_filter_cloref(xs2, lam (x) => x mod x0 > 0)))
end
)

(* ****** ****** *)

val thePrimes = sieve(theNats_2)

(* ****** ****** *)

val ps = stream_take_exn(thePrimes, 100)
val ps = list_vt2t(ps)

(* ****** ****** *)

val () = println! ("The first 100 primes are:\n", ps)

(* ****** ****** *)

implement main0 () = ()

(* ****** ****** *)

(* end of [stream_con.dats] *)

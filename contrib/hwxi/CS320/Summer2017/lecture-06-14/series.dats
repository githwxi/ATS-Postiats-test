(* ****** ****** *)

#include
"share/atspre_staload.hats"
#include
"share/HATS/atspre_staload_libats_ML.hats"

(* ****** ****** *)

extern
fun
{a:t@ype}
tabulate(f: (int) -<cloref1> a): stream(a)

(* ****** ****** *)

implement
{a}
tabulate(f) =
auxmain(0) where
{
fun
auxmain
(state: int): stream(a) = $delay
(
  stream_cons(f(state), auxmain(state+1))
)
}

(* ****** ****** *)

val
harmonic = tabulate<double>(lam(n) => 1.0/(n+1))

(* ****** ****** *)

extern
fun
{a:t@ype}
tabulate_series(f: (int) -<cloref1> a): stream(a)

(* ****** ****** *)

implement
{a}
tabulate_series
  (fopr) =
(
auxmain(0, gnumber_int<a>(0)) where
{
fun
auxmain
(n: int, psum: a): stream(a) = $delay
(
  stream_cons(psum, auxmain(n+1, gadd_val_val<a>(psum, fopr(n))))
)
}
)

(* ****** ****** *)

val
harmonic_series =
tabulate_series<double>(lam(n) => 1.0/(n+1))

(* ****** ****** *)

val psum_1M = harmonic_series[1000000]

(* ****** ****** *)

val () = println! ("psum_1M = ", psum_1M)

(* ****** ****** *)

implement main0() = ()

(* ****** ****** *)

(* end of [series.dats] *)

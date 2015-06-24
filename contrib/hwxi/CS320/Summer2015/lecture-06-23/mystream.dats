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
datatype
mystream(a:t@ype) =
  mystream_cons of (a, () -<cloref1> mystream(a))
//
(* ****** ****** *)
//
fun
from(n: int): mystream(int) =
  mystream_cons(n, lam () => from(n+1))
//
(* ****** ****** *)

val intFrom0 = from(0)

(* ****** ****** *)

fun
{a:t@ype}
{b:t@ype}
mystream_map
(
  xs: mystream(a)
, f: a -<cloref1> b
) : mystream(b) = let
//
val mystream_cons(x, fxs) = xs
//
in
  mystream_cons(f(x), lam () => mystream_map(fxs(), f))
end // end of [mystream_map]

(* ****** ****** *)

val intSqFrom0 = mystream_map (intFrom0, lam x => x * x)

(* ****** ****** *)
//
fun
{a:t@ype}
mystream_filter
(
  xs: mystream(a), pred: (a) -<cloref1> bool
) : mystream(a) = let
//
val mystream_cons(x, fxs) = xs
//
in
//
if
pred(x)
then mystream_cons(x, lam() => mystream_filter(fxs(), pred))
else mystream_filter(fxs(), pred)
//
end // end of [mystream_filter]

(* ****** ****** *)

fun
sieve
(
  xs: mystream(int)
) : mystream(int) = let
//
val+mystream_cons(x0, fxs) = xs
//
in
//
mystream_cons
(
  x0
, lam() => sieve(mystream_filter(fxs(), lam x => x mod x0 > 0))
)
end // end of [sieve]

(* ****** ****** *)

val thePrimes = sieve(from(2))

(* ****** ****** *)

val () =
loop(10, thePrimes) where
{
//
fun loop(i: int, xs: mystream(int)): void =
  if i > 0 then let
    val mystream_cons(x, fxs) = xs
    val () = println! (10-i, ": ", x)
  in
    loop(i-1, fxs())
  end
//
}

(* ****** ****** *)

implement main0 () = ()

(* ****** ****** *)

(* end of [mystream.dats] *)

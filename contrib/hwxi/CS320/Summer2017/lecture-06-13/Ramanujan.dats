(* ****** ****** *)

#include
"share/atspre_staload.hats"
#include
"share/HATS/atspre_staload_libats_ML.hats"

(* ****** ****** *)

typedef int2 = $tup(int, int)

(* ****** ****** *)

extern
fun
diagnal(n: int): stream(int2)

(* ****** ****** *)

implement
diagnal(n) =
auxmain(0) where
{
//
fun
auxmain
(
i: int
): stream(int2) = $delay
(
if
i <= n
then
(
stream_cons($tup(i, n-i), auxmain(i+1))
)
else stream_nil()
// end of [if]
)
} (* end of [diagnal] *)

(* ****** ****** *)

fun
diagnals
(
n: int
): stream(stream(int2)) = $delay
(
stream_cons(diagnal(n), diagnals(n+1))
)

(* ****** ****** *)

val
theInt2 =
stream_concat<int2>(diagnals(0))

val
theInt2_lte =
stream_filter_cloref<int2>(theInt2, lam(xy) => (xy.0 <= xy.1))

(* ****** ****** *)

macdef cube(x) = let val x = ,(x) in x * x * x end

(* ****** ****** *)

val
theInt_cubesum =
stream_map_cloref<int2><int>
  (theInt2_lte, lam($tup(x, y)) => cube(x) + cube(y))

(* ****** ****** *)

#define N 1000

(* ****** ****** *)
//
extern
fun
search
(x0: int, xs: stream(int)): bool
//
(* ****** ****** *)

implement
search(x0, xs) =
loop(xs, 0) where
{
fun
loop
(xs: stream(int), n: int): bool =
if
(n < N)
then
(
case+ !xs of
| stream_nil() => false
| stream_cons(x, xs) => if x0 = x then true else loop(xs, n+1)
)
else false
} (* end of [search] *)

(* ****** ****** *)

val
theRamanujans =
auxmain(theInt_cubesum) where
{
fun
auxmain
(
xs: stream(int)
) : stream(int) = $delay
(
let
  val-stream_cons(x0, xs) = !xs
in
//
  if
  search(x0, xs)
  then stream_cons(x0, auxmain(xs)) else !(auxmain(xs))
//
end
)
} (* end of [theRamanujans] *)

(* ****** ****** *)

val () =
fprint_stream(stdout_ref, theRamanujans, 20)

(* ****** ****** *)

implement main0() = ()

(* ****** ****** *)

(* end of [Ramanujan.dats] *)

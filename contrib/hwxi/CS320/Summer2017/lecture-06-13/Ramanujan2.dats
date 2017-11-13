(* ****** ****** *)

#include
"share/atspre_staload.hats"
#include
"share/HATS/atspre_staload_libats_ML.hats"

(* ****** ****** *)

typedef
int2 = $tup(int, int)

(* ****** ****** *)
//
macdef
cube(x) =
let val x = ,(x) in x*x*x end
//
(* ****** ****** *)

extern
fun cubesum_row(i: int): stream(int)
and cubesum_rows(i: int): stream(int)

(* ****** ****** *)

implement
cubesum_row(i) =
auxmain(i) where
{
fun
auxmain(j: int): stream(int) = $delay
(
  stream_cons(cube(i) + cube(j), auxmain(j+1))
)
}

(* ****** ****** *)

implement
cubesum_rows(i) = $delay
(
let
  val-stream_cons(x0, xs) = !(cubesum_row(i))
in
//
stream_cons
( x0
, stream_merge_cloref(xs, cubesum_rows(i+1), lam(x1, x2) => compare(x1, x2))
) (* stream_cons *)
//
end
)

(* ****** ****** *)

val
theInt_cubesum = cubesum_rows(0)

(* ****** ****** *)

extern
fun
eliminate
(xs: stream(int)): stream(int)

(* ****** ****** *)

local

fun
sieve
(
xs: stream(int)
) : stream(int) = $delay
(
let
//
val-
stream_cons(x0, xs) = !xs
val xs =
stream_filter_cloref(xs, lam(x) => x % x0 > 0)
//
in
  stream_cons(x0, sieve(xs))
end
) (* end of [sieve] *)

val
thePrimes =
sieve
(
(fix f(i: int): stream(int) => $delay(stream_cons(i, f(i+1))))(2)
) (* end of [sieve] *)

fun
diffr
(
xs: stream(int),
ys: stream(int)
) : stream(int) = $delay
(
case+ !xs of
| stream_nil() => stream_nil()
| stream_cons(x0, xs1) =>
  (
    case+ !ys of
    | stream_nil() => !(xs)
    | stream_cons(y0, ys1) =>
      if x0 < y0
        then stream_cons(x0, diffr(xs1, ys))
        else (if y0 < x0 then !(diffr(xs, ys1)) else !(diffr(xs1, ys1)))
      // end of [if]  
  )
)

in (* in-of-local *)

implement
eliminate(xs) = $delay
(
let
  val-
  stream_cons(x0, xs) = !xs
  val xs = diffr(xs, stream_map_cloref<int><int>(thePrimes, lam(p) =<cloref> cube(p)*x0))
in
  stream_cons(x0, eliminate(xs))
end
)

end // end of [local]

(* ****** ****** *)

val
theRamanujans =
dupsearch(theInt_cubesum) where
{
fun
dupsearch
(
xs: stream(int)
) : stream(int) = $delay
(
let
  val-stream_cons(x1, xs1) = !xs
  val-stream_cons(x2, xs2) = !xs1
(*
  val () = println! ("x1 = ", x1)
  val () = println! ("x2 = ", x2)
*)
in
  if x1 < x2 then !(dupsearch(xs1)) else stream_cons(x1, dupsearch(xs1))
end
)
}

(* ****** ****** *)

val
theRamanujans =
eliminate(theRamanujans)

(* ****** ****** *)
//
val () =
fprint_stream(stdout_ref, theRamanujans, 20)
//
(* ****** ****** *)

implement main0() = ((*void*))

(* ****** ****** *)

(* end of [Ramanujan2.dats] *)

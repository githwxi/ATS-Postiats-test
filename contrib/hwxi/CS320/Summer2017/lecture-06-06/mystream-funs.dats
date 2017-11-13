(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
#include
"share/HATS\
/atspre_staload_libats_ML.hats"
//
(* ****** ****** *)
//
extern
fun
{a:t@ype}
mystream_length(xs: stream(a)): int
//
(* ****** ****** *)

implement
{a}
mystream_length(xs) =
(
case+ !xs of
| stream_nil() => 0
| stream_cons(_, xs) => 1+mystream_length<a>(xs)
)

(* ****** ****** *)
//
extern
fun
{a:t@ype}
mystream_append
  : (stream(a), stream(a)) -> stream(a)
//
(* ****** ****** *)

implement
{a}
mystream_append
  (xs, ys) = $delay
(
case+ !xs of
| stream_nil() => !ys
| stream_cons(x, xs) =>
  stream_cons(x, mystream_append<a>(xs, ys))
)

(* ****** ****** *)
//
extern
fun
{a:t@ype}
{b:t@ype}
mystream_map
  (xs: stream(a), fopr: (a) -<cloref1> b): stream(b)
//
(* ****** ****** *)

implement
{a}{b}
mystream_map
  (xs, fopr) = $delay
(
case+ !xs of
| stream_nil() =>
  stream_nil()
| stream_cons(x, xs) =>
  stream_cons
  ( fopr(x)
  , mystream_map<a><b>(xs, fopr))
)

(* ****** ****** *)
//
extern
fun
{a:t@ype}
mystream_filter
( xs: stream(a)
, test: (a) -<cloref1> bool): stream(a)
//
(* ****** ****** *)

implement
{a}
mystream_filter
  (xs, test) = $delay
(
case+ !xs of
| stream_nil() =>
  stream_nil()
| stream_cons(x, xs) =>
  if test(x)
    then
    stream_cons
      (x, mystream_filter<a>(xs, test))
    // then
    else !(mystream_filter<a>(xs, test))
  // end of [if]
)

(* ****** ****** *)

implement main0() = ()

(* ****** ****** *)

(* end of [mystream-funs.dats] *)

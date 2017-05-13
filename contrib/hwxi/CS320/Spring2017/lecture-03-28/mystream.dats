(* ****** ****** *)
(*
** mystream
*)
(* ****** ****** *)

extern
fun
{a:t@ype}
mystream_append
(
xs: stream(a), ys: stream(a)
) : stream(a)

implement
{a}
mystream_append
  (xs, ys) =
  auxmain(xs, ys) where
{
//
fun
auxmain
(
xs: stream(a), ys: stream(a)
) : stream(a) = $delay
(
  case+ !xs of
  | stream_nil() => !ys
  | stream_cons(x, xs) => stream_cons(x, auxmain(xs, ys))
)
} (* end of [mystream_append] *)

(* ****** ****** *)

extern
fun
{a:t@ype}
mystream_filter
(
xs: stream(a), test: (a) -<cloref1> bool
) : stream(a)

implement
{a}
mystream_filter
  (xs, test) =
  auxmain(xs) where
{
fun
auxmain
(
xs: stream(a)
) : stream(a) = $delay
(
case+ !xs of
| stream_nil() => stream_nil()
| stream_cons(x, xs) =>
  if test(x)
    then stream_cons(x, auxmain(xs)) else !(auxmain(xs))
  // end of [if]
)
} (* end of [mystream_filter] *)

(* ****** ****** *)

extern
fun
{a:t@ype}
{b:t@ype}
mystream_map
(
xs: stream(a), fopr: (a) -<cloref1> b
) : stream(b)

implement
{a}{b}
mystream_map
  (xs, fopr) =
  auxmain(xs) where
{
fun
auxmain
(
xs: stream(a)
) : stream(b) = $delay
(
case+ !xs of
| stream_nil() => stream_nil()
| stream_cons(x, xs) => stream_cons(fopr(x), auxmain(xs))
)
} (* end of [mystream_map] *)

(* ****** ****** *)

(* end of [mystream.dats] *)

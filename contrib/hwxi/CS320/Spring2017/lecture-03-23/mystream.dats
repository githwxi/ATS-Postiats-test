(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
#include
"share/HATS/atspre_staload_libats_ML.hats"
//
(* ****** ****** *)
//
extern
fun
{a:t@ype}
mystream_filter
  (stream(a), pred: (a) -<cloref1> bool): stream(a)
//
extern
fun
{a:t@ype}
{b:t@ype}
mystream_map
  (stream(a), fopr: (a) -<cloref1> b): stream(b)
extern
fun
{a:t@ype}
{b:t@ype}
mystream_imap
  (stream(a), fopr: (int, a) -<cloref1> b): stream(b)
//
(* ****** ****** *)
//
extern
fun
{a:t@ype}
myenumerate
  (xss: stream(stream(a))): stream(a)
//
(* ****** ****** *)

implement
{a}
mystream_filter
  (xs, pred) = $delay
(
case+ !xs of
| stream_nil() => stream_nil()
| stream_cons(x, xs) =>
    if pred(x)
      then stream_cons(x, mystream_filter<a>(xs, pred))
      else !(mystream_filter<a>(xs, pred))
  // end of [stream_cons]
)

(* ****** ****** *)

implement
{a}{b}
mystream_map(xs, fopr) = $delay
(
case+ !xs of
| stream_nil() =>
  stream_nil()
| stream_cons(x, xs) =>
  stream_cons(fopr(x), mystream_map<a><b>(xs, fopr))
)

(* ****** ****** *)
//
extern
fun
{a:t@ype}
stream_altmerge(stream(a), stream(a)): stream(a)
//
implement
{a}(*tmp*)
stream_altmerge
  (xs, ys) = $delay
(
case+ !xs of
| stream_nil() => !ys
| stream_cons(x, xs) =>
  stream_cons(x, stream_altmerge<a>(ys, xs))
)
//
(* ****** ****** *)
//
implement
{a}
myenumerate
  (xss) = $delay
(
let
  val-
  stream_cons(xs, xss) = !xss
  val-stream_cons(x0, xs) = !xs
in
  stream_cons(x0, stream_altmerge<a>(myenumerate<a>(xss), xs))
end
)
//
(* ****** ****** *)

(*
fun
from(n: int): list0(int) =
  list0_cons(n, from(n+1))
*)

fun
from(n: int): stream(int) =
$delay
(
  stream_cons(n, from(n+1))
)

(* ****** ****** *)
//
val xs =
from(0) // infinite: 0, 1, 2, 3, ...
val xs =
mystream_filter<int>(xs, lam (x) => x % 2 = 0)
val xs =
mystream_map<int><int>(xs, lam (x) => x * x)
//
val-stream_cons(x, xs) = !(xs)
val () = println!("x = ", x)
val-stream_cons(x, xs) = !(xs)
val () = println!("x = ", x)
val-stream_cons(x, xs) = !(xs)
val () = println!("x = ", x)
val-stream_cons(x, xs) = !(xs)
val () = println!("x = ", x)
val-stream_cons(x, xs) = !(xs)
val () = println!("x = ", x)

(* ****** ****** *)

implement main0() = ((*void*))

(* ****** ****** *)

(* end of [mystream.dats] *)

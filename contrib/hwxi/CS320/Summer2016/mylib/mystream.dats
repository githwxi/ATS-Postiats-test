(* ****** ****** *)
//
// Functions on streams
//
(* ****** ****** *)
//
staload
"libats/ML/SATS/basis.sats"
//
(* ****** ****** *)
//
extern
fun{a,b:t@ype}
mystream_map_cloref
  : (stream(a), (a) -<cloref1> b) -> stream(b)
//
(* ****** ****** *)

implement
{a,b}
mystream_map_cloref
  (xs, f) = let
//
fun
aux
(
  xs: stream(a)
) : stream(b) = $delay
(
case+ !xs of
| stream_nil() => stream_nil()
| stream_cons(x, xs) => stream_cons(f(x), aux(xs))
)
//
in
  aux(xs)
end // end of [mystream_map_cloref]

(* ****** ****** *)
//
extern
fun{a:t@ype}
mystream_filter_cloref
  : (stream(a), (a) -<cloref1> bool) -> stream(a)
//
implement
{a}
mystream_filter_cloref
  (xs, pred) = let
//
fun
aux
(
  xs: stream(a)
) : stream(a) = $delay
(
  case+ !xs of
  | stream_nil() => stream_nil()
  | stream_cons(x, xs) =>
      if pred(x) then stream_cons(x, aux(xs)) else !(aux(xs))
    // end of [stream_cons]
)
//
in
  aux(xs)
end // end of [mystream_filter_cloref]

(* ****** ****** *)
//
extern
fun{a:t@ype}
mystream_foreach_cloref
  : (stream(a), (a) -<cloref1> void) -> void
//
implement{a}
mystream_foreach_cloref
  (xs, fwork) = let
//
fun loop
(
  xs: stream(a)
) : void =
(
  case+ !xs of
  | stream_nil() => () 
  | stream_cons(x, xs) => (fwork(x); loop(xs))
)
//
in
  loop(xs)
end // end of [mystream_foreach_cloref]
//
(* ****** ****** *)
//
extern
fun{a:t@ype}
mystream_iforeach_cloref
  : (stream(a), (int, a) -<cloref1> void) -> void
//
implement{a}
mystream_iforeach_cloref
  (xs, fwork) = let
//
fun loop
(
  i: int, xs: stream(a)
) : void =
(
  case+ !xs of
  | stream_nil() => () 
  | stream_cons(x, xs) => (fwork(i, x); loop(i+1, xs))
)
//
in
  loop(0, xs)
end // end of [mystream_iforeach_cloref]
//
(* ****** ****** *)
//
extern
fun
{a,st:t@ype}
mystream_make_cloref
  (st0: st, fopr: (st) -<cloref1> $tup(a, st)): stream(a)
//
implement
{a,st}
mystream_make_cloref
  (st0, fopr) = let
//
fun
aux
(
  st: st
) : stream(a) = $delay
(
let
  val
  $tup(x, st) = fopr(st)
in
  stream_cons(x, aux(st))
end
)
//
in
  aux(st0)
end // end of [mystream_make_cloref]

(* ****** ****** *)

(* end of [mystream.dats] *)

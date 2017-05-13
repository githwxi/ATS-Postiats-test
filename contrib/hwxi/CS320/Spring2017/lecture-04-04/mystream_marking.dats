(* ****** ****** *)
(*
** For marking a stream...
*)
(* ****** ****** *)
//
datatype
marked(a:t@ype) =
| Mark of (int) | Elem of a
//
(* ****** ****** *)
//
extern
fun
{a:t@ype}
mystream_marking
  (stream(a)): stream(marked(a))
//
implement
{a}
mystream_marking
  (xs) = auxmain(xs, 0) where
{
fun
auxmain(xs: stream(a), n: int): stream(marked(a)) = $delay
(
case+ !xs of
| stream_nil() =>
  stream_nil()
| stream_cons(x, xs) =>
  stream_cons(Mark(n), $delay(stream_cons(Elem(x), auxmain(xs, n+1))))
)
}
//
(* ****** ****** *)

(* end of [mystream_marking.dats] *)

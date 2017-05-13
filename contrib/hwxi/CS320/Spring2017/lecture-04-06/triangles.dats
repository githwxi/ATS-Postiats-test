(* ****** ****** *)
(*
//
// How to test:
// ./triangles
//
// How to compile:
//
// patscc -o triangles triangles.dats -DATS_MEMALLOC_LIBC
//
*)
(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
#include
"share/HATS/atspre_staload_libats_ML.hats"
//
(* ****** ****** *)

extern
fun
triangles(): stream(int)
//
implement
triangles() =
  aux(1(*n*), 0(*t*)) where
{
//
fun
aux(n: int, t: int): stream(int) =
  $delay(stream_cons(t, aux(n+1, n+t)))
//
} (* end of [triangles] *)

(* ****** ****** *)
//
val xs = triangles()
//
val-stream_cons(x, xs) = !xs
val () = println! ("x = ", x)
val-stream_cons(x, xs) = !xs
val () = println! ("x = ", x)
val-stream_cons(x, xs) = !xs
val () = println! ("x = ", x)
val-stream_cons(x, xs) = !xs
val () = println! ("x = ", x)
val-stream_cons(x, xs) = !xs
val () = println! ("x = ", x)
//
(* ****** ****** *)
//
(*
** Scanning a stream
*)
//
extern
fun
{
res:t@ype
}{a:t@ype}
stream_scan
(stream(a), res, (res, a) -<cloref1> res): stream(res)
//
implement
{res}{a}
stream_scan
  (xs, res, fopr) = $delay
(
case+ !xs of
| stream_nil() =>
  stream_cons(res, stream_make_nil())
| stream_cons(x, xs) =>
  stream_cons(res, stream_scan(xs, fopr(res, x), fopr))
)
//
(* ****** ****** *)

fun
triangles() = let
//
fun from(n:int): stream(int) =
  $delay(stream_cons(n, from(n+1)))
//
in
  stream_scan<int><int>(from(1), 0, lam(res, x) => res + x)
end // end of [triangles]

(* ****** ****** *)
//
val xs = triangles()
//
val-stream_cons(x, xs) = !xs
val () = println! ("x = ", x)
val-stream_cons(x, xs) = !xs
val () = println! ("x = ", x)
val-stream_cons(x, xs) = !xs
val () = println! ("x = ", x)
val-stream_cons(x, xs) = !xs
val () = println! ("x = ", x)
val-stream_cons(x, xs) = !xs
val () = println! ("x = ", x)
//
(* ****** ****** *)

implement main0() = ((*void*))

(* ****** ****** *)

(* end of [triangles.dats] *)

(* ****** ****** *)

#include
"share/atspre_staload.hats"
#include
"share/HATS/atspre_staload_libats_ML.hats"

(* ****** ****** *)
//
abstype point
//
typedef
triangle = $tup(point, point, point)
//
(* ****** ****** *)

extern
fun
midpoint : (point, point) -> point

(* ****** ****** *)
//
extern
fun
Sierpinkski
(
A: point, B: point, C: point
) : stream(triangle)
//
(* ****** ****** *)

extern
fun
{a:t@ype}
combine3_bfs
(stream(a), stream(a), stream(a)): stream(a)

(* ****** ****** *)

implement
{a}
combine3_bfs
(
  xs, ys, zs
) = $delay
(
let
//
val-stream_cons(x0, xs) = !xs
val-stream_cons(y0, ys) = !ys
val-stream_cons(z0, zs) = !zs
//
in
stream_cons
( x0,
  stream_make_cons
  ( y0
  , stream_make_cons(z0, combine3_bfs(xs, ys, zs))
  )
)
end
) (* end of [combine3_bfs] *)

(* ****** ****** *)

implement
Sierpinkski
  (A, B, C) = $delay
(
let
//
val AB = midpoint(A, B)
val BC = midpoint(B, C)
val CA = midpoint(C, A)
//
val ts1 = Sierpinkski( A, AB, CA)
val ts2 = Sierpinkski(AB,  B, BC)
val ts3 = Sierpinkski(CA, BC,  C)
//
in
  stream_cons($tup(AB, BC, CA), combine3_bfs(ts1, ts2, ts3)) 
end
)

(* ****** ****** *)

(*
implement main0() = ((*void*))
*)

(* ****** ****** *)

(* end of [Sierpinski.dats] *)

//
#ifdef
STATESTREAM_EMBEDDED
#then
//
#define
LIBATSCC2JS_targetloc
"$PATSHOME\
/contrib/libatscc2js/ATS2-0.3.2"
//
(* ****** ****** *)
//
#include
"{$LIBATSCC2JS}/staloadall.hats"
//
#endif // end of [#ifdef]
//
(* ****** ****** *)
//
abstype point
//
typedef
ntriangle =
  $tup(int, point, point, point)
//
(* ****** ****** *)

extern
fun
midpoint : (point, point) -> point

(* ****** ****** *)
//
extern
fun
Sierpinski
(
 n: int, A: point, B: point, C: point
) : stream(ntriangle)
//
(* ****** ****** *)

extern
fun
{a:t@ype}
combine3_bfs
(stream(a), stream(a), stream(a)): stream(a)

(* ****** ****** *)
//
fun
{a:t@ype}
stream_make_cons
(
x0: a, xs: stream(a)
) : stream(a) =
  $delay(stream_cons(x0, xs))
//
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
Sierpinski
  (n, A, B, C) = $delay
(
let
//
val AB = midpoint(A, B)
val BC = midpoint(B, C)
val CA = midpoint(C, A)
//
val ts1 = Sierpinski(n+1, A, AB, CA)
val ts2 = Sierpinski(n+1, AB,  B, BC)
val ts3 = Sierpinski(n+1, CA, BC,  C)
//
in
  stream_cons($tup(n, AB, BC, CA), combine3_bfs(ts1, ts2, ts3)) 
end
)

(* ****** ****** *)

local

assume
point = $tup(double, double)

in

implement
midpoint(p, q) = $tup((p.0+q.0)/2, (p.1+q.1)/2)

end // end of [local]

(* ****** ****** *)

(* end of [Sierpinski.dats] *)

(* ****** ****** *)

#ifdef
STATESTREAM_EMBEDDED
#then
#else
//
(* ****** ****** *)
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
(* ****** ****** *)
//
#staload
"{$LIBATSCC2JS}\
/SATS/HTML/canvas-2d/canvas2d.sats"
//
(* ****** ****** *)

#staload "./Sierpinski.dats"

(* ****** ****** *)
//
extern
fun
theCanvas_get
  ((*void*)): canvas = "mac#"
extern
fun
theCanvas_ctx2d_get
  ((*void*)): canvas2d = "mac#"
//
(* ****** ****** *)
//
abstype state_type = ptr
//
typedef state = state_type
typedef states = stream(state)
//
#endif // end of [EMBEDDED]

(* ****** ****** *)
//
assume
state_type = $tup(int)
//
(* ****** ****** *)
//
#define PI 3.1415926535898
//
(* ****** ****** *)

#define N 6

(* ****** ****** *)
//
val A0 = $tup( 0.0, 0.0 )
val B0 = $tup(~0.5, 1.0 )
val C0 = $tup( 0.5, 1.0 )
//
(* ****** ****** *)
//
val
theSierpinski = let
//
reassume point
//
in
  Sierpinski(0, A0, B0, C0)
end // end of [val]
//
(* ****** ****** *)

extern
fun
theState_show
  (state): void = "mac#"
//
implement
theState_show
  (state) = let
//
reassume point
//
val n0 = (state.0 % N) + 1
//
(*
val () =
alert("n0 = " + String(n0))
*)
//
val
ctx = theCanvas_ctx2d_get()
//
fun
draw3p
(
 A: point, B: point, C: point
) : void =
{
//
val () = ctx.beginPath()
//
val () = ctx.moveTo(A.0, A.1)
val () = ctx.lineTo(B.0, B.1)
val () = ctx.lineTo(C.0, C.1)
//
val () = ctx.closePath()
//
val () = ctx.fill((*void*))
//
}
//
fun
drawSierpinski() = let
//
fun
loop
(
xs: stream(ntriangle)
) : void = let
//
val-stream_cons(x, xs) = !xs
//
in
//
if
(x.0 < n0)
then
loop(xs) where
{
  val () = draw3p(x.1, x.2, x.3)
} (* end of [then] *)
//
end // end of [loop]
//
val () =
ctx.fillStyle("#0000ff")
//
val () = draw3p(A0, B0, C0)
//
val () =
ctx.fillStyle("#ffff00")
//
in
  loop(theSierpinski)
end (* end of [drawSierpinski] *)
//
val () =
  ctx.clearRect(0, 0, 600, 420)
//
val pf = ctx.save()
//
val () = ctx.translate(300.0, 30.0)
//
val () = ctx.scale(360.0, 360.0)
//
val () = drawSierpinski((*void*))
//
val ((*void*)) = ctx.restore(pf.0 | (*void*))
//
in
  // nothing
end // end of [theState_show]
//
(* ****** ****** *)
//
extern
fun
theStateStream_gen
  ((*void*)): states = "mac#"
//
(* ****** ****** *)
//
implement
theStateStream_gen
  ((*void*)) =
  auxmain(0) where
{
//
fun
auxmain(n: int): states =
  $delay(stream_cons($tup(n), auxmain(n+1)))
//
} (* end of [theStateStream_gen] *)
//
(* ****** ****** *)

(* end of [theStateStream.dats] *)

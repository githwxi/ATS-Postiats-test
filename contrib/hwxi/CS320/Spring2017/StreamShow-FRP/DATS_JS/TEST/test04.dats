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
abst@ype state_t0ype = ptr
//
typedef state = state_t0ype
typedef states = stream(state)
//
#endif // end of [EMBEDDED]

(* ****** ****** *)
//
assume
state_t0ype = $tup(int, int)
//
(* ****** ****** *)
//
#define PI 3.1415926535898
//
(* ****** ****** *)

extern
fun
theState_show(state): void = "mac#"
//
implement
theState_show
  (state) = let
//
val
ctx =
theCanvas_ctx2d_get()
//
val xc = int2double(state.0)
and yc = int2double(state.1)
//
(*
val () =
alert("theState_show: xc = " + String(xc))
val () =
alert("theState_show: yc = " + String(yc))
*)
//
val () =
ctx.fillStyle("#0000ff")
val () =
ctx.clearRect(0, 0, 600, 420)
//
val (pf|()) = ctx.save()
//
val () = ctx.beginPath()
val () = ctx.arc(xc, yc, 10.0(*rad*), 0.0, 2*PI, true) 
val () = ctx.closePath()
//
val () = ctx.fill((*void*))
//
val ((*void*)) = ctx.restore(pf | (*void*))
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
  ((*void*)) = walk(300, 210) where
{
//
fun
walk
(
x0: int, y0: int
) : states = $delay
(
let
  val r0 =
  (
    if (JSmath_random() <= 0.5) then 0 else 1
  ) : int // end of [val]
  val r1 =
  (
    if (JSmath_random() <= 0.5) then 0 else 1
  ) : int // end of [val]
  val x1 =
  (
    if r0 = 0
      then (if r1 = 0 then x0 - 10 else x0 + 10)
      else (x0)
    // end of [if]
  ) : int // end of [val]
  val y1 =
  (
    if r0 = 1
      then (if r1 = 0 then y0 - 10 else y0 + 10)
      else (y0)
    // end of [if]
  ) : int // end of [val]
in
  stream_cons($tup(x0, y0), walk(x1, y1))
end // end of [let]
)
//
} (* end of [theStateStream_gen] *)
//
(* ****** ****** *)

(* end of [test04.dats] *)

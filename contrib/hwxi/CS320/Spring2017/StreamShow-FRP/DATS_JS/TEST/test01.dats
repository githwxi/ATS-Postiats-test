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
val msg = String(state)
//
val () = ctx.textAlign("center")
val () = ctx.clearRect(0, 0, 600, 420)
val () = ctx.fillText(msg, 300.0, 210.0)
//
in
  // nothing
end // end of [theState_show]
//
(* ****** ****** *)
//
extern
fun
theStateStream_gen(): states = "mac#"
//
(* ****** ****** *)

assume state_t0ype = int

(* ****** ****** *)

implement
theStateStream_gen
  ((*void*)) = gen(0, 1) where
{
fun
gen
(
f0: int
,
f1: int
) : stream(state) =
  $delay(stream_cons(f0, gen(f1, f0+f1)))
} (* theStateStream_gen *)

(* ****** ****** *)

(* end of [test01.dats] *)

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
theStateStream_gen
  (): states = "mac#"
//
(* ****** ****** *)
//
assume state_t0ype = int
//
(* ****** ****** *)

#staload
"./../../stream_getdup.dats"

(* ****** ****** *)
//
extern
fun
{a:t@ype}
stream_merge
(
stream(a), stream(a)
) : stream(a)
//
(* ****** ****** *)

local

#define :: stream_cons

in (* in of [local] *)

implement
{a}(*tmp*)
stream_merge
  (xs10, xs20) = let
//
fun
auxmain:
$d2ctype
(
stream_merge<a>
) =
lam
(
xs10, xs20
) => $delay
(
case+ !xs10 of
| x1 :: xs1 =>
  (
  case+ !xs20 of
  | x2 :: xs2 => let
      val sgn =
        gcompare_val_val<a>(x1, x2)
      // end of [val]
    in
      if sgn <= 0 then
        stream_cons{a}(x1, auxmain(xs1, xs20))
      else
        stream_cons{a}(x2, auxmain(xs10, xs2))
      // end of [if]
    end // end of [::]
  | stream_nil() => stream_cons{a}(x1, xs1)
  ) (* end of [::] *)
| stream_nil() => !xs20
) (* end of [auxmain] *)
//
in
  auxmain(xs10, xs20)
end // end of [stream_merge]

end // end of [local]

(* ****** ****** *)
//
typedef
int2 = $tup(int, int)
//
(* ****** ****** *)

implement
theStateStream_gen
  ((*void*)) =
  stream_getdup<int>(gall(1)) where
{
//
fn
cube(x:int):<> int = x*x*x
fn
cube2(x:int, y:int):<> int = cube(x) + cube(y)
//
fun
gall
(
i: int
): stream(int) = $delay
(
stream_cons
(cube2(i, i), stream_merge<int>(grow(i, i+1), gall(i+1)))
)
//
and
grow
(
i: int, j: int
): stream(int) = $delay(stream_cons(cube2(i, j), grow(i, j+1)))
//
} (* end of [theStateStream_gen] *)

(* ****** ****** *)

(* end of [theStateStream.dats] *)

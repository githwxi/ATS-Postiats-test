(* ****** ****** *)
(*
** Board implementation
*)
(* ****** ****** *)
//
#include "./theParams.hats"
//
#include
"{$LIBATSCC2JS}/staloadall.hats"
//
(* ****** ****** *)
//
#staload
"{$LIBATSCC2JS}/SATS/HTML/canvas-2d/canvas2d.sats"
//
(* ****** ****** *)

#define N 48
#define W 600
#define H 420
#define W2 300.0
#define H2 210.0
#define WH 400

(* ****** ****** *)
//
#staload "./main.sats"
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
extern
fun
theBoard_draw
(ctx: canvas2d): void
//
implement
theBoard_draw(ctx) = let
//
val BN = 1.0*WH/N
val x0 = 1.0*(W-WH)/2
val y0 = 1.0*(H-WH)/2
//
val c0 = "#000000"
and c1 = "#7f7f7f"
and c2 = "#efefef"
val cf = "#ffffff"
//
val
theBoard = theBoard_get()
//
fun
auxone
(
  nx: int, ny: int
) : void = let
//
val
k0 = theBoard[nx, ny]
//
in
//
ifcase
| k0 = 0 => ()
| k0 > 0 => () where
  {
//
    val () =
    ctx.fillStyle(c0)
//
    val () = ctx.beginPath()
    val () = ctx.rect(x0+nx*BN, y0+ny*BN, BN, BN)
    val () = ctx.closePath()
//
    val () = ctx.fill((*void*))
//
  } (* end of [k0 > 0] *)
| _(*else*) => ((*do-nothing*))
//
end // end of [auxone]
//
fun
auxrow
(
  nx: int, ny: int
) : void =
if
(nx < N)
then () where
{
//
val () = auxone(nx, ny)
val () = auxrow(nx+1, ny)
//
} (* end of [then] *)
//
fun
auxrows
(
  ny: int
) : void =
if
(ny < N)
then
(
  auxrow(0, ny); auxrows(ny+1)
) (* end of [then] *)
//
val () = ctx.clearRect(0, 0, W, H)
//
in
  auxrows(0(*ny*))
end // end of [theBoard_draw]
//
(* ****** ****** *)

implement
theAllAct_Next_do
  ((*void*)) = let
//
val () =
theWorm_movex_if(R())
//
val () =
theBoard_takeout_worm()
//
val () = theBoard_insert_worm()
//
in
  theBoard_draw(theCanvas_ctx2d_get())
end // end of [theAllAct_Next_do]

implement
theAllAct_Prev_do
  ((*void*)) = let
//
val () =
theWorm_movex_if(L())
//
val () =
theBoard_takeout_worm()
//
val () = theBoard_insert_worm()
//
in
  theBoard_draw(theCanvas_ctx2d_get())
end // end of [theAllAct_Prev_do]

(* ****** ****** *)

implement
theAllAct_Next2_do
  ((*void*)) = let
//
val () =
theWorm_movex_if(D())
//
val () =
theBoard_takeout_worm()
//
val () = theBoard_insert_worm()
//
in
  theBoard_draw(theCanvas_ctx2d_get())
end // end of [theAllAct_Next2_do]

(* ****** ****** *)

implement
theAllAct_Prev2_do
  ((*void*)) = let
//
val () =
theWorm_movex_if(U())
//
val () =
theBoard_takeout_worm()
//
val () = theBoard_insert_worm()
//
in
  theBoard_draw(theCanvas_ctx2d_get())
end // end of [theAllAct_Prev2_do]

(* ****** ****** *)

implement
theAllAct_Random_do
  ((*void*)) = let
//
val lr = (if JSmath_random() <= 0.5 then 0 else 1): int
val ud = (if JSmath_random() <= 0.5 then 0 else 1): int
//
in
//
case+
(lr, ud) of
| (0, 0) => theAllAct_Prev_do()
| (_, 0) => theAllAct_Next_do()
| (0, _) => theAllAct_Prev2_do()
| (_, _) => theAllAct_Next2_do()
//
end // end of [theAllAct_Random_do]

(* ****** ****** *)

implement
theAllAct_Search_do() = theAllAct_Random_do()

(* ****** ****** *)

implement
theAllAct_Reset_do
  ((*void*)) = let
//
val () =
theBoard_takeout_worm()
//
val () = theWorm_reset()
//
val () = theBoard_insert_worm()
//
in
  theBoard_draw(theCanvas_ctx2d_get())
end // end of [theAllAct_Reset_do]

(* ****** ****** *)

(* end of [theControl.dats] *)

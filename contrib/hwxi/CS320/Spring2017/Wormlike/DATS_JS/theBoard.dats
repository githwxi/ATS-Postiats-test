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

#staload "./main.sats"

(* ****** ****** *)

local
//
val
theBoard =
mtrxszref_make_elt
  {int}(XLEN, YLEN, 0)
//
in

implement theBoard_get() = theBoard

end // end of [local]

(* ****** ****** *)

implement
theBoard_insert_worm
  ((*void*)) = let
//
val
theBoard = theBoard_get()
//
fun
loop
(
wx: wnode
) : void = let
//
val $tup(x, y) = wx.pos()
val ((*void*)) = theBoard[x,y] := 1
//
in
//
case+
wx.tail()
of (*case*)
| None() => () | Some(wx) => loop(wx)
//
end // end of [loop]
//
in
  loop(theWorm_get())
end // end of [theBoard_insert_worm]

(* ****** ****** *)

implement
theBoard_takeout_worm
  ((*void*)) = let
//
val
theBoard = theBoard_get()
//
in
theBoard.foreach()
(
lam(x, y) => if theBoard[x, y] = 1 then theBoard[x, y] := 0
)
end // end of [theBoard_takeout_worm]

(* ****** ****** *)

(* end of [theBoard.dats] *)

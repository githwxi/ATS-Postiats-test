(* ****** ****** *)

#staload "./main.sats"

(* ****** ****** *)
//
#include "./theParams.hats"
//
#include
"{$LIBATSCC2JS}/staloadall.hats"
//
(* ****** ****** *)
//
fun
x_dec(x: int): int =
  if x > 0
    then (x-1) else (XLEN-1)
  // end of [if]
fun
x_inc(x: int): int =
  if x+1 < XLEN then (x+1) else 0
//
(* ****** ****** *)
//
fun
y_dec(y: int): int =
  if y > 0
    then (y-1) else (YLEN-1)
  // end of [if]
fun
y_inc(y: int): int =
  if y+1 < YLEN then (y+1) else 0
//
(* ****** ****** *)
//
fun
pos_x_dec(xy: pos): pos = $tup(x_dec(xy.0), xy.1)
fun
pos_x_inc(xy: pos): pos = $tup(x_inc(xy.0), xy.1)
fun
pos_y_dec(xy: pos): pos = $tup(xy.0, y_dec(xy.1))
fun
pos_y_inc(xy: pos): pos = $tup(xy.0, y_inc(xy.1))
//
(* ****** ****** *)
//
datatype
wnode =
WNODE of
(
ref(pos), ref(wxopt)
)
where wxopt = Option(wnode)
//
(* ****** ****** *)

assume wnode_type = wnode

(* ****** ****** *)
//
implement
wnode_pos(wx) =
let
  val+WNODE(ref, _) = wx in ref[]
end // end of [wnode_pos]
//
implement
wnode_tail(wx) =
let
  val+WNODE(_, ref) = wx in ref[]
end // end of [wnode_tail]
//
(* ****** ****** *)
//
implement
wnode_set_pos(wx, xy) =
let
  val+WNODE(ref, _) = wx in ref[] := xy
end // end of [wnode_set_pos]
//
implement
wnode_set_tail(wx, opt) =
let
  val+WNODE(_, ref) = wx in ref[] := opt
end // end of [wnode_set_tail]
//
(* ****** ****** *)
//
implement
wnode_length(wx) =
(
case+
wx.tail()
of (* case+ *)
| None() => 1
| Some(wx) => 1 + wnode_length(wx)
)
//
(* ****** ****** *)
//
fun
wnode_make_pos
  (xy: pos): wnode =
  WNODE(ref(xy), ref(None()))
//
fun
wnode_make_pos_tail
  (xy: pos, wx: wnode): wnode =
  WNODE(ref(xy), ref(Some(wx)))
//
(* ****** ****** *)
//
implement
worm_remove_last
  (wx0) =
(
if wx0.length() >= 2
  then ignoret(worm_takeout_last(wx0)) else ()
// end of [if]
)
//
(* ****** ****** *)
//
implement
worm_takeout_last
  (wx0) = let
//
fun
loop
(
  wx0: wnode
, wx1: wnode
) : wnode = let
  val opt = wx1.tail()
in
  case+ opt of
  | Some(wx2) =>
    loop(wx1, wx2)
  | None((*void*)) =>
    let val () = wx0.tail(None) in wx1 end
end
//
val-Some(wx1) = wx0.tail()
//
in
  loop(wx0, wx1)
end // end of [worm_takeout_last]
//
(* ****** ****** *)
//
extern
fun
worm_move(dir: dir, wx: wnode): wnode
extern
fun
worm_movex(dir: dir, wx: wnode): wnode
//
(* ****** ****** *)
//
implement
worm_move
  (dir, wx) = let
//
  val xy = wx.pos()
  val xy =
  (
  case+ dir of
    | L() => pos_x_dec(xy)
    | R() => pos_x_inc(xy)
    | U() => pos_y_dec(xy)
    | D() => pos_y_inc(xy)
  ) : pos // end of [val]
//
val n0 = wnode_length(wx)
//
in
if
(n0 = 1)
then let
  val () = wx.pos(xy) in wx
end // end of [then]
else let
  val wy = worm_takeout_last(wx)
in
  wy.pos(xy); wy.tail(Some(wx)); wy
end // end of [else]
end // end of [worm_move]
//
(* ****** ****** *)
//
implement
worm_movex
  (dir, wx) = let
  val xy = wx.pos()
  val xy =
  (
  case+ dir of
    | L() => pos_x_dec(xy)
    | R() => pos_x_inc(xy)
    | U() => pos_y_dec(xy)
    | D() => pos_y_inc(xy)
  ) : pos // end of [val]
in
  wnode_make_pos_tail(xy, wx)
end // end of [worm_movex]
//
(* ****** ****** *)

implement
theWorm_move_if
  (dir) = let
//
val
theWorm = theWorm_get()
//
val pos = theWorm.pos()
//
val x_new =
(
case+ dir of
| L() => x_dec(pos.0)
| R() => x_inc(pos.0)
| _(*non-LR*) => pos.0
) : int // end of [val]
//
val y_new =
(
case+ dir of
| U() => y_dec(pos.1)
| D() => y_inc(pos.1)
| _(*non-LR*) => pos.1
) : int // end of [val]
//
val
theBoard = theBoard_get()
//
val knd = theBoard[x_new, y_new]
//
in
//
ifcase
| knd > 0 =>
  theWorm_remove_last()
//  
| knd = 0 => theWorm_move(dir)
//
| _(*else*) => ()
//
end // end of [theWorm_move_if]

(* ****** ****** *)

implement
theWorm_movex_if
  (dir) = let
//
val
theWorm = theWorm_get()
//
val pos = theWorm.pos()
//
val x_new =
(
case+ dir of
| L() => x_dec(pos.0)
| R() => x_inc(pos.0)
| _(*non-LR*) => pos.0
) : int // end of [val]
//
val y_new =
(
case+ dir of
| U() => y_dec(pos.1)
| D() => y_inc(pos.1)
| _(*non-LR*) => pos.1
) : int // end of [val]
//
val
theBoard = theBoard_get()
//
val knd = theBoard[x_new, y_new]
//
in
//
ifcase
| knd > 0 =>
  theWorm_remove_last()
| knd = 0 => theWorm_movex(dir)
| _(*else*) => ()
//
end // end of [theWorm_movex_if]

(* ****** ****** *)

local

val
theWorm_ref =
ref{wnode}(wnode_make_pos($tup(0,0)))

in
//
implement
theWorm_get() = theWorm_ref[]
//
implement
theWorm_reset() =
(
  theWorm_ref[] :=
  wnode_make_pos($tup(0,0))
)
//
implement
theWorm_remove_last() =
  worm_remove_last(theWorm_ref[])
//
implement
theWorm_move(dir) =
  theWorm_ref[] := worm_move(dir, theWorm_ref[])
//
implement
theWorm_movex(dir) =
  theWorm_ref[] := worm_movex(dir, theWorm_ref[])
//
end // end of [local]

(* ****** ****** *)

(* end of [theWorm.dats] *)

(* ****** ****** *)
(*
** For Wormlike
*)
(* ****** ****** *)

#include
"./theParams.hats"

(* ****** ****** *)
//
#include
"{$LIBATSCC2JS}/staloadall.hats"
//
(* ****** ****** *)

abstype
wnode_type = ptr
typedef
wnode = wnode_type

(* ****** ****** *)

typedef
board = mtrxszref(int)

(* ****** ****** *)

typedef
pos = $tup(int, int)
typedef
wxopt = Option(wnode)

(* ****** ****** *)

fun theWorm_get(): wnode

(* ****** ****** *)

fun theBoard_get(): board

(* ****** ****** *)
//
fun
wnode_pos(wx: wnode): pos
overload .pos with wnode_pos
//
fun
wnode_tail(wx: wnode): wxopt
overload .tail with wnode_tail
//
fun
wnode_set_pos(wnode, pos): void
overload .pos with wnode_set_pos
fun
wnode_set_tail(wnode, wxopt): void
overload .tail with wnode_set_tail
//
(* ****** ****** *)
//
fun
wnode_length(wx: wnode): int
//
overload .length with wnode_length
//
(* ****** ****** *)
//
fun
worm_remove_last
  (wx0: wnode): void
//
fun
worm_takeout_last
  (wx0: wnode): wnode(*taken-out*)
//
(* ****** ****** *)

datatype dir = L | R | U | D

(* ****** ****** *)
//
fun
theWorm_reset(): void
//
(* ****** ****** *)
//
fun
theWorm_remove_last(): void
//
(* ****** ****** *)

fun
theWorm_move(dir: dir): void
fun
theWorm_movex(dir: dir): void

(* ****** ****** *)

fun
theWorm_move_if(dir: dir): void
fun
theWorm_movex_if(dir: dir): void

(* ****** ****** *)
//
fun
theBoard_insert_worm(): void
fun
theBoard_takeout_worm(): void
//
(* ****** ****** *)
//
fun
theAllAct_Next_do(): void = "mac#"
fun
theAllAct_Prev_do(): void = "mac#"
fun
theAllAct_Next2_do(): void = "mac#"
fun
theAllAct_Prev2_do(): void = "mac#"
//
fun
theAllAct_Reset_do(): void = "mac#"
//
fun
theAllAct_Random_do(): void = "mac#"
//
fun
theAllAct_Search_do(): void = "mac#"
//
(* ****** ****** *)

(* end of [main.sats] *)

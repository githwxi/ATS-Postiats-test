(*
** For lecture-06-02
*)

#include
"share/atspre_staload.hats" // basic
#include
"share/HATS/atspre_staload_libats_ML.hats" // ML

(* ****** ****** *)

staload "./queens.sats"

(* ****** ****** *)

assume board = array0(int)

(* ****** ****** *)
//
implement
board_make() =
  array0_make_elt<int> (i2sz(N), ~1)
//
(* ****** ****** *)

implement
board_get_at(bd, m) = array0_get_at(bd, m)
implement
board_set_at(bd, m, x) = array0_set_at(bd, m, x)

(* ****** ****** *)

(* end of [queens_board.dats] *)


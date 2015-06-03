(*
** For lecture-06-02
*)

(* ****** ****** *)
//
// Solving the N-queen puzzle
//
(* ****** ****** *)

#define N 8

(* ****** ****** *)
//
// N-by-N
//
abstype board = ptr
//
(* ****** ****** *)
//
fun
print_board(board): void
fun
fprint_board(out: FILEref, board): void
//
overload print with print_board
overload fprint with fprint_board
//
(* ****** ****** *)
//
fun board_make(): board
//
fun board_get_at(board, m: int): int
fun board_set_at(board, m: int, x: int): void
//
overload [] with board_get_at
overload [] with board_set_at
//
(* ****** ****** *)

(* end of [queens.sats] *)

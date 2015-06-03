(*
** For lecture-06-02
*)

(* ****** ****** *)
//
// Solving the N-queen puzzle
//
(* ****** ****** *)

#include
"share/atspre_staload.hats" // basic
#include
"share/HATS/atspre_staload_libats_ML.hats" // ML

(* ****** ****** *)

staload "./queens.sats"

(* ****** ****** *)

local
//
#include "./queens_board.dats"
//
in (*nothing*) end

(* ****** ****** *)
//
implement
print_board(bd) =
  fprint_board(stdout_ref, bd)  
// 
(* ****** ****** *)

implement
fprint_board
  (out, bd) = let
//
fun
chpr(n: int, c: string): void =
  if n > 0 then (fprint(out, c); chpr(n-1, c))
//
fun
pr_row(m: int): void = let
  val n = bd[m]
in
//
if
n >= 0
then (chpr(n, ". "); fprint(out, "Q "); chpr(N-1-n, ". "); fprint_newline(out))
else (chpr(N, ". "); fprint_newline(out))
//
end // end of [pr_row]
//
fun pr_rows(m: int): void =
  if m < N then (pr_row(m); pr_rows(m+1))
//
in
  pr_rows(0)
end // end of [fprint_board]

(* ****** ****** *)

extern
fun
board_test(board, m: int, n: int): bool

(* ****** ****** *)

implement
board_test
  (bd, m, n) = let
//
fun
loop (i: int): bool =
  if i < m then let
    val j = bd[i]
    val test = (j != n) && (m-i != abs(n-j))
  in
    if test then loop(i+1) else false
  end else true
//
in
  loop(0)
end // end of [board_test]

(* ****** ****** *)
//
extern
fun
board_search // 0/1: ~found/found
  (bd: board, m: int, n: int): int
//
extern
fun
board_search_next(bd: board, m: int): int
extern
fun
board_search_btrack(bd: board, m: int): int
//
(* ****** ****** *)

implement
board_search
  (bd, m, n) = let
//
val test = board_test(bd, m, n)
//
in
//
if
test
then let
  val () = bd[m] := n
in
  if m+1 < N
    then board_search(bd, m+1, 0) else 1
  // end of [if]
end // end of [then]
else (
//
if n+1 < N
then board_search(bd, m, n+1)
else board_search_btrack(bd, m)
//
) (* end of [else] *)
//
end // end [board_search]

(* ****** ****** *)

implement
board_search_next
  (bd, m) = let
//
  val n = bd[m]
  val () = bd[m] := ~1
//
in
  if n+1 < N
    then board_search(bd, m, n+1)
    else board_search_btrack(bd, m)
  // end of [if]
end // end of [board_search_next]

(* ****** ****** *)

implement
board_search_btrack
  (bd, m) = (
//
if
m-1 >= 0
then let
  val n1 = bd[m-1]
  val () = bd[m-1] := ~1
in
  if n1+1 < N
    then board_search(bd, m-1, n1+1)
    else board_search_btrack(bd, m-1)
end // end of [then]
else 0 // no solution is found
//
) (* end of [board_search_btrack] *)

(* ****** ****** *)

fun
queen_puzzle_solve
  ((*void*)) = let
//
val bd = board_make()
//
fun
loop (): void = let
//
val ans = board_search(bd, 0, 0)
//
in
//
print!("Solution#1:\n", bd); loop2(1)
//
end // end of [loop]
//
and
loop2(nsol: int): void = let
//
val ans = board_search_next(bd, N-1)
//
in
//
if
ans > 0
then (
  print!("\nSolution#", nsol+1, ":\n", bd); loop2(nsol+1)
) (* end of [then] *)
else (
  println! ("\nThere are ", nsol, " solutions in total!")
) (* end of [else] *)
//
end // end of [loop2]
//
in
  loop()
end // end of [queen_puzzle_solve]

(* ****** ****** *)

implement main0 () =
{
//
val () =
println! ("Hello from [queens]!")
//
val () = queen_puzzle_solve((*void*))
//
} (* end of [main0] *)

(* ****** ****** *)

(* end of [queens.dats] *)


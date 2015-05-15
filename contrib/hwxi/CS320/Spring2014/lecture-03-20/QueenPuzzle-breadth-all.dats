(* ****** ****** *)
//
// HX-2014-03-31:
// This is a single-file
// version of QueenPuzzle-breadth
//
(* ****** ****** *)

staload
tree_search =
{
#include "./tree-search.dats"
}
staload
breadth_first =
{
#include "./breadth-first.dats"
}
staload
gtkcairotimer_toplevel =
{
#include "./gtkcairotimer_toplevel.dats"
}
staload
QueenPuzzle_breadth =
{
#define QPBF_ALL 1
#include "./QueenPuzzle-breadth.dats"
}

(* ****** ****** *)

(* end of [QueenPuzzle-breadth-all.dats] *)

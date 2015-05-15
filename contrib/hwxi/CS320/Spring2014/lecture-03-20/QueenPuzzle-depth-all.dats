(* ****** ****** *)
//
// HX-2014-03-31:
// This is a single-file
// version of QueenPuzzle-depth
//
(* ****** ****** *)

staload
tree_search =
{
#include "./tree-search.dats"
}
staload
depth_first =
{
#include "./depth-first.dats"
}
staload
gtkcairotimer_toplevel =
{
#include "./gtkcairotimer_toplevel.dats"
}
staload
QueenPuzzle_depth =
{
#define QPDF_ALL 1
#include "./QueenPuzzle-depth.dats"
}

(* ****** ****** *)

(* end of [QueenPuzzle-depth-all.dats] *)

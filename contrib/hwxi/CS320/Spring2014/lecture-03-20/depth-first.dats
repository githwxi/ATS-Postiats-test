(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
#include
"share/HATS/atspre_staload_libats_ML.hats"
//
(* ****** ****** *)

staload "./tree-search.sats"
staload "./depth-first.sats"
  
(* ****** ****** *)

assume nodelst_type = list0 (node)

(* ****** ****** *)

implement
nodelst_make_nil () = nil0 ()  
  
(* ****** ****** *)

implement
nodelst_uncons_opt (nxs) =
(
case+ nxs of
| nil0 () => (None(), nxs)
| cons0 (nx, nxs) => (Some(nx), nxs)
)

(* ****** ****** *)

implement
nodelst_add (nxs, nx) = cons0 (nx, nxs)

(* ****** ****** *)
//
implement
depth_search (x) =
  search_list (nodelst_make_sing (x))
//
(* ****** ****** *)
//
implement
depth_search_list (xs) = search_list (xs)
//
(* ****** ****** *)

(* end of [depth-first.dats] *)

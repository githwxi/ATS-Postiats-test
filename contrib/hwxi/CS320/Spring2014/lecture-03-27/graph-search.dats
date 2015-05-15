(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
#include
"share/HATS/atspre_staload_libats_ML.hats"
//
(* ****** ****** *)

staload "./graph-search.sats"

(* ****** ****** *)
//
implement
nodelst_make_sing (x) =
  nodelst_add (nodelst_make_nil(), x)
//
(* ****** ****** *)

implement
nodelst_add_list (nxs, xs) =
(
  case+ xs of
  | nil0 () => nxs
  | cons0 (x, xs) =>
      nodelst_add_list (nodelst_add (nxs, x), xs)
    // end of [cons0]
) (* end of [nodelst_add_list] *)

(* ****** ****** *)

implement
search_list (nxs) = let
  val (opt, nxs) = nodelst_uncons_opt (nxs)
in
//
case+ opt of
| Some (nx) => let
    val cont = handle_node (nx)
  in
    if cont
      then let
        val xs = node_get_neighbors (nx)
        val nxs2 = nodelst_add_list (nxs, xs)
      in
        search_list (nxs2)
      end // end of [then]
      else search_list (nxs)
  end
| None ((*void*)) => ()
//
end // end of [search_list]

(* ****** ****** *)

(* end of [graph-search.dats] *)

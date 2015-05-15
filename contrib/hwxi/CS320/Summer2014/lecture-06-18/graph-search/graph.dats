(* ****** ****** *)
//
staload
"libats/ML/SATS/basis.sats"
//
(* ****** ****** *)

staload "./graph.sats"

(* ****** ****** *)

implement
{}(*tmp*)
graph_search
  (nxs) = let
//
val (nxs, opt) = nodeset_takeout (nxs)
//
in
//
case+ opt of
| None0 () => ()
| Some0 (nx) => let
    val test = process_node (nx)
  in
    if test
      then let
      val nxs = nodeset_add_neighbors (nxs, nx)
      in
        graph_search (nxs)
      end // end of [then]
      else graph_search (nxs)
    // end of [if]
  end // end of [Some0]
//
end // end of [graph_search]

(* ****** ****** *)

(* end of [graph.dats] *)

staload
"libats/ML/SATS/basis.sats"

staload "./gtree.sats"

implement
{}(*tmp*)
search_depth
  (nx0) = let
//
val test = process_node (nx0)
//
in
//
if
test
then let
  val nxs =
  node_get_children (nx0)
in
  search_depth_list (nxs)
end // end of [then]
else () // end of [else]
//
end // end of [search_depth]

implement
{}(*tmp*)
search_depth_list
  (nxs) = let
in
//
case+ nxs of
| nil0 () => ()
| cons0 (nx, nxs) => let
    val () = search_depth (nx)
    val () = search_depth_list (nxs)
  in
    // nothing
  end // end of [cons0]
//
end // end of [search_depth_list]

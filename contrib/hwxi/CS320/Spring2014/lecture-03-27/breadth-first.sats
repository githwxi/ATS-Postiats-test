(* ****** ****** *)
//
staload
"libats/ML/SATS/basis.sats"
//
(* ****** ****** *)

staload "./graph-search.sats"

(* ****** ****** *)

(*
//
abstype node_type = ptr
typedef node = node_type
typedef nodelst = list0(node)
//
fun node_get_children (node): nodelst
//
*)

(* ****** ****** *)
//
fun breadth_search (nx: node): void
fun breadth_search_list (nxs: list0(node)): void
//
(* ****** ****** *)

(* end of [breadth-first.sats] *)

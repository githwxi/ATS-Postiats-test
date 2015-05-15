(* ****** ****** *)

staload
"libats/ML/SATS/basis.sats"

(* ****** ****** *)

abstype node
abstype nodeset

(* ****** ****** *)

typedef nodelst = list0 (node)

(* ****** ****** *)

fun{}
nodeset_insert (nodeset, node): nodeset

(* ****** ****** *)

fun{}
nodeset_takeout (nodeset): (nodeset, option0 (node))

(* ****** ****** *)

fun{}
node_get_neighbors (node): nodelst

(* ****** ****** *)

fun{}
nodeset_add_neighbors (nxs: nodeset, nx: node): nodeset

(* ****** ****** *)

fun{}
process_node (node): bool

(* ****** ****** *)

fun{}
graph_search (nxs: nodeset): void

(* ****** ****** *)

(* end of [graph.sats] *)

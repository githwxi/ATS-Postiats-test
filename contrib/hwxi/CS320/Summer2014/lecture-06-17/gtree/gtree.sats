(* ****** ****** *)

staload
"libats/ML/SATS/basis.sats"

(* ****** ****** *)

abstype node
typedef nodelst = list0 (node)

(* ****** ****** *)

fun{}
node_get_children (node): nodelst

(* ****** ****** *)

fun{}
process_node (node): bool

(* ****** ****** *)

fun{}
search_depth (node): void
fun{}
search_depth_list (nodelst): void

(* ****** ****** *)

(* end of [gtree.sats] *)

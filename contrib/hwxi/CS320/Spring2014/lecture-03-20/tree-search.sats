(* ****** ****** *)
//
staload
"libats/ML/SATS/basis.sats"
//
(* ****** ****** *)

abstype node_type = ptr
typedef node = node_type

(* ****** ****** *)
  
fun node_get_children (node): list0(node)
  
(* ****** ****** *)

abstype nodelst_type = ptr
typedef nodelst = nodelst_type

(* ****** ****** *)

fun nodelst_make_nil (): nodelst
fun nodelst_make_sing (x: node): nodelst

(* ****** ****** *)

(*
fun nodelst_uncons_exn
  (nxs: nodelst): (node, nodelst)
*)
fun nodelst_uncons_opt
  (nxs: nodelst): (Option(node), nodelst)

(* ****** ****** *)

fun nodelst_add (nodelst, node): nodelst
fun nodelst_add_list (nodelst, list0 (node)): nodelst

(* ****** ****** *)

fun handle_node (nx0: node): bool

(* ****** ****** *)
//
fun search_list (nxs: nodelst): void
//
(* ****** ****** *)

(* end of [tree-search.sats] *)

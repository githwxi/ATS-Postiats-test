//
#include
"share/atspre_define.hats"
#include
"share/atspre_staload.hats"
#include
"share/HATS/atspre_staload_libats_ML.hats"
//
(* ****** ****** *)

(*
datatype
tree0 (a:t@ype) =
| tree0_nil of ()
| tree0_cons of (tree0(a), a, tree0(a))
*)

(* ****** ****** *)

abstype node

(* ****** ****** *)
//
extern
fun
node_get_children(node): list0(node)
//
(* ****** ****** *)

extern
fun process_node(node): void

(* ****** ****** *)

extern
fun search_df(node): void
extern
fun search_df_list(list0(node)): void

(* ****** ****** *)

implement
search_df(x0) = let
  val () = process_node(x0)
  val xs = node_get_children(x0)
in
  search_df_list(xs)
end

implement
search_df_list(xs) =
(
case+ xs of
| list0_nil() => ()
| list0_cons(x, xs) => (search_df(x); search_df_list(xs))
)

(* ****** ****** *)

(* end of [gtree-search.dats] *)

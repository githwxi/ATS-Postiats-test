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
fun search2_df(node, list0(node)): void

(* ****** ****** *)

implement
search2_df(x0, xs) = let
  val () = process_node(x0)
  val xs1 = node_get_children(x0)
  val xs2 = list0_append (xs1, xs)
in
  case xs2 of
  | list_nil() => ()
  | list_cons (x0, xs) => search2_df(x0, xs)
end

(* ****** ****** *)

extern
fun search2_bf(node, list0(node)): void

(* ****** ****** *)

implement
search2_bf(x0, xs) = let
  val () = process_node(x0)
  val xs1 = node_get_children(x0)
  val xs2 = list0_append (xs, xs1)
in
  case xs2 of
  | list_nil() => ()
  | list_cons (x0, xs) => search2_bf(x0, xs)
end

(* ****** ****** *)

(* end of [gtree-search2.dats] *)

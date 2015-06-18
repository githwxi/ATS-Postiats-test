//
#include
"share/atspre_define.hats"
#include
"share/atspre_staload.hats"
#include
"share/HATS/atspre_staload_libats_ML.hats"
//
(* ****** ****** *)

datatype
tree0 (a:t@ype) =
| tree0_nil of ()
| tree0_cons of (tree0(a), a, tree0(a))

(* ****** ****** *)

(*
abstype node
*)
typedef node = tree0(int)

(* ****** ****** *)
//
extern
fun
node_get_children(node): list0(node)
//
(* ****** ****** *)

implement
node_get_children
  (x0) =
(
case+ x0 of
| tree0_nil() => list0_nil()
| tree0_cons(xl, _, xr) => list0_pair(xl, xr)
)

(* ****** ****** *)

exception Found

extern
fun process_node(node): void

implement
process_node(x0) =
(
case+ x0 of
| tree0_nil() => ()
| tree0_cons (_, x, _) => if x = 0 then $raise Found() else ()
)

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
| list0_cons(x, xs) =>
    (search_df(x); search_df_list(xs))
)

(* ****** ****** *)

val x0 = tree0_cons (tree0_nil, 0, tree0_nil)
val x1 = tree0_cons (x0, 1, x0)
val x2 = tree0_cons (x1, 2, x1)
val x3 = tree0_cons (x2, 3, x2)

(* ****** ****** *)
//
val () =
try
search_df (x3);
println! ("[0] is not found!")
with ~Found() => println! ("[0] is found!")
//
(* ****** ****** *)

implement main0 () = ()

(* ****** ****** *)

(* end of [gtree-search.dats] *)

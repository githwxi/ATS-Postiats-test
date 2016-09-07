
#include
"share/atspre_staload.hats"
#include
"share/HATS/atspre_staload_libats_ML.hats"

(* ****** ****** *)

staload "./../mylib/mylist.dats"

(* ****** ****** *)
//
datatype
tree(a:t@ype) =
  | tree_nil of ()
  | tree_cons of (tree(a), a, tree(a))
//
(* ****** ****** *)
//
extern
fun
{a,b:t@ype}
tree_fold(xs: tree(a), fopr: (b, a, b) -<cloref1> b, sink: b): b
//
implement
{a,b}
tree_fold
  (xs, fopr, sink) = let
//
fun aux(xs: tree(a)): b =
  case+ xs of
  | tree_nil() => sink
  | tree_cons(xs_l, x0, xs_r) => fopr(aux(xs_l), x0, aux(xs_r))
//
in
  aux(xs)
end // end of [tree_fold]
//
(* ****** ****** *)
//
extern
fun
{a:t@ype}
tree_size(xs: tree(a)): int
extern
fun
{a:t@ype}
tree_height(xs: tree(a)): int
extern
fun
{a:t@ype}
tree_minheight(xs: tree(a)): int
//
(* ****** ****** *)
//
implement
{a}
tree_size(xs) =
  tree_fold<a,int>(xs, lam(s_l, _, s_r) => s_l + 1 + s_r, 0)
//
implement
{a}
tree_height(xs) =
  tree_fold<a,int>(xs, lam(h_l, _, h_r) => 1 + max(h_l, h_r), 0)
//
implement
{a}
tree_minheight(xs) =
  tree_fold<a,int>(xs, lam(h_l, _, h_r) => 1 + min(h_l, h_r), 0)
//
(* ****** ****** *)
//
extern
fun
{a:t@ype}
tree_isPerfect
  (xs: tree(a)): bool
//
implement
{a}
tree_isPerfect(xs) = let
//
exception NotPerfect of (int, int)
//
in
//
try let
  val _ =
  tree_fold<a,int>
  ( xs
  , lam(s_l, _, s_r) =>
      if s_l = s_r then s_l + 1 + s_r else $raise NotPerfect(s_l, s_r)
    // end of [lam]
  , 0(*sink*)
  )
in
  true
end with ~NotPerfect(s_l, s_r) => false
//
end // end of [tree_isPerfect]
//
(* ****** ****** *)

implement
main0 () = {
//
val xs0 = tree_nil()
val xs1 = tree_cons(xs0, 1, xs0)
val xs2 = tree_cons(xs1, 2, xs1)
val xs3 = tree_cons(xs2, 3, xs2)
//
val ((*void*)) = assertloc(tree_isPerfect(xs3))
//
val ((*void*)) = println! ("The code has passed testing!")
//
} (* end of [main0] *)

(* ****** ****** *)

(* end of [Perfect.dats] *)

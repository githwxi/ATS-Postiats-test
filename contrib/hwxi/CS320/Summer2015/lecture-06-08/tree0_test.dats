//
#include
"share/atspre_staload.hats"
//
#include
"share/HATS/atspre_staload_libats_ML.hats"
//
(* ****** ****** *)

datatype
tree0(a:t@ype) =
| tree0_nil of ()
| tree0_cons of (tree0(a), a, tree0(a))

(* ****** ****** *)

extern
fun{a:t@ype}
tree0_size(tree0(a)): int

(* ****** ****** *)

extern
fun{a:t@ype}
tree0_depth(tree0(a)): int

(* ****** ****** *)

extern
fun{a:t@ype}
tree0_depth_min(tree0(a)): int

(* ****** ****** *)

implement
{a}(*tmp*)
tree0_size(xs) =
(
case+ xs of
| tree0_nil() => 0
| tree0_cons(xs_l, _, xs_r) => 1+(tree0_size(xs_l)+tree0_size(xs_r))
)

(* ****** ****** *)

implement
{a}(*tmp*)
tree0_depth(xs) =
(
case+ xs of
| tree0_nil() => 0
| tree0_cons(xs_l, _, xs_r) => 1+max(tree0_size(xs_l), tree0_size(xs_r))
)

(* ****** ****** *)

implement
{a}(*tmp*)
tree0_depth_min(xs) =
(
case+ xs of
| tree0_nil() => 0
| tree0_cons(xs_l, _, xs_r) => 1+min(tree0_size(xs_l), tree0_size(xs_r))
)

(* ****** ****** *)

extern
fun{a:t@ype}
isPerfect(xs: tree0(a)): bool

(* ****** ****** *)

(*
implement
{a}(*tmp*)
isPerfect(xs) =
(
case+ xs of
| tree0_nil() => true
| tree0_cons(xs_l, _, xs_r) =>
  isPerfect(xs_l) && isPerfect(xs_r) && (tree0_depth(xs_l)=tree0_depth(xs_r))
)
*)

(* ****** ****** *)

implement
{a}(*tmp*)
isPerfect(xs) = let
//
exception
NotPerfect of ()
//
fun
aux(xs: tree0(a)): int =
(
case+ xs of
| tree0_nil() => 0
| tree0_cons
    (xs_l, _, xs_r) => let
    val d_l = aux(xs_l)
    and d_r = aux(xs_r)
  in
    if d_l = d_r then 1+d_l else $raise NotPerfect()
  end // end of [tree0_cons]
)
//
in
//
try
let val _ = aux(xs) in true end
with
| ~NotPerfect() => false
//
end // end of [isPerfect]

(* ****** ****** *)

val t0 = tree0_nil()
val t1 = tree0_cons(t0, 1, t0)
val t2 = tree0_cons(t1, 2, t1)
val t3 = tree0_cons(t2, 3, t2)

(* ****** ****** *)

implement
main0 () =
let
  val () = assertloc (isPerfect(t3))
in
  // nothing
end

(* ****** ****** *)

(* end of [tree0_test.dats] *)

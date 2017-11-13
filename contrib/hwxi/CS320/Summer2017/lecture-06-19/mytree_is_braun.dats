(* ****** ****** *)

#include
"share/atspre_staload.hats"
#include
"share/HATS/atspre_staload_libats_ML.hats"

(* ****** ****** *)

(*
//
** HX: 10 points
** A Braun tree is defined as follows:
**
** 1. tree0_nil is a Braun tree
** 2. tree0_cons(t_l, _, t_r) is a Braun tree
** if both t_l and t_r are Braun trees and also
** size(t_r) <= size(t_l) <= size(t_r) + 1
**
** Please implement [mytree_is_braun] which tests
** whether a given tree is a Braun tree or not.
//
*)
//
datatype
tree0(a:t@ype) =
  | tree0_nil of ()
  | tree0_cons of (tree0(a), a, tree0(a))
//
(* ****** ****** *)

extern
fun{a:t@ype}
mytree_is_braun(xs: tree0(a)): bool

(* ****** ****** *)

implement
{a}
mytree_is_braun
  (t0) = let
//
exception NotBraun
//
fun
size(t0: tree0(a)): int =
(
case+ t0 of
| tree0_nil() => 0
| tree0_cons
  (
    tl, _, tr
  ) => let
    val sl = size(tl)
    and sr = size(tr)
  in
    if
    (sr <= sl && sl <= sr+1)
      then sl+1+sr else $raise NotBraun
    // end of [if]
  end // end of [tree0_cons]
) (* end of [size] *)
//
in
  try
    let val _ = size(t0) in true end
  with ~NotBraun() => false
end // end of [mytree_is_braun]

(* ****** ****** *)

implement
main0() =
{
//
val t0 = tree0_nil()
val t1 = tree0_cons{int}(t0, 1, t0)
val t2 = tree0_cons{int}(t1, 2, t0)
//
val t3 = tree0_cons{int}(t1, 3, t1)
val t4 = tree0_cons{int}(t2, 3, t1)
val t5 = tree0_cons{int}(t2, 3, t2)
//
val t8 = tree0_cons{int}(t3, 8, t4)
//
val () = assertloc(mytree_is_braun(t3))
val () = assertloc(mytree_is_braun(t4))
val () = assertloc(mytree_is_braun(t5))
//
val () = assertloc(~mytree_is_braun(t8))
//
} (* end of [main0] *)

(* ****** ****** *)

(* end of [mytree_is_braun.dats] *)

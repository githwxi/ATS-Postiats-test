
(*
** // ...
*)

#include
"share/HATS/atspre_staload_libats_ML.hats"

fun{a:t@ype}
reverse(xs: list0(a)): list0(a) =
  case+ xs of
  | list0_nil() => list0_nil()
  | list0_cons(x, xs) => reverse(xs) + list0_sing(x)

(* ****** ****** *)

implement main0() = ()

(* ****** ****** *)

(* end of [bad-reverse.dats] *)

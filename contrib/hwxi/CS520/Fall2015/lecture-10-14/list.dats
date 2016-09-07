(*
** Illustrating something ...
*)

extern
fun{a:t@ype}
list_append
  {m,n:int}
  (xs: list(a, m), ys: list(a, n)): list(a, m+n)

implement
{a}
list_append
  {m,n}(xs, ys) = let
//
prval () = lemma_list_param(xs) // m >= 0
prval () = lemma_list_param(ys) // n >= 0
//
fun append
  {m:nat}
  (xs: list(a, m), ys: list(a, n)): list(a, m+n) =
  case+ xs of
  | list_nil() => ys
  | list_cons(x, xs) => list_cons(x, append (xs, ys))
//
in
  append(xs, ys)
end

implement main0() = ()

(* ****** ****** *)

(* end of [list.dats] *)
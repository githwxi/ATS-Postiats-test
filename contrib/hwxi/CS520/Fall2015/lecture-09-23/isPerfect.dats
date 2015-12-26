(*
** A simple example for
** illustrating how to use exceptions
*)

(* ****** ****** *)

datatype
tree(a:t@ype) =
  | tree_nil of () // empty tree
  | tree_cons of (tree(a), a, tree(a))

macdef
tree_leaf(x) = tree_cons(tree_nil, ,(x), tree_nil)

extern
fun{a:t@ype}
height(t0: tree(a)): int

extern
fun{a:t@ype}
isPerfect(t0: tree(a)): bool


(*
implement{a}
isPerfect(t0) =
case+ t0 of
| tree_nil() => true
| tree_cons(tl, _, tr) =>
  isPerfect(tl) && isPerfect(tr) && (height(tl) = height(tr))
*)

implement{a}
isPerfect(t0) = let
  exception NotPerfect of ()
  fun aux(t0: tree(a)): int =
    case+ t0 of
    | tree_nil () => 0
    | tree_cons(tl, _, tr) => let
        val hl = aux(tl)
        val hr = aux(tr)
      in
        if hl = hr then 1 + hl else $raise NotPerfect
      end // end of [aux]
in
  try (ignoret(aux(t0)); true) with ~NotPerfect() => false
end // end of [isPerfect]

(* ****** ****** *)

(* end of [isPerfect.dats] *)

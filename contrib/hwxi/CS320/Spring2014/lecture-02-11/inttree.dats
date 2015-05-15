(* ****** ****** *)
//  
// inttree: integer trees
//
(* ****** ****** *)

datatype inttree =
  | inttree_nil of ()
  | inttree_cons of (inttree(*left*), int, inttree(*right*))

(* ****** ****** *)

(*
leaf: inttree_cons (inttree_nil, int, inttree_nil)
*)

(* ****** ****** *)

#define tnil inttree_nil
#define tcons inttree_cons

(* ****** ****** *)

extern
fun size (inttree): int
extern
fun height (inttree): int

implement
size (t0) =
(
  case+ t0 of
  | tnil () => 0 | tcons (tl, _, tr) => 1 + (size(tl) + size(tr))
)

implement
height (t0) =
(
  case+ t0 of
  | tnil () => 0 | tcons (tl, _, tr) => 1 + max (height(tl), height(tr))
)

(* ****** ****** *)
//
datatype intlist =
  | intlist_nil of ()
  | intlist_cons of (int, intlist)
//
(* ****** ****** *)
//
extern
fun intlist_append (intlist, intlist): intlist
//
(* ****** ****** *)
//
extern
fun flatten (inttree): intlist
//
implement
flatten (t0) =
  case+ t0 of
  | tnil () => intlist_nil ()
  | tcons (tl, x, tr) =>
    intlist_append (flatten(tl), intlist_cons(x, flatten(tr)))
//
(* ****** ****** *)

(* end of [inttree.dats] *)

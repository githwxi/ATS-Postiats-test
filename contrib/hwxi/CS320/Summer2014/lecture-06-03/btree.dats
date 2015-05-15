//
#include
"share/atspre_staload.hats"
//
staload "libats/ML/SATS/basis.sats"
staload "libats/ML/SATS/list0.sats"
staload _ = "libats/ML/DATS/list0.dats"
//
(* ****** ****** *)

datatype
btree(a:t@ype) =
| btree_nil of ()
| btree_cons of (btree(a), a, btree(a))

(* ****** ****** *)

extern
fun{a:t@ype} btree_size (btree(a)): int
extern
fun{a:t@ype} btree_height (btree(a)): int

(* ****** ****** *)

implement
{a}(*tmp*)
btree_size (t0) =
(
case+ t0 of
| btree_nil () => 0
| btree_cons (tl, _, tr) => 1 + (btree_size(tl) + btree_size(tr))
)

(* ****** ****** *)

implement
{a}(*tmp*)
btree_height (t0) =
(
case+ t0 of
| btree_nil () => 0
| btree_cons (tl, _, tr) => 1 + max (btree_height(tl), btree_height(tr))
)

(* ****** ****** *)

extern
fun{a:t@ype} isPerfect (btree(a)): bool

(* ****** ****** *)

implement
{a}(*tmp*)
isPerfect (t0) =
(
case+ t0 of
| btree_nil () => true
| btree_cons (tl, _, tr) =>
  isPerfect(tl) && isPerfect(tr) && btree_height(tl) = btree_height(tr)
)

(* ****** ****** *)

extern
fun{a:t@ype} isPerfect2 (btree(a)): bool

(* ****** ****** *)

implement
{a}(*tmp*)
isPerfect2 (t0) = let
//
exception NotPerfect of ()
//
fun aux (t0: btree(a)): int =
(
case+ t0 of
| btree_nil () => 0
| btree_cons
    (tl, _, tr) => let
    val hl = aux (tl)
    and hr = aux (tr)
  in
    if hl = hr then hl + 1 else $raise NotPerfect()
  end
)
in
  try ignoret(aux(t0)); true with ~NotPerfect() => false
end // end of [isPerfect2]

(* ****** ****** *)

extern
fun{a:t@ype}
btree2list (btree(a)): list0(a)

(* ****** ****** *)

(*
implement
{a}(*tmp*)
btree2list (t0) =
(
case+ t0 of
| btree_nil () => list0_nil ()
| btree_cons (tl, x, tr) =>
  btree2list (tl) + cons0 (x, btree2list (tr))
)
*)

implement
{a}(*tmp*)
btree2list (t0) = let
//
fun aux
(
  t0: btree(a), res: list0(a)
) : list0(a) =
//
(
case+ t0 of
| btree_nil () => res
| btree_cons
    (tl, x, tr) => let
    val res = aux (tr, res)
    val res = list0_cons (x, res)
    val res = aux (tl, res)
  in
    res
  end
)
//
in
  aux (t0, list0_nil)
end // end of [btree2list]

(* ****** ****** *)

extern
fun{a:t@ype}
list2btree (list0(a)): btree(a)

(* ****** ****** *)

implement
{a}(*tmp*)
list2btree (xs) = let
//
fun aux
(
  xs: list0(a), n: int
) : btree(a) =
  case+ xs of
  | list0_nil () => btree_nil ()
(*
  | list0_cons (x, list0_nil ()) =>
      btree_cons (btree_nil(), x, btree_nil())
*)
  | _(*n >= 2*) => let
     val n2 = n / 2
     val xs1 = list0_take_exn (xs, n2)
     val xs2 = list0_drop_exn (xs, n2)
     val-list0_cons (x, xs2) = xs2
   in
     btree_cons (aux(xs1, n2), x, aux(xs2, n-n2-1))
   end
//
in
  aux (xs, length(xs))
end // end of [list2btree]

(* ****** ****** *)

implement main0 () = ()

(* ****** ****** *)

(* end of [btree.dats] *)

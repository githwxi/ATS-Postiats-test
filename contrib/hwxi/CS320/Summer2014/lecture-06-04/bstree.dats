(*
** Binary search tree
*)

(* ****** ****** *)

datatype
btree(a:t@ype) =
| btree_nil of ()
| btree_cons of (btree(a), a, btree(a))

(* ****** ****** *)

extern
fun{a:t@ype}
bstree_test (bt: btree(a)): bool

(* ****** ****** *)

implement
{a}(*tmp*)
bstree_test
  (bt) = let
//
exception NotBST of ()
//
fun auxminmax
(
  bt: btree(a), x0: a
) : (a, a) = let
in
  case+ bt of
  | btree_nil () => (x0, x0)
  | btree_cons
      (btl, x, btr) => let
        val (xmin_l, xmax_l) = auxminmax (btl, x)
        val (xmin_r, xmax_r) = auxminmax (btr, x)
        val () = if ggt_val_val (xmax_l, x) then $raise NotBST()
        val () = if glt_val_val (xmin_r, x) then $raise NotBST()
      in
        (xmin_l, xmax_r)
      end // end of [btree_cons]
end // end of [auxminmax]
//
in
//
case+ bt of
| btree_nil () => true
| btree_cons (_, x0, _) =>
    try ignoret(auxminmax(bt, x0)); true with ~NotBST() => false
end // end of [bstree_test]

(* ****** ****** *)
//
extern
fun{}
dictionary_find
  (bt0: btree(string), w0: string): bool
//
implement
{}(*tmp*)
dictionary_find (bt0, w0) =
(
  case+ bt0 of
  | btree_nil () => false
  | btree_cons
      (btl, w, btr) => let
      val sgn = compare (w0, w)
    in
      case+ 0 of
      | _ when sgn < 0 => dictionary_find (btl, w0)
      | _ when sgn > 0 => dictionary_find (btr, w0)
      | _ (* sgn = 0 *) => true
    end // end of [btree_cons]
)

(* ****** ****** *)

implement main0 () = ()

(* ****** ****** *)

(* end of [bstree.dats] *)

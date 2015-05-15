(* ****** ****** *)

#include
"share/atspre_staload.hats"
#include
"share/HATS/atspre_staload_libats_ML.hats"

(* ****** ****** *)

staload "./tree-search.sats"
staload "./breadth-first.sats"

(* ****** ****** *)

datatype
queue(a:t@ype) = QUE of (list0(a), list0(a))

(* ****** ****** *)

assume nodelst_type = queue (node)

(* ****** ****** *)

implement
nodelst_make_nil () = QUE (nil0(), nil0())

(* ****** ****** *)

implement
nodelst_add
  (nxs, nx) = let
  val QUE (f, r) = nxs
in
  QUE (cons0 (nx, f), r)
end // end-of-impl

(* ****** ****** *)

implement
nodelst_uncons_opt (nxs) = let
//
val QUE (f, r) = nxs
//
in
//
case+ r of
//
| nil0 () => let
    val f_rev = list0_reverse (f)
  in
    case+ f_rev of
    | nil0 () => (None(), nxs)
    | cons0 (nx, f2_rev) => (Some(nx), QUE(nil0, f2_rev))
  end (* end of [nil0] *)
//
| cons0 (nx, r2) => (Some(nx), QUE(f, r2))
//
end

(* ****** ****** *)
//
implement
breadth_search (x) = let
  val xs = list0_sing (x)
in
  search_list (QUE (nil0 (), xs))
end // end of [breadth_search]
//
(* ****** ****** *)
//
implement
breadth_search_list
  (xs) = search_list (QUE (nil0 (), xs))
//
(* ****** ****** *)

(* end of [breadth-first.dats] *)

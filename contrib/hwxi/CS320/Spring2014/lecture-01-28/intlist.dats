(* ****** ****** *)
//
// HX-2014-01-28:
// An abstract interface for integer lists
//
(* ****** ****** *)
//
#include
"share/HATS/atspre_staload_libats_ML.hats"
//
(* ****** ****** *)

staload "./intlist.sats"

(* ****** ****** *)

assume intlist = list0 (int)

(* ****** ****** *)

implement
intlist_nil () = list0_nil ()
implement
intlist_cons (x, xs) = list0_cons{int}(x, xs)

(* ****** ****** *)
//
implement
intlist_head (xs) =
  let val-list0_cons (x, _) = xs in x end
implement
intlist_tail (xs) =
  let val-list0_cons (_, xs) = xs in xs end
//
(* ****** ****** *)

implement
intlist_is_nil (xs) =
(
case+ xs of list0_nil () => true | _ =>> false
)
implement
intlist_is_cons (xs) =
(
case+ xs of list0_cons _ => true | _ =>> false
)

(* ****** ****** *)

(* end of [intlist.dats] *)

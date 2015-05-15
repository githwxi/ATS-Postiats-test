//
#include
"share/atspre_staload.hats"
//
(* ****** ****** *)

staload "libats/ML/SATS/basis.sats"
staload "libats/ML/SATS/list0.sats"

(* ****** ****** *)

staload "libats/ML/SATS/funmap.sats"

(* ****** ****** *)

staload "libats/ML/DATS/list0.dats"

(* ****** ****** *)

staload
"libats/DATS/funmap_avltree.dats"
staload "libats/ML/DATS/funmap.dats"

(* ****** ****** *)

staload "./word-connecting.sats"

(* ****** ****** *)

assume wordmap = map (word, wordlst)

(* ****** ****** *)

implement
wordmap_make_nil () = funmap_make_nil ()

(* ****** ****** *)

implement
wordmap_find
  (map, key) = let
  val opt = funmap_search (map, key)
in
  case+ opt of
  | ~Some_vt (ws) => ws
  | ~None_vt ((*void*)) => list0_nil ()
end // end of [wordmap_find]

(* ****** ****** *)

implement
wordmap_insert
  (map, key, w) = let
  var map = map
  val opt = funmap_takeout (map, key)
  val map = map
in
  case+ opt of
  | ~None_vt () => let
      val ws = list0_sing (w)
      var map = map
      val opt = funmap_insert (map, key, ws)
      val-~None_vt () = opt
    in
      map
    end
  | ~Some_vt (ws) => let
      val ws = list0_cons (w, ws)
      var map = map
      val opt = funmap_insert (map, key, ws)
      val-~None_vt () = opt
    in
      map
    end
end // end of [wordmap_insert]

(* ****** ****** *)

(* end of [word-connecting-wordmap.dats] *)

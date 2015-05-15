(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
//
(* ****** ****** *)

staload "libats/ML/SATS/basis.sats"
staload "libats/ML/SATS/list0.sats"
staload "libats/ML/SATS/option0.sats"

(* ****** ****** *)

staload "./word-connecting.sats"

(* ****** ****** *)

implement
word_getopt () = None0 ()

(* ****** ****** *)

implement
wordmap_build () = let
//
fun loop
(
  map: wordmap, key: word
) : wordmap = let
  val opt = word_getopt ()
in
  case+ opt of
  | None0 () => map
  | Some0 (key2) => let
      val map =
        wordmap_insert (map, key, key2)
    in
      loop (map, key2)
    end // end of [Some0]
end // end of [wordmap_build]
//
val opt = word_getopt ()
val map = wordmap_make_nil ()
//
in
  case+ opt of
  | None0 () => map
  | Some0 (key) => loop (map, key)
end // end of [wordmap_build]

(* ****** ****** *)

dynload "./word-connecting-wordmap.dats"

(* ****** ****** *)

implement main0 () = ()

(* ****** ****** *)

(* end of [word-connecting.dats] *)

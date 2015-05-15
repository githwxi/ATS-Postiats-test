(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
//
(* ****** ****** *)

staload "libats/ML/SATS/basis.sats"
staload "libats/ML/SATS/list0.sats"
staload "libats/ML/SATS/option0.sats"
//
staload "libats/ML/DATS/list0.dats"
staload "libats/ML/DATS/option0.dats"
//
(* ****** ****** *)

typedef word = string

(*
extern
fun word_get (): string
*)
extern
fun word_getopt (): option0(string)

(* ****** ****** *)

abstype wordmap = ptr

extern
fun wordmap_make_nil (): wordmap
extern
fun wordmap_incby1 (wordmap, word): wordmap
extern
fun wordmap_get_count (wordmap, word): int
extern
fun
wordmap_listize (wordmap): list0 @(word, int)

(* ****** ****** *)

local
//
staload
"libats/ML/SATS/funmap.sats"
//
staload _ = "libats/DATS/qlist.dats"
staload _ = "libats/DATS/funmap_avltree.dats"
//
staload _ = "libats/ML/DATS/funmap.dats"
//
assume wordmap = map (string, int)
//
in (*in-of-local*)

implement
wordmap_make_nil
  () = funmap_make_nil ()
//
implement
wordmap_incby1
  (map, w) = let
//
var map = map
val opt = funmap_takeout (map, w)
val map = map
//
in
//
case+ opt of
| ~None_vt () => map where
  {
    var map = map
    val-~None_vt () = funmap_insert (map, w, 1)
  }
| ~Some_vt (n) => map where
  {
    var map = map
    val-~None_vt () = funmap_insert (map, w, n+1)
  }
//
end // end of [wordmap_incby1]
//
implement
wordmap_get_count
  (map, w) = let
//
val opt = funmap_search (map, w)
//
in
//
case+ opt of
| ~Some_vt (n) => n | ~None_vt () => 0
//
end // end of [wordmap_get_count]
//
implement
wordmap_listize (map) = funmap_listize (map)

end // end of [local]

(* ****** ****** *)

extern
fun
wordmap_build (): wordmap

(* ****** ****** *)

implement
wordmap_build () = let
//
fun loop
(
  map: wordmap
) : wordmap = let
  val opt = word_getopt ()
in
  case+ opt of
  | None0 () => map
  | Some0 (x) => let
      val map = wordmap_incby1 (map, x)
    in
      loop (map)
    end // end of [Some0]
end
//
in
  loop (wordmap_make_nil ())
end // end of [wordmap_build]

(* ****** ****** *)

implement
word_getopt () = let
//
val w =
fileref_get_word (stdin_ref)
//
in
//
if isneqz (w) then Some0(strptr2string(w)) else (free(w); None0())
//
end // end of [word_getopt]

(* ****** ****** *)

implement
main0 () = {
//
val map = wordmap_build ()
val wns = wordmap_listize (map)
val wns =
list0_mergesort
(
  wns
, lam (wn1, wn2) =>
  let
    val sgn = compare (wn1.1, wn2.1)
  in
    if sgn != 0 then 1-sgn else 1-compare (wn1.0, wn2.0)
  end // end of [lam]
) (* end of [list0_mergesort] *)
//
val out = stdout_ref
//
implement
fprint_val<(string,int)> (out, wn) = fprint! (out, wn.0, "(", wn.1, ")")
//
val () =
fprintln! (out, "word(frequency):")
val () = fprint_list0_sep (out, wns, "\n")
val ((*void*)) = fprint_newline (out)
//
} (* end of [main0] *)

(* ****** ****** *)

(* end of [word-counting.dats] *)

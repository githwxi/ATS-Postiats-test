(* ****** ****** *)
(*
** Doublets is a word game ...
*)
(* ****** ****** *)

#include
"share/atspre_staload.hats"
#include
"share/HATS/atspre_staload_libats_ML.hats"

staload "./Doublets.sats"

(* ****** ****** *)

assume word = list0(char)

(* ****** ****** *)
//
implement
string2word(str) = string_explode(str)
//
(* ****** ****** *)
//
implement
eq_word_word(w1, w2) =
  list0_equal(w1, w2, lam(c1, c2) => (c1=c2))
//
(* ****** ****** *)
//
implement
print_word(w) = fprint_word(stdout_ref, w)
implement
fprint_word(out, w) = fprint_list0_sep(out, w, "")
//
(* ****** ****** *)
//
fun
word_is_legal(cs: word): bool =
  theWords_map_search(string_implode(cs))
//
(* ****** ****** *)

(*
//
// HX: Please implement
// the function [word_get_neighbors]
//
*)
(*
implement
word_get_neighbors(w0) = list0_nil()
*)

(* ****** ****** *)

(* end of [Doublets_word.dats] *)

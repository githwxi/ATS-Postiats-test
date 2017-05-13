(* ****** ****** *)
(*
** Doublets is a word game ...
*)
(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
#include
"share/HATS/atspre_staload_libats_ML.hats"
//
(* ****** ****** *)
//
fun
theWords_map_search
  (x0: string): bool
//
(* ****** ****** *)

abstype word

(* ****** ****** *)

typedef wordlst = list0(word)

(* ****** ****** *)
//
fun
string2word : string -> word
//
(* ****** ****** *)
//
fun
eq_word_word
  : (word, word) -> bool
//
overload = with eq_word_word
//
(* ****** ****** *)
//
fun
print_word : (word) -> void
fun
fprint_word : (FILEref, word) -> void
//
overload print with print_word
overload fprint with fprint_word
//
(* ****** ****** *)

fun
word_get_neighbors(word): list0(word)

(* ****** ****** *)

(* end of [Doublets.sats] *)

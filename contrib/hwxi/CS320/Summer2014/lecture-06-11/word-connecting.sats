(* ****** ****** *)
//
staload
"libats/ML/SATS/basis.sats"
//
(* ****** ****** *)

typedef word = string
typedef wordlst = list0 (word)

(* ****** ****** *)

fun word_getopt (): option0(string)

(* ****** ****** *)

abstype wordmap = ptr

(* ****** ****** *)

fun wordmap_make_nil (): wordmap

fun wordmap_find
  (map: wordmap, key: word): wordlst
fun wordmap_insert
  (map: wordmap, key: word, itm: word): wordmap

(* ****** ****** *)

fun wordmap_build (): wordmap

(* ****** ****** *)

(* end of [word-connecting.sats] *)

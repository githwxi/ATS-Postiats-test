//
#include
"share/atspre_staload.hats"
//
#include
"share/HATS/atspre_staload_libats_ML.hats"
//
(* ****** ****** *)

typedef word = string

(* ****** ****** *)
//
exception
WordGetExn of ()
//
extern
fun word_get(): word
//
extern
fun char_get(): int
//
(* ****** ****** *)

implement
word_get() = let
//
fun
skip(): int = let
  val c = char_get()
in
//
if
c >= 0
then (if isalpha(c) then c else skip())
else (c)
//
end // end of [skip]
//
fun
loop
(
  cs: list0(char)
) : word = let
//
val c = char_get()
//
in
  if isalpha(c)
    then loop(cons0(int2char0(c), cs)) else string_implode(cs)
  // end of [if]
end // end of [loop]
//
val c = skip()
//
in
  if c >= 0 then loop(list0_sing(int2char0(c))) else $raise WordGetExn()
end // end of [word_get]

(* ****** ****** *)

abstype wordmap = ptr

(* ****** ****** *)

extern
fun
wordmap_insert(wordmap, word): void

(* ****** ****** *)
//
extern
fun wordmap_insert_all(wordmap): void
//
(* ****** ****** *)

implement
wordmap_insert_all
  (wmap) = let
//
fun
loop(): void = let
  val w = word_get()
  val () = wordmap_insert(wmap, w)
in
  loop()
end // end of [loop]
//
in
//
try loop() with ~WordGetExn() => ()
//
end // end of [wordmap_insert_all]

(* ****** ****** *)

(* end of [word-counting.dats] *)


//
#include
"share/atspre_staload.hats"
//
#include
"share/HATS/atspre_staload_libats_ML.hats"
//
(* ****** ****** *)

#define
ATS_PACKNAME "WORD_COUNTING"

(* ****** ****** *)

staload UN = "prelude/SATS/unsafe.sats"

(* ****** ****** *)

typedef word = string

(* ****** ****** *)
//
exception
WordGetExn of ()
//
extern
fun char_get(): int
//
extern
fun word_get(): word
//
(* ****** ****** *)
//
fun
isalpha2(c: int): bool = isalpha(c)
//
(* ****** ****** *)

implement
char_get() = fileref_getc (stdin_ref)

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
else (~1)
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
  if isalpha2(c)
    then loop(cons0(int2char0(c), cs))
    else string_implode(list0_reverse(cs))
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
wordmap_make_nil(): wordmap
  
(* ****** ****** *)

extern
fun
wordmap_insert(wordmap, word): void

(* ****** ****** *)

extern
fun
wordmap_listize(wordmap): list0 @(word, int)

(* ****** ****** *)

local

local
//
typedef
key = word and itm = int
//
in (* in-of-local *)
//
#include "libats/ML/HATS/myhashtblref.hats"
//
end // end of [local]

assume wordmap = myhashtbl

in (* in-of-local *)

implement
wordmap_make_nil() = myhashtbl_make_nil(1024)

implement
wordmap_insert
  (map, w) = let
//
val opt = map.search(w)
//
in
//
case+ opt of
| ~None_vt() =>
  {
    val-~None_vt() = map.insert(w, 1)
  }
| ~Some_vt(n) =>
  {
    val-~Some_vt(_) = map.insert(w, n+1)
  }
//
end // end of [wordmap_insert]

implement
wordmap_listize(map) = list0_of_list(map.listize1())

end // end of [local]

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

implement
main0 () =
{
//
val () =
println! ("Hello from [word-counting]!")
//
val
theWordmap = wordmap_make_nil()
//
val () = wordmap_insert_all(theWordmap)
//
val kns = wordmap_listize(theWordmap)
val kns = list0_mergesort<(word,int)>(kns, lam (kn1, kn2) => ~compare(kn1.1, kn2.1))
val () =
loop(kns, 100) where
{
//
fun
loop
(
  kns: list0 @(word, int), N: int
) : void =
if N > 0 then
(
case+ kns of
| nil0 () => ()
| cons0 (kn, kns) =>
    (println! (kn.0, " -> ", kn.1); loop(kns, N-1))
  // end of [cons0]
) (* end of [loop] *)
//
} (* end of [val] *)
//
} (* end of [main0] *)

(* ****** ****** *)

(* end of [word-counting.dats] *)

(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
#include
"share/HATS/atspre_staload_libats_ML.hats"
//
staload UN = "prelude/SATS/unsafe.sats"
//
(* ****** ****** *)

staload "libats/SATS/theGetters.sats"
staload "libats/DATS/theGetters.dats"

(* ****** ****** *)

(*
abstype
word_type
typedef
word = word_type
*)
typedef
word = string
typedef
wordlst = list0(word)

(* ****** ****** *)
//
extern fun char_get(): int
//
extern fun word_get(): word
//
(* ****** ****** *)

implement
word_get() = let
//
fun
skip(): int = let
  val c = char_get()
in
  if c >= 0
    then (
      if isalpha(c) then c else skip()
    ) else c
  // end of [if]
end // end of [skip]
//
fun
chars
(
  cs: list0(char)
) : list0(char) = let
  val c = char_get()
in
  if isalpha(c)
    then chars(cons0(int2char0(c), cs)) else cs
  // end of [if]
end // end of [chars]
//
val c0 = skip()
//
val cs =
(
  if c0 >= 0
    then chars(list0_sing(int2char0(c0))) else nil0()
  // end of [if]
) : list0(char)
//
in
  case+ cs of
  | list0_cons _ => string_make_rlist(cs)
  | list0_nil () => $raise Exception_the_get_elt_exn()
end // end of [word_get]

(* ****** ****** *)
//
extern
fun
wordlst_get(): wordlst
//
implement
wordlst_get() = let
//
implement
the_get_elt_exn<word>() = word_get()
//
in
  list0_of_list_vt(the_getall_list_exn<word>())
end // end of [wordlst_get]

(* ****** ****** *)
//
datatype
nword =
NWORD of (int, word)
//
extern
fun
compare_nword_nword
  : (nword, nword) -<> int
//
overload compare with compare_nword_nword
//
(* ****** ****** *)

implement
compare_nword_nword
  (x1, x2) = let
//
val+NWORD(n1, w1) = x1
val+NWORD(n2, w2) = x2
//
val sgn1 = compare(n1, n2)
//
in
  if sgn1 != 0 then ~sgn1 else compare(w1, w2)
end // end of [compare_nword_nword]

(* ****** ****** *)

typedef
nwordlst = list0(nword)

(* ****** ****** *)
//
extern
fun
word2nwordlst : wordlst -> nwordlst
//
implement
word2nwordlst(ws) = let
//
fun
loop1 (ws: wordlst): nwordlst =
case+ ws of
| list0_nil() => list0_nil()
| list0_cons(w, ws) => loop2 (ws, w, 1, list0_nil)
//
and
loop2
(
  ws: wordlst
, w0: word, n0: int, res: nwordlst
) : nwordlst =
(
case+ ws of
| list0_nil() =>
    list0_cons(NWORD(n0, w0), res)
  // end of [list0_nil]
| list0_cons(w, ws) =>
  (
    if w0 = w
      then loop2 (ws, w0, n0+1, res)
      else loop2 (ws, w, 1, list0_cons(NWORD(n0, w0), res))
    // end of [if]
  )
)
//
in
  loop1 (ws)
end // end of [word2nwordlst]
//
(* ****** ****** *)
//
extern
fun
word_count(): nwordlst
//
implement
word_count() = let
//
val ws = wordlst_get()
val ws =
  list0_mergesort(ws, lam(x, y) => compare(x, y))
//
val nws = word2nwordlst(ws)
//
in
  list0_mergesort(nws, lam(x, y) => compare(x, y))
end // end of [word_count]

(* ****** ****** *)
//
implement
char_get() =
  fileref_getc(stdin_ref)
//
(* ****** ****** *)

dynload "./word_count_mylib.dats"

(* ****** ****** *)

implement
main0 () =
{
//
val nws = word_count()
//
val () =
println!
  ("length(nws) = ", length(nws))
//
implement
fprint_val<nword>
  (out, NWORD(n, w)) =
  fprintln! (out, w, "(", n, ")")
//
implement
fprint_list$sep<>(out) = ((*void*))
//
val ((*void*)) = fprint_list0(stdout_ref, nws)
//
} (* end of [main0] *)

(* ****** ****** *)

(* end of [word_count.dats] *)

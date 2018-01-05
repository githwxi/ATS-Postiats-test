(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
#include
"share/atspre_staload_libats_ML.hats"
//
(* ****** ****** *)
//
#staload UN = "prelude/SATS/unsafe.sats"
//
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
(* ****** ****** *)
//
val
theChars =
stream_tabulate_fun<int>
  (lam(_) => char_get())
//
(* ****** ****** *)

val
theWords = $delay
(
let
//
typedef ints = stream(int)
//
fun
loop
(
  cs: ints
) : stream_con(string) =
(
case+ !cs of
| stream_nil
    () => stream_nil()
  // stream_nil
| stream_cons
    (c, cs) =>
    if c >= 0 then
    (
      if isalpha(c)
        then loop2(cs, list0_sing(int2char0(c))) else loop(cs)
      // end of [if]
    ) else stream_nil()
  // end of [stream_cons]
) (* end of [loop] *)
//
and
loop2
(
  cs: ints, res: list0(char)
) : stream_con(string) =
(
case+ !cs of
| stream_nil() => let
    val w = string_make_rlist0(res)
  in
    stream_cons(w, $delay(stream_nil()))
  end // end of [stream_nil]
| stream_cons(c, cs) =>
    if isalpha(c)
      then loop2(cs, list0_cons(int2char0(c), res))
      else stream_cons(string_make_rlist0(res), $delay(loop(cs)))
    // end of [if]
) (* end of [loop2] *)
//
in
  loop(theChars)
end // end of [let]
) : stream_con(string) // end of [theWords]
//
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
val ws =
  list0_of_list_vt(stream2list(theWords))
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

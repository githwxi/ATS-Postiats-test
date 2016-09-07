(*
** Enumerate the words
** according to their frequencies
** in a given file.
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
%{^
//
#undef ATSextfcall
#define \
ATSextfcall(fun, arg) fun arg
//
%} // ...
staload
"libats/libc/SATS/unistd.sats"
staload
"libats/libc/SATS/sys/wait.sats"
//
(* ****** ****** *)

staload "./../mylib/mylist.dats"

(* ****** ****** *)
//
extern
fun
char_get(): int
//
extern
fun
word_get(): string
//
(* ****** ****** *)

implement
word_get() = let
//
fun
skip(): int = let
  val c = char_get()
in
  if isalpha(c) then c
    else (if c >= 0 then skip() else ~1)
  // end of [if]
end
//
fun
get2
(
  cs: list0(char)
) : list0(char) = let
  val c = char_get()
in
  if isalpha(c) then
    get2(list0_cons(tolower(int2char0(c)), cs)) else cs
  // end of [if]
end // end of [get2]
//
val c0 = skip()
//
in
//
if c0 >= 0
  then
  string_make_list
  (
    mylist_reverse<char>(get2(list0_sing(tolower(int2char0(c0)))))
  ) (* end of [then] *)
  else ""
//
end // end of [word_get]

(* ****** ****** *)
//
extern
fun
theWords_get(): list0(string)
//
implement
theWords_get() = let
//
fun
aux
(
  ws: list0(string)
) : list0(string) =
  let val w = word_get() in if w != "" then aux(list0_cons(w, ws)) else ws end
//
in
  aux(list0_nil)
end // end of [theWords_get]

(* ****** ****** *)

typedef
intstr = $tup(int, string)

(* ****** ****** *)
//
extern
fun
WordCounting :
  ((*void*)) -> list0 (intstr)
//
(* ****** ****** *)
//
extern
fun
mylist_group :
  list0 (string) -> list0 (intstr)
//
implement
mylist_group
  (xs) = let
//
fun
loop
(
  n0: int
, x0: string
, xs: list0(string)
, res: list0(intstr)
) : list0 (intstr) =
(
  case xs of
  | list0_nil() =>
      list0_cons{intstr}($tup(n0, x0), res)
    // list0_nil
  | list0_cons(x1, xs) =>
      if x0 = x1
        then loop(n0+1, x0, xs, res)
        else let
          val res = list0_cons{intstr}($tup(n0, x0), res)
        in
          loop(1, x1, xs, res)
        end
) (* end of [loop] *)
//
in
  case xs of
  | list0_nil() => list0_nil()
  | list0_cons(x, xs) => loop(1, x, xs, list0_nil)
end // end of [mylist_group]
//
(* ****** ****** *)
//
fun
mylist_sort_string
  (xs: list0(string)) =
list0_mergesort<string>
  (xs, lam(x1, x2) => compare(x1, x2))
fun
mylist_sort_intstr
  (xs: list0(intstr)) =
list0_mergesort<intstr>
  ( xs
  , lam(x1, x2) =>
    let val sgn = ~compare(x1.0, x2.0)
    in
      if sgn != 0 then sgn else compare(x1.1, x2.1)
    end
  )
//
(* ****** ****** *)

implement
WordCounting() =
  nws where
{
  val ws = theWords_get()
(*
  val () =
  println!
    ("length(ws) = ", list0_length(ws))
  // end of [val]
*)
  val ws = mylist_sort_string (ws)
//
  val nws = mylist_group (ws)
(*
  val () =
  println!
    ("length(nws) = ", list0_length(nws))
  // end of [val]
*)
//
  val nws = mylist_sort_intstr (nws) 
//
} (* end of [WordCounting] *)

(* ****** ****** *)
//
implement
char_get() = fileref_getc(stdin_ref)
//
(* ****** ****** *)
//
#define N 250
//
(* ****** ****** *)
//
staload UN = "prelude/SATS/unsafe.sats"
//
(* ****** ****** *)
//
extern
fun
wget_forked_executed
  (url: string): int(*pid*)
//
implement
wget_forked_executed
  (url) = let
//
val
fid2 =
arrayref_make_elt<pid_t>
  (i2sz(2), $UN.cast(0))
//
val ret =
$extfcall
  (int, "pipe", arrayref2ptr(fid2))
//
val pid = $extfcall(int(*child*), "fork")
//
val () = assertloc(pid >= 0)
//
in
//
ifcase
  | pid > 0 => pid where
    {
      val () = $extfcall(void, "close", fid2[1])
      val () = $extfcall(void, "close", STDIN_FILENO)
      val dupfd0 = $extfcall(int, "dup", fid2[0]) // = 0
    }
  | _(*pid = 0*) => 0 where // child
    {
      val () = $extfcall(void, "close", fid2[0])
      val () = $extfcall(void, "close", STDOUT_FILENO)
      val dupfd1 = $extfcall(int, "dup", fid2[1]) // = 1
      val () = $extfcall(void, "execlp", "wget", "wget", "-qO-", url, 0)
    }
//
end // end of [wget_forked_executed]

(* ****** ****** *)

implement
main(
 argc, argv
) = 0 where {
//
val pid =
(
//
if argc >= 2
  then wget_forked_executed(argv[1]) else 0
//
) : int // end of [val]
//
(*
val () = println! ("child's pid = ", pid)
*)
//
fun aux
(
  i: int, nws: list0(intstr)
) : void =
(
case+ nws of
| list0_nil() => ()
| list0_cons(nw, nws) =>
    if i < N then
      (println! (i+1, ": ", nw.1, ": ", nw.0); aux(i+1, nws))
    // end of [if]
)
//
val () = aux(0, WordCounting())
//
val () =
(
  if pid > 0 then loop(pid)
) where {
  fun loop(pid: int) = if $UN.cast2int(wait()) != pid  then loop(pid)
} (* end of [where] *) // end-of-val
//
} (* end of [main] *)
//
(* ****** ****** *)

(* end of [WordCounting.dats] *)

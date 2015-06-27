(* ****** ****** *)
//
// Title:
// Concepts of Programming Languages
// Number: CAS CS 320
// Semester: Summer 2015
// Class Time: MTWR: 3:00-5:00
// Instructor: Hongwei Xi (hwxiATbuDOTedu)
// Teaching Fellow: Zhiqiang (Alex) Ren (arenATbuDOTedu)
//
(* ****** ****** *)

(*
** Solving the queens puzzle
*)

(* ****** ****** *)
//
#include
"share/atspre_define.hats"
//
staload
UN = "prelude/SATS/unsafe.sats"
//
(* ****** ****** *)
//
#define
ATS_MAINATSFLAG 1
//
#define
ATS_DYNLOADNAME
"queens__dynload"
//
#define
ATS_STATIC_PREFIX "queens__"
//
(* ****** ****** *)
//
#include
"{$LIBATSCC2JS}/staloadall.hats"
//
(* ****** ****** *)
//
staload
"{$LIBATSCC2JS}/SATS/print.sats"
//
staload
_ = "{$LIBATSCC2JS}/DATS/print.dats"
//
(* ****** ****** *)

#define N 8

(* ****** ****** *)

typedef node = List0(int)

(* ****** ****** *)

extern
fun process_node(node): void

(* ****** ****** *)
//
fun
print_row_0(): void =
  (N).foreach()(lam(i) => print ". ")
fun
print_row_1(i0:int): void =
  (N).foreach()(lam(i) => print_string(if i = i0 then "Q " else ". "))
//
(* ****** ****** *)
//
extern
fun
print_board(List0(int)): void = "mac#"
extern
fun
print_board2(List0(int)): void = "mac#"
//
implement
print_board(xs) = let
//
fun
aux(xs: List0(int)): void =
(
case+ xs of
| list_nil() => ()
| list_cons(x, xs) => (aux(xs); print_row_1(x); print_newline())
)
//
val () = aux(xs)
//
val n = length(xs)
val () = (N-n).foreach()(lam(i) => (print_row_0(); print_newline()))
//
in
  // nothing
end // end of [print_board]

(* ****** ****** *)

implement
process_node(xs) =
{
//
val () = print_board2(xs)
//
} // end of [process_node]

(* ****** ****** *)

fun
safety_test
(
  x0: int, xs: List0(int)
) : bool = let
//
fun
aux(xs: List0(int), d: int): bool =
(
case+ xs of
| list_nil() => true
| list_cons(x, xs) =>
    if (x0 != x && abs(x0-x) != d) then aux(xs, d+1) else false
)
//
in
  aux(xs, 1)
end // end of [safety_test]

(* ****** ****** *)

extern
fun node_get_children(node): List0(node)

(* ****** ****** *)

implement
node_get_children
  (xs) = let
//
fun
aux(x: int, xs: node): List0(node) =
(
if
x < N
then (
//
if
safety_test(x, xs)
  then list_cons(list_cons(x, xs), aux(x+1, xs))
  else aux(x+1, xs)
//
) else list_nil()
)
//
val len = list_length(xs)
//
in
  if len >= N then list_nil() else aux(0, xs)
end // end of [node_get_children]

(* ****** ****** *)

val
theContinuation = ref{int}(0)

(* ****** ****** *)
//
extern
fun
theContinuation_exec(): int = "mac#"
//
(* ****** ****** *)

implement
theContinuation_exec() = let
//
val f = theContinuation[]
val () = theContinuation[] := 0
//
in
//
if
f != 0
then let
  val f = $UN.cast{()-<cloref>void}(f) in f(); 1
end // end of [then]
else 0 // end of [else]
//
end // end of [theContinuation_exec]

(* ****** ****** *)

extern
fun
search2_df(node, List0(node)): void
extern
fun
search2_df_cont(node, List0(node)): void

(* ****** ****** *)

implement
search2_df
  (nx0, nxs) = let
//
val () =
  process_node(nx0)
//
val f0 = $UN.cast{int}(lam() =<cloref1> search2_df_cont(nx0, nxs))
//
val len = length(nx0)
//
in
//
if
len < N
then (
  theContinuation[] := f0
) else let
  val yes = confirm("Continue?")
in
//
  if yes then theContinuation[] := f0
//
end // end of [else]
//
end // end of [search2_df]

(* ****** ****** *)

implement
search2_df_cont
  (nx0, nxs) = let
//
val nxs1 = node_get_children(nx0)
val nxs2 = list_append (nxs1, nxs)
//
in
//
case nxs2 of
| list_nil() => ()
| list_cons (nx0, nxs) => search2_df(nx0, nxs)
//
end // end of [search2_df_cont]

(* ****** ****** *)
//
val () =
theContinuation[] :=
  $UN.cast{int}(lam() =<cloref1> search2_df(list_nil(), list_nil()))
//
(* ****** ****** *)

%{$
//
function
print_board2(xs)
{
//
ats2jspre_the_print_store_clear();
//
print_board(xs);
//
document.getElementById("the_board_string").innerHTML = ats2jspre_the_print_store_join();
//
} /* end of [print_board2] */
//
function
queens_anim()
{
//
var
res;
//
res = theContinuation_exec(/*void*/);
//
if (res > 0) setTimeout(queens_anim, 100);
//
return;
//
} // end of [queens_anim]
//
jQuery(document).ready(function(){queens__dynload(); queens_anim();});
//
%} // end of [%{$]

(* ****** ****** *)

(* end of [queens_sol.dats] *)

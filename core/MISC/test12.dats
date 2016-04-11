(*
** HX-2015-12-25:
** For disabling tail-calls.
*)

(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
//
(* ****** ****** *)
//
fun
foo(x: int): void =
  if x > 0 then foo(x) else ignoret(foo(x))
//
(* ****** ****** *)
//
fun
foo2(x: int): double =
  if x > 0 then foo2(x) else gidentity(foo2(x))
//
(* ****** ****** *)

implement main0() = ()

(* ****** ****** *)

(* end of [test12.dats] *)

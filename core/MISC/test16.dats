(*
** It should be possible to negate effects with ~
**)

(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
//
(* ****** ****** *)

fun f .<>. ():<1,~all> void = ()
fun g .<>. ():<fun0> void = f()

implement main0() = g()

(* ****** ****** *)

(* end of [test16.dats] *)

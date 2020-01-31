(*
** This file tests that octal and hexadecimal escapes sequences don't get
** parsed any further than they should be (3 chars for octal, 2 for hexadecimal
** not including the initiating "x"). The compiler should reject this file.
**)

(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
//
(* ****** ****** *)

val c: char = '\12345'
val c: char = '\xFFF'

val s: string 3 = "\12345"
val s: string 2 = "\xFFF"

implement main1() = 1

(* ****** ****** *)

(* end of [test15.dats] *)

(* ****** ****** *)

(*
** For testing
** ATSLIB/prelude/integer
*)

(* ****** ****** *)
//
// Author: Hongwei Xi
// Authoremail: gmhwxiATgmailDOTedu
// Start time: the 18th of July, 2016
//
(* ****** ****** *)
//
#if
undefined(TEST_INCLUDE)
#then
//
#include
"share/atspre_define.hats"
//
#include
"share/atspre_staload.hats"
#include
"share/HATS/atspre_staload_libats_ML.hats"
//
#endif // end of [TEST_INCLUDE]
//
(* ****** ****** *)
//
macdef
INTMAX =
$UNSAFE.cast
  {intGte(1)}((1 << 31) + (1 << 31 - 1))
//
(* ****** ****** *)

val () =
{
//
macdef int() = randint(INTMAX)
//
val N = 10
val () = repeat
(
  N
, $delay (
    let val x = int() and y = int() in assertloc(x+y = y+x) end
  ) (* $ldelay *)
) (* repeat *)
//
} (* end of [val] *)

(* ****** ****** *)

(* end of [test_integer.dats] *)

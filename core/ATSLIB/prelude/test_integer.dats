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
//
macdef int() = randint(INTMAX)
//
(* ****** ****** *)
//
val () =
{
//
val () = let
//
val x = int()
//
in
//
assertloc
(
  x =
  g0string2int(strptr2string(g0int2string(x)))
) (* assertloc *)
//
end // end of [val]
//
} (* end of [val] *)

(* ****** ****** *)

val () =
{
//
val
N = 10
//
val () =
repeat (
  N
, $delay (
    let val x = int()
        and y = int() in assertloc(x+y = y+x) end
  ) (* $ldelay *)
) (* repeat *)
//
val () =
repeat (
  N
, $delay (
    let val x = int()
        and y = int() in assertloc(x*y = y*x) end
  ) (* $ldelay *)
) (* repeat *)
//
val () =
repeat (
  N
, $delay (
    let val x = int()
        and y = int() in
        assertloc((x-y)*(x-y) = x*x-2*x*y+y*y) end
  ) (* $ldelay *)
) (* repeat *)
//
val () =
repeat (
  N
, $delay
  (
    let val x = int()
        and y = ckastloc_gintGte(int(), 1) in assertloc(x = (x/y)*y+(x%y)) end
  ) (* $ldelay *)
) (* repeat *)
//
} (* end of [val] *)

(* ****** ****** *)

(* end of [test_integer.dats] *)

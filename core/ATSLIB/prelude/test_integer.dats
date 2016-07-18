(* ****** ****** *)
(*
** For testing
** ATSLIB/prelude/integer
*)
(* ****** ****** *)
(*
**
** Permission is hereby granted, free of charge, to any person
** obtaining a copy of this software and associated documentation
** files (the "Software"), to deal in the Software without
** restriction, including without limitation the rights to use,
** copy, modify, merge, publish, distribute, sublicense, and/or sell
** copies of the Software, and to permit persons to whom the
** Software is furnished to do so, subject to the following
** conditions:
**
** The above copyright notice and this permission notice shall be
** included in all copies or substantial portions of the Software.
**
** THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
** EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
** OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
** NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
** HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
** WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
** FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
** OTHER DEALINGS IN THE SOFTWARE.
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

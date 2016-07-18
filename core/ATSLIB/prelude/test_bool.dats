(* ****** ****** *)
(*
** For testing
** ATSLIB/prelude/bool
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
val () =
{
//
val N = 10
//
val () =
assertloc(N.forall()(lam(x) => int2bool0(x) = (x != 0)))
//
val () =
assertloc
(
N.forall()
  (lam(x) => let val x = g1ofg0(x) in int2bool1(x) = (x != 0) end)
)
//
} (* end of [val] *)
//
(* ****** ****** *)
//
val () =
{
//
val N = 10
//
val () =
assertloc(bool2int0(true) = 1)
val () =
assertloc(bool2int0(false) = 0)
//
val () =
assertloc(bool2int1(true) = 1)
val () =
assertloc(bool2int1(false) = 0)
//
} (* end of [val] *)
//
(* ****** ****** *)

val () =
{
//
val t = true
val f = false
//
val () = assertloc((t || t) = t)
val () = assertloc((t || f) = t)
val () = assertloc((f || t) = t)
val () = assertloc((f || f) = f)
//
val () = assertloc((t && t) = t)
val () = assertloc((t && f) = f)
val () = assertloc((f && t) = f)
val () = assertloc((f && f) = f)
//
} (* end of [val] *)

(* ****** ****** *)

val () =
{
//
val t = true
val f = false
//
val () = assertloc(~(t) = f)
val () = assertloc(~(f) = t)
//
val () = assertloc((t + t) = t)
val () = assertloc((t + f) = t)
val () = assertloc((f + t) = t)
val () = assertloc((f + f) = f)
//
val () = assertloc((t * t) = t)
val () = assertloc((t * f) = f)
val () = assertloc((f * t) = f)
val () = assertloc((f * f) = f)
//
val () = assertloc((t = t) = t)
val () = assertloc((t = f) = f)
val () = assertloc((f = t) = f)
val () = assertloc((f = f) = t)
//
val () = assertloc((t != t) = f)
val () = assertloc((t != f) = t)
val () = assertloc((f != t) = t)
val () = assertloc((f != f) = f)
//
val () = assertloc((t xor t) = f)
val () = assertloc((t xor f) = t)
val () = assertloc((f xor t) = t)
val () = assertloc((f xor f) = f)
//
} (* end of [val] *)

(* ****** ****** *)

val () =
{
//
val t = true
val f = false
//
val () = assertloc((t < t) = f)
val () = assertloc((t < f) = f)
val () = assertloc((f < t) = t)
val () = assertloc((f < f) = f)
//
val () = assertloc((t <= t) = t)
val () = assertloc((t <= f) = f)
val () = assertloc((f <= t) = t)
val () = assertloc((f <= f) = t)
//
val () = assertloc((t > t) = f)
val () = assertloc((t > f) = t)
val () = assertloc((f > t) = f)
val () = assertloc((f > f) = f)
//
val () = assertloc((t >= t) = t)
val () = assertloc((t >= f) = t)
val () = assertloc((f >= t) = f)
val () = assertloc((f >= f) = t)
//
} (* end of [val] *)

(* ****** ****** *)

val () =
{
//
val t = true
val f = false
//
val () = assertloc(compare(t, t) = 0)
val () = assertloc(compare(t, f) = 1)
val () = assertloc(compare(f, t) = ~1)
val () = assertloc(compare(f, f) = 0)
//
} (* end of [val] *)

(* ****** ****** *)

val () =
println!
(
  "ATS-Postiate-test/core/ATSLIB/prelude: test_bool is done!"
) (* println! *)

(* ****** ****** *)

(* end of [test_bool.dats] *)

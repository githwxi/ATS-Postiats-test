(* ****** ****** *)
(*
** For testing
** ATSLIB/prelude/stream_vt
*)
(* ****** ****** *)
(*
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
undefined(INCLUDED)
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
#endif // end of [INCLUDED]
//
(* ****** ****** *)

staload UN = $UNSAFE

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

val () =
{
//
val xs =
stream_vt_tabulate<int>()
where {
implement
stream_vt_tabulate$fopr<int>(i) = i+1
} (* end of [where] *)
//
val N = 10
//
val xs = stream_vt_takeLte(xs, N)
//
val
tally =
stream_vt_foldleft_cloptr<int><int>(xs, 0, lam(res, x) => res + x)
//
val () = assertloc(tally = N * (N+1) / 2)
//
} (* end of [val] *)

(* ****** ****** *)

val () =
println!
(
  "ATS-Postiate-test/core/ATSLIB/prelude: prelude_stream_vt is done!"
) (* println! *)

(* ****** ****** *)

(* end of [prelude_stream_vt.dats] *)

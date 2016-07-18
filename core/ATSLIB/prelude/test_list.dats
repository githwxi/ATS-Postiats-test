(* ****** ****** *)
(*
** For testing
** ATSLIB/prelude/list
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
extern
fun{}
intlist(n: intGte(0)): List0(int)
//
implement
{}(*tmp*)
intlist(n) =
list_vt2t
(
stream_take_exn
(
stream_vt2t
(
stream_vt_tabulate<int>() where
{
//
implement
stream_vt_tabulate$fopr<int>(_) = int()
//
} (* end of [intlist] *)
) (* end of [stream_vt2t] *)
,
n
) (* end of [stream_take_exn] *)
) (* end of [list_vt2t] *)
//
(* ****** ****** *)
//
macdef
reverse(xs) = list_vt2t(list_reverse(,(xs)))
//
(* ****** ****** *)

val () =
{
//
val xs = intlist(randint(10))
val ys = intlist(randint(10))
//
val () = assertloc(reverse(xs+ys) = reverse(ys)+reverse(xs))
//
} (* end of [val] *)

(* ****** ****** *)

(* end of [test_list.dats] *)

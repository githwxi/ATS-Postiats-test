(* ****** ****** *)
(*
** For testing
** ATSLIB/prelude/list
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
//
extern
fun{}
intlist{n:nat}(int(n)): list(int, n)
//
implement
{}(*tmp*)
intlist(n) =
list_vt2t
(
 list_tabulate<int>(n)
 where { implement list_tabulate$fopr<int>(_) = int() }
) (* end of [intlist] *)
//
(* ****** ****** *)
//
macdef
reverse(xs) =
list_vt2t(list_reverse(,(xs)))
//
(* ****** ****** *)
//
macdef
zip(xs, ys) =
list_vt2t(list_zip(,(xs), ,(ys)))
//
(* ****** ****** *)

val () =
{
//
val LN =
$UN.cast{intGte(1)}(1E3)
//
val xs = intlist(randint(LN))
val ys = intlist(randint(LN))
//
val () = assertloc(reverse(xs+ys) = reverse(ys)+reverse(xs))
//
} (* end of [val] *)

(* ****** ****** *)

val () =
{
//
val LN = 1000
//
val xs = intlist(LN)
//
val ys =
list_map<int><int>
  (xs) where
{
implement
list_map$fopr<int><int>(x) = x + 1
} (* end of [val] *)
//
val ys = list_vt2t(ys)
//
val zs =
list_map<int><int>
  (ys) where
{
implement
list_map$fopr<int><int>(x) = x - 1
} (* end of [val] *)
//
val zs = list_vt2t(zs)
//
val () = assertloc (xs = zs)
//
} (* end of [val] *)

(* ****** ****** *)

val () =
{
//
val LN = 1000
//
val xs = intlist(LN)
val ys = intlist(LN)
//
val () =
assertloc
  (reverse(zip(xs, ys)) = zip(reverse(xs), reverse(ys)))
//
} (* end of [val] *)

(* ****** ****** *)

val () =
println!
(
  "ATS-Postiate-test/core/ATSLIB/prelude: test_list is done!"
) (* println! *)

(* ****** ****** *)

(* end of [test_list.dats] *)

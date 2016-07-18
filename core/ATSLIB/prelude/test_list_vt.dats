(* ****** ****** *)
(*
** For testing
** ATSLIB/prelude/list_vt
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
intlist(n: intGte(0)): List0_vt(int)
//
implement
{}(*tmp*)
intlist(n) =
(
 list_tabulate<int>(n)
 where { implement list_tabulate$fopr<int>(_) = int() }
) (* end of [intlist] *)
//
(* ****** ****** *)
//
extern
fun{a:t@ype}
list_vt_eqfree
(
  List_vt(INV(a)), List_vt(a)
) : bool // end-of-function
//
overload eqfree with list_vt_eqfree
//
implement
{a}(*tmp*)
list_vt_eqfree
  (xs, ys) =
  loop(xs, ys) where
{
//
fun
loop
(
  xs: List_vt(a)
, ys: List_vt(a)
) : bool =
(
  case+ xs of
  | ~list_vt_nil() =>
    (
      case+ ys of
      | ~list_vt_nil() => true
      | ~list_vt_cons(_, ys) => (free(ys); false)
    )
  | ~list_vt_cons(x, xs) =>
    (
      case+ ys of
      | ~list_vt_nil() =>
          (free xs; false)
      | ~list_vt_cons(y, ys) =>
        (
          if gequal_val_val<a>(x, y)
            then loop(xs, ys) else (free(xs); free(ys); false)
          // end of [if]
        ) (* end of [list_vt_cons] *)
          
    )
) (* end of [loop] *)
//
} (* end of [list_vt_eqfree] *)
//
(* ****** ****** *)
//
macdef
append(xs, ys) =
list_vt_append(,(xs), ,(ys))
//
macdef
reverse(xs) = list_vt_reverse(,(xs))
//
(* ****** ****** *)

val () =
{
//
val LN = 1000
val xs = intlist(LN)
val ys = intlist(LN)
//
val xs2 = copy(xs)
val ys2 = copy(ys)
//
val () = assertloc
(
  eqfree(reverse(append(xs, ys)), append(reverse(ys2), reverse(xs2)))
) (* end of [assertloc] *)
//
} (* end of [val] *)

(* ****** ****** *)

val () =
println!
(
  "ATS-Postiate-test/core/ATSLIB/prelude: test_list_vt is done!"
) (* println! *)

(* ****** ****** *)

(* end of [test_list_vt.dats] *)

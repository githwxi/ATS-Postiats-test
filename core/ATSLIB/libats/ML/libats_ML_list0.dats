(* ****** ****** *)
(*
** For testing
** ATSLIB/libats/ML/list0
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
intlist0{n:nat}(int(n)): list0(int)
//
implement
{}(*tmp*)
intlist0(n) =
list0_of_list_vt
(
 list_tabulate<int>(n)
 where { implement list_tabulate$fopr<int>(_) = int() }
) (* end of [intlist0] *)
//
(* ****** ****** *)

val () =
{
//
val N = 10
//
val () = assertloc(N = length(intlist0(N)))
//
} (* end of [val] *)

(* ****** ****** *)

val () =
{
//
val N = 10
//
val xs =
  (intlist0(N)).map(TYPE{int})(lam x => x % N)
//
val () = assertloc(xs.forall()(lam x => x < N))
val () = assertloc(~(xs.exists()(lam x => x >= N)))
//
val-true =
  (xs.filter()(lam x => x%2 = 0)).forall()(lam x => x%2 = 0)
//
} (* end of [val] *)

(* ****** ****** *)

val () =
println!
(
  "ATS-Postiate-test/core/ATSLIB/prelude: libats_ML_list0 is done!"
) (* println! *)

(* ****** ****** *)

(* end of [libats_ML_list0.dats] *)

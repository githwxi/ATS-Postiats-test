(* ****** ****** *)
(*
** For testing
** ATSLIB/libats/ML/array0
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
intarray0{n:nat}(int(n)): array0(int)
//
implement
{}(*tmp*)
intarray0(n) =
array0_make_list
(
list_of_list_vt
(
 list_tabulate<int>(n)
 where
 {
   implement list_tabulate$fopr<int>(_) = int()
 } (* end of [where] *)
)
) (* end of [intarray0] *)
//
(* ****** ****** *)

val () =
{
//
val N = 10
//
val () = assertloc(i2sz(N) = size(intarray0(N)))
//
} (* end of [val] *)

(* ****** ****** *)

val () =
{
//
val N = 10
//
val xs = intarray0(N)
val xs = xs.map(TYPE{int})(lam x => x % N)
//
val () = assertloc(xs.forall()(lam x => x < N))
//
} (* end of [val] *)

(* ****** ****** *)

val () =
{
//
val N = 10
//
val A0 =
array0_tabulate<int>
(
  i2sz(N), lam i => sz2i(i)
) (* end of [val] *)
//
val () = assertloc(size(A0) = N)
val () = assertloc(A0.size() = N)
//
val () = assertloc(size(append(A0, A0)) = 2*N)
//
val () = assertloc(A0.iforall()(lam(i, x) => i = x))
val () = assertloc(~(A0.iexists()(lam(i, x) => i != x)))
//
} (* end of [val] *)

(* ****** ****** *)

val () =
println!
(
  "ATS-Postiate-test/core/ATSLIB/prelude: libats_ML_array0 is done!"
) (* println! *)

(* ****** ****** *)

(* end of [libats_ML_array0.dats] *)

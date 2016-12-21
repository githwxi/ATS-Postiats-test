(* ****** ****** *)
(*
** For testing
** ATSLIB/prelude/arrayref
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
//
extern
fun{}
intlist{n:nat}(int(n)): list_vt(int, n)
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

val () =
{
//
val LN = 10
val A0 = arrayref_make_intrange(0, LN)
var tally: int = 0
val _asz_ =
arrayref_foreach_env<int><int>(A0, i2sz(LN), tally)
where{
implement
array_foreach$fwork<int><int>(x, env) = env := env + x
} (* end of [where] *)
//
} (* end-of-val *)

(* ****** ****** *)

val () =
println!
(
  "ATS-Postiate-test/core/ATSLIB/prelude: preludearrayref is done!"
) (* println! *)

(* ****** ****** *)

(* end of [preludearrayref.dats] *)

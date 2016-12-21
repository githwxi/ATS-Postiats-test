(* ****** ****** *)
(*
** For testing
** ATSLIB/prelude/array
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
val N = 100
//
val
(pf, pf_gc | p) = 
array_ptr_alloc<int>(i2sz(N))
//
val xs = intlist(N)
//
val () =
array_copy_from_list_vt
  (!p, copy(xs))
//
val ys =
array_copy_to_list_vt(!p, i2sz(N))
//
val () =
assertloc
(
  $UN.list_vt2t(xs) = $UN.list_vt2t(ys)
) (* end of [val] *)
//
val () = free(xs) and () = free(ys)
//
val () = array_ptr_free(pf, pf_gc | p)
//
} (* end-of-val *)

(* ****** ****** *)

val () =
{
//
val N = 100
//
val
(pf, pf_gc | p) = 
array_ptr_tabulate<int>(i2sz(N))
where {
implement
array_tabulate$fopr<int>(x) = sz2i(x)+1
} (* where *)
//
var env: int = 0
val asz =
array_foreach_env<int><int>(!p, i2sz(N), env)
where {
implement
array_foreach$fwork<int><int>(x, env) = env := env + x
} (* where *)
//
val () = assertloc(asz = N)
val () = assertloc(env = N*(N+1)/2)
//
val () = array_ptr_free(pf, pf_gc | p)
//
} (* end-of-val *)

(* ****** ****** *)

val () =
{
//
val N = 100
//
val
(pf, pf_gc | p) = 
array_ptr_tabulate<int>(i2sz(N))
where {
implement
array_tabulate$fopr<int>(x) = sz2i(x)+1
} (* where *)
//
var env: int = 0
val asz =
array_rforeach_env<int><int>(!p, i2sz(N), env)
where {
implement
array_rforeach$fwork<int><int>(x, env) = env := env + x
} (* where *)
//
val () = assertloc(asz = N)
val () = assertloc(env = N*(N+1)/2)
//
val () = array_ptr_free(pf, pf_gc | p)
//
} (* end-of-val *)

(* ****** ****** *)

val () =
println!
(
  "ATS-Postiate-test/core/ATSLIB/prelude: prelude_array is done!"
) (* println! *)

(* ****** ****** *)

(* end of [prelude_array.dats] *)

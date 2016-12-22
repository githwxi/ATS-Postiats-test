(* ****** ****** *)
(*
** For testing
** ATSLIB/libats/ML/option0
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

val opt = option0_some<int>(0)
val-(0) = option0_unsome_exn(option0_some<int>(0))
val-(1) = option0_unsome_exn(opt.map(TYPE{int})(lam x => x + 1))
//
val-None0 _ = opt.filter()(lam x => x >= 1)
val-Some0 0 = opt.filter()(lam x => x >= 0)
//
(* ****** ****** *)

val () =
println!
(
  "ATS-Postiate-test/core/ATSLIB/prelude: libats_ML_option0 is done!"
) (* println! *)

(* ****** ****** *)

(* end of [libats_ML_option0.dats] *)

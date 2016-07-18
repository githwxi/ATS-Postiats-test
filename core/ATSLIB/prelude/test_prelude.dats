(* ****** ****** *)
(*
** For testing ATSLIB/prelude
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
#include
"share/atspre_define.hats"
//
#include
"share/atspre_staload.hats"
#include
"share/HATS/atspre_staload_libats_ML.hats"
//
(* ****** ****** *)
//
staload UN = $UNSAFE
//
staload
TIME = "libc/SATS/time.sats"
staload
STDLIB = "libc/SATS/stdlib.sats"
//
(* ****** ****** *)

#define TEST_INCLUDE 1

(* ****** ****** *)
//
val () =
$STDLIB.srandom
(
  $UN.cast{uint}($TIME.time_get())
) (* $STDLIB.srandom *)
//
(* ****** ****** *)

local
#include
"test_bool.dats"
in (* nothing *) end

(* ****** ****** *)

local
#include
"test_integer.dats"
in (* nothing *) end

(* ****** ****** *)

local
#include "test_list.dats"
in (* nothing *) end

(* ****** ****** *)
//
implement
main0
(
// argless
) =
{
val() =
println!
(
  "ATS-Postiate-test/core/ATSLIB/prelude: Testing has passed!"
) (* println! *)
} (* end of [main0] *)
//
(* ****** ****** *)

(* end of [test_prelude.dats] *)

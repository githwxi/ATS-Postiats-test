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
TIME =
"libats/libc/SATS/time.sats"
staload
STDLIB =
"libats/libc/SATS/stdlib.sats"
//
(* ****** ****** *)

#define INCLUDED 1

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
"./prelude_bool.dats"
in (* nothing *) end

(* ****** ****** *)

local
#include
"./prelude_char.dats"
in (* nothing *) end

(* ****** ****** *)

local
#include
"./prelude_integer.dats"
in (* nothing *) end

(* ****** ****** *)

local
#include
"./prelude_string.dats"
in (* nothing *) end

(* ****** ****** *)

local
#include "./prelude_list.dats"
in (* nothing *) end

(* ****** ****** *)

local
#include "./prelude_list_vt.dats"
in (* nothing *) end

(* ****** ****** *)

local
#include "./prelude_array.dats"
in (*nothing*) end // local
local
#include "./prelude_arrayref.dats"
in (*nothing*) end // local

(* ****** ****** *)

local
#include "./prelude_stream.dats"
in (* nothing *) end
local
#include "./prelude_stream_vt.dats"
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
  "ATS-Postiate-test/core/ATSLIB/prelude: Testing is done successfully!"
) (* println! *)
} (* end of [main0] *)
//
(* ****** ****** *)

(* end of [testall.dats] *)

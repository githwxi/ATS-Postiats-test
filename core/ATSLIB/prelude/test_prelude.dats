(* ****** ****** *)

(*
** For testing ATSLIB/prelude
*)

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

#define TEST_INCLUDE 1

(* ****** ****** *)

local
#include "test_bool.dats"
in (* nothing *) end

(* ****** ****** *)

local
#include "test_integer.dats"
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

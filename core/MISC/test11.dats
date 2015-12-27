(*
** HX-2015-12-25:
** For testing recursive macros
*)

(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
//
(* ****** ****** *)

local

macrodef
rec
auxlist
  (xs, y) =
(
//
if iscons! (xs) then
  `(print ,(car! xs); ,(auxlist (cdr! xs, y)))
else y // end of [if]
//
) // end of [auxlist]

in (* in of [local] *)

macdef
print_mac (x) =
,(
  if islist! (x) then auxlist (x, `()) else `(print ,(x))
) // end of [print_mac]

macdef
println_mac (x) =
,(
  if islist! (x)
    then auxlist (x, `(print_newline())) else `(print ,(x))
  // end of [if]
) // end of [println_mac]

end // end of [local]

(* ****** ****** *)

val recursive_macro = "recursive macro"

val () = println_mac("This", ' ', "is", ' ', "a", ' ', "test for", ' ', recursive_macro, "!")

(* ****** ****** *)

implement main0() = ()

(* ****** ****** *)

(* end of [test11.dats] *)

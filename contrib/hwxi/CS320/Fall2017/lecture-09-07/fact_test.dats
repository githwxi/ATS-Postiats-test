(* ****** ****** *)
(*
** Recursion
*)
(* ****** ****** *)

#define
ATS_PACKNAME "LECTURE0907"

(* ****** ****** *)

#include
"share/atspre_staload.hats"

(* ****** ****** *)

extern
fun fact(n: int): int

(* ****** ****** *)

#include "./fact_impl.dats"

(* ****** ****** *)

fun
testfact
  (n: int): void =
//
if n > 0 then
(
  testfact(n-1);
  println! ("fact(", n-1, ") = ", fact(n-1))
) (* end of [if] *)
//
    
(* ****** ****** *)

implement
main0() = testfact(100)

(* ****** ****** *)

(* end of [fact_test.dats] *)

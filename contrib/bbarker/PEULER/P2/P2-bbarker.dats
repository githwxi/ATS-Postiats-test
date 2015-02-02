(*
** Project Euler: P2
** See https://projecteuler.net
*)
(* ****** ****** *)
//
// Author: Brandon Barker
// Authoremail: brandonDOTbarkerATgmailDOTcom
// Start time: January 31, 2015
//
(* ****** ****** *)
//
#include
"share/atspre_define.hats"
#include
"share/atspre_staload.hats"
//
(* ****** ****** *)
//
staload "P2-bbarker.sats"
//
(* ****** ****** *)
//
#define LIMIT 4000000
//
(* ****** ****** *)

implement
mysum (x_n2, x_n1, t) = let
//
prval pf0 = MYSUM(n2, n1, t(* should be 2 here *))
//
fun
loop
{ln2,ln1,lt:nat}
(
  pf1: MYSUM(ln1, ln2, lt)
  | x_n1: int ln1, x_n2: int ln2, t: int lt
) : [t1:int | t1 >= t] (MYSUM (ln1 + ln2, ln1, t1) | int t1) = let
//
val x_n = x_n1 + x_n2
//
(*
val () =
  println! (x_n, ", ", x_n1, ", ", x_n2, ", ", t)
*)
//
in
//
if
x_n > LIMIT
then (pf1 | t)
else (
  if nmod(x_n, 2) = 0
    then loop( MYSUM(ln1 + ln2, ln1, lt + ln1 + ln2) | x_n, x_n1, t + x_n)
    else loop( MYSUM(ln1 + ln2, ln1, lt) | x_n, x_n1, t)
  // end of [if]
) (* end of [else] *)
end // end of [if]
//
in
  loop(pf0 | x_n1 , x_n2, t)
end

(* ****** ****** *)

// BB:
// loop() could recall if prior two terms were even or odd
// but this doesn't really seem worthwhile

(* ****** ****** *)

implement
main0 () =
{
//
val (pf | ans) = mysum(2, 1, 2)
prval pf_final = MYSUM_sat(pf) // Ideally this would be implemented.
val () = println! ("The sum of all the even fibs < ", LIMIT, " equals ", ans)
//
} (* end of [main0] *)

(* ****** ****** *)

(* end of [P2-bbarker.dats] *)

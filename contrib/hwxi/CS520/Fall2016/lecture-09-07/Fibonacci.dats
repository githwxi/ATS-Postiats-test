(* ****** ****** *)

(*
Please read:
http://www.ats-lang.org/Examples.html#Fibonacci_numbers
*)

(* ****** ****** *)

#include"share/atspre_staload.hats"

dataprop
FIB(int, int) =
| FIB0 (0, 0) | FIB1 (1, 1)
| {n:nat}{r0,r1:int}
   FIB2 (n+2, r0+r1) of (FIB (n, r0), FIB (n+1, r1))
// end of [FIB] // end of [dataprop]

extern
fun
fib{n:nat}(x: int(n)): [r:int] (FIB(n, r) | int(r))

implement
fib(x) =
if x = 0
then (FIB0() | 0) else
if x = 1
then (FIB1() | 1) else
(
let
  val (pf0 | r0) = fib(x-2)
  val (pf1 | r1) = fib(x-1)
in
  (FIB2(pf0, pf1) | r0+r1)
end // end of [let]
) (* end of [fib] *)

(* ****** ****** *)

implement
main0() = let
  val (pf | fib10) = fib(10)
in
  println! ("fib(10) = ", fib10)
end // end of [main0]

(* ****** ****** *)

(* end of [Fibonacci.dats] *)

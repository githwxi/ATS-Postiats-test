(* ****** ****** *)
(*
// Boilerplate stuff
*)
(* ****** ****** *)

#include
"share/atspre_staload.hats"
#include
"share/HATS/atspre_staload_libats_ML.hats"

(* ****** ****** *)

(*
extern
fun
fib : int -> int
*)
extern
fun
fib (n :int): int

(*
implement
fib(n) =
if n >= 2 then fib(n-1)+fib(n-2) else n
*)

(*
implement
fib(n) =
if
n >= 2
then let
  val n1 = n - 1
  val n2 = n - 2
in
  fib(n1) + fib(n2)
end // end of [then]
else n // end of [else]
*)

(* ****** ****** *)

implement
fib(n) = let
//
fun
fib2
(
 i: int, res1: int, res2: int
) : int =
  if i < n then fib2(i+1, res2, res1+res2) else res1
//
in
  fib2(0, 0, 1)
end // end of [fib]

(* ****** ****** *)

implement
main0() =
{
  val () = println! ("fib(5) = ", fib(5))
  val () = println! ("fib(10) = ", fib(10))
  val () = println! ("fib(20) = ", fib(20))
}

(* ****** ****** *)

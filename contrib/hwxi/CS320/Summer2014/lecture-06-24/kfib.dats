(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
//
(* ****** ****** *)
//
(*
Direct-style
*)
//
fun
fib(n: int): int =
  if n >= 2 then fib(n-1) + fib(n-2) else n
//
(* ****** ****** *)

typedef
cont (a:t@ype) = a -<cloref1> int

(* ****** ****** *)
//
(*
Continuation-Passing style (CPS)
*)
//
fun
kfib
(
  n: int, k: cont(int)
) : int =
(
if n >= 2
  then kfib (n-1, lam res1 => kfib (n-2, lam res2 => k (res1 + res2)))
  else k (n)
)
(* ****** ****** *)

implement
main0 () = let
//
val k0 = (lam (res) => res): cont(int)
//
in
  println! ("kfib(10, k0) = ", kfib(10, k0))
end // end of [main0]

(* ****** ****** *)

(* end of [kfib.dats] *)

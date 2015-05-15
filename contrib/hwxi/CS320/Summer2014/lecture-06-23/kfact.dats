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
fun fact (n:int): int =
  if n > 0 then n * fact(n-1) else 1
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
fun kfact (n: int, k: cont(int)): int =
if n > 0
  then kfact(n-1, lam res => k (n * res))
  else k(1)
//
(* ****** ****** *)

implement
main0 () = let
//
val k0 = (lam (res) => res): cont(int)
//
in
  println! ("kfact(10, k0) = ", kfact(10, k0))
end // end of [main0]

(* ****** ****** *)

(* end of [kfact.dats] *)

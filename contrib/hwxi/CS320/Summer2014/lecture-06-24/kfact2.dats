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
fun fact2 (n: int, res: int) =
  if n > 0 then fact2 (n-1, n*res) else res
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
kfact2
(
  n: int, res: int, k: cont(int)
) : int =
  if n > 0 then kfact2 (n-1, n*res, k) else k(res)
//
(* ****** ****** *)

implement
main0 () = let
//
val k0 = (lam (res) => res): cont(int)
//
in
  println! ("kfact2(10, 1, k0) = ", kfact2(10, 1, k0))
end // end of [main0]

(* ****** ****** *)

(* end of [kfact2.dats] *)

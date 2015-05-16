//
(*
** Illustrating continuation
*)
//
(* ****** ****** *)
//
// Please read:
// http://ats-lang.sourceforge.net/EXAMPLE/EFFECTIVATS/loop-as-tailrec/
//
(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
//
(* ****** ****** *)

fun fact(n: int): int =
  if n > 0 then n * fact(n-1) else 1
  
(* ****** ****** *)
//
typedef cont(a:t@ype, ans:t@ype) = a -<cloref1> ans
//
fun kfact(n: int, k: cont(int, void)): void =
  if n > 0 then kfact (n-1, lam res => k(n * res)) else k(1)
//
(* ****** ****** *)

implement
main0 () =
{
//
val () = kfact (10, lam res => println! ("fact(10) = ", res))
//
} (* end of [main0] *)

(* ****** ****** *)

(* end of [kfact.dats] *)

#include
"share/atspre_staload.hats"
#include
"share/atspre_staload_libats_ML.hats"

(*
#include
"./../../libraries/class.dats"
#include
"./../../libraries/myclass.dats"
*)

#include "./../libraries/class.dats"

fun
biggest_prime
(
 n:int
) : int =
(
int_foldleft
(n, 0, lam(res, i) => if isprime(i) then i else res)
) where
{
  fun
  isprime
  (i: int): bool =
    i >= 2 andalso int_forall(i-2, lam(x) => i % (x+2) > 0)
  // end of [isprime]
}

val N = 10000
val () = println!( "biggest_prime(", N, ") = ", biggest_prime(N))
  
implement main0() = ()

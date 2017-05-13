%{^
#include <unistd.h>
%}

#include
"share/atspre_staload.hats"

fun fact(n: int): int =
  if n > 0 then n * fact(n-1) else 1
  
// extern
fun
mysleep(i: int): void =
  $extfcall(void, "sleep", i)

(*
CPS-style (continuation-passing style)
*)
fun
kfact
(
n: int, k: int -<cloref1> void
): void =
if n > 0
  then kfact(n-1, lam(res) => (println!("zzz"); mysleep(1); k(n * res)))
  else k(1)
// end of [kfact]  

implement
main0() =
{
val () = kfact(5, lam(res) => println!("fact(10) = ", res))
}
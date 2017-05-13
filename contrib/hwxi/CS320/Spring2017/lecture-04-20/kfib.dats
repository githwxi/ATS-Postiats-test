#include
"share/atspre_staload.hats"

fun fib(n: int): int =
  if n >= 2 then fib(n-1) + fib(n-2) else n
  
(*
CPS-style (continuation-passing style)
*)
fun
kfib(n: int, k: int -<cloref1> void): void =
if n >= 2
  then kfib(n-1, lam(res1) => kfib(n-2, lam(res2) => k(res1+res2)))
  else k(n)

implement
main0() =
{
val () = kfib(10, lam(res) => println!("fib(10) = ", res))
}
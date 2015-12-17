// (*
#include
"share/atspre_staload.hats"
// *)

extern
fun fib : int -> int = "ext#myfib"
//
// O(n)-space
// exponential in time
//
implement
fib(n) =
(
if n >= 1 then loop(1, 0, 1) else 0
) where
{
fun loop(i:int, f0:int, f1:int) = if i < n then loop(i+1, f1, f0+f1) else f1
}
//
implement main0 () = println! ("fib(10) = ", fib(10))
//
(* ****** ****** *)

(* end of [fib2.dats] *)

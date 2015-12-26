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
(*
[myfib] is implemented externally!
*)
//
implement main0 () = println! ("fib(10) = ", fib(10))
//
(* ****** ****** *)

(* end of [fib3.dats] *)

(*
** Code used in lecture-09-09
*)

#include
"share/atspre_staload.hats"

(* ****** ****** *)

extern
fun fib : int -> int = "ext#myfib"
//
// O(n)-space
// exponential in time
//
implement fib(n) =
  if n >= 2 then fib(n-1)+fib(n-2) else n
//
implement main0 () = println! ("fib(10) = ", fib(10))
//
(* ****** ****** *)

(* end of [fib.dats] *)

(* ****** ****** *)
(*
** Recursion
*)
(* ****** ****** *)

#include
"share/atspre_staload.hats"

(* ****** ****** *)

extern
fun fact(n: int): int

implement
fact(n) =
if n > 0 then n * fact(n-1) else 1

implement
main0() =
println! ("fact(10) = ", fact(10))

(* ****** ****** *)

(* end of [fact.dats] *)

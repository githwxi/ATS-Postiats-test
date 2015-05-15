(*
** Envless functions vs. Closure-functions
*)

(* ****** ****** *)

#include
"share/atspre_staload.hats"

(* ****** ****** *)

extern
fun fact (n: int): int
extern
fun fact2 (n: int): int

(* ****** ****** *)

implement
fact (n) = let
//
// [loop] is a closure-function
//
fun loop (i: int, res: int): int =
  if i < n then loop (i+1, i * res) else res
//
in
  loop (1, 1)
end // end of [fact]

(* ****** ****** *)

implement
fact2 (n) = let
//
// [loop] is an envless function
//
fun loop (n: int, i: int, res: int): int =
  if i < n then loop (n, i+1, i * res) else res
//
in
  loop (n, 1, 1)
end // end of [fact]

(* ****** ****** *)

implement
main0 () = assertloc (fact(10) = fact2(10))

(* ****** ****** *)

(* end of [closure.dats] *)

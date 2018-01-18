(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
//
(* ****** ****** *)

extern
fun fact : int -> int

(* ****** ****** *)

(*
implement
fact(n) =
if
(n > 0)
then let
  val n1 = n - 1
in
  n * fact(n1)
end // end of [then]
else 1 // end of [else]
*)

(* ****** ****** *)

implement
fact(n) = let
  fun
  loop(n:int, res:int): int =
    if n > 0 then loop(n-1, n * res) else res
  // end of [loop]
in
  loop(n, 1)
end // end of [fact]

(* ****** ****** *)

implement
main0 () = println! (fact(1000000))

(* ****** ****** *)

(* end of [fact.dats] *)

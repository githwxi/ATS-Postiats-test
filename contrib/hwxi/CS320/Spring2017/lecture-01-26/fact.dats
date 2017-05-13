(*
** An example
** of inner functions
*)

(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
//
(* ****** ****** *)

extern
fun
fact : (int) -> int

(* ****** ****** *)
//
implement
fact(n) = loop(0, 1) where
{
  fun
  loop
  (
    i: int, res: int
  ) : int =
    if i < n then loop(i+1, (i+1)*res) else res
  // end of [loop]
}
//
(* ****** ****** *)
//
implement
main0() = println! ("fact(10) = ", fact(10))
//
(* ****** ****** *)

(* end of [fact.dats] *)
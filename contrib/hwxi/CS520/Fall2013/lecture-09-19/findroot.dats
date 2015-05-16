(*
** A simple example
** of higher-order function
*)

(* ****** ****** *)

//
#include "share/atspre_staload.hats"
//

(* ****** ****** *)

extern
fun findroot (f: int -> int): int
implement
findroot (f) = let
//
fun loop (i: int): int =
  if f(i) = 0 then i else loop (i+1)
//
in
  loop (0)
end (* end of [findroot] *)

(* ****** ****** *)

implement
main0 () =
{
val () = println!
(
  "findroot(lam x => x*x - x - 6) = ", findroot(lam x => x*x - x - 6)
)
} (* end of [main0] *)

(* ****** ****** *)

(* end of [findroot.dats] *)

(* ****** ****** *)
//
// For lecture-01-21
//
(* ****** ****** *)

#include
"share/atspre_staload.hats"

(* ****** ****** *)

(*
//
// HX:
// this one is not tail-recursive
//
fun tally (n: int): int =
  if n > 0 then n + tally(n-1) else 0
*)

(* ****** ****** *)
//
fun
tally (n: int): int =
  tally2 (n, 0)
//
and
tally2 (n: int, res: int): int =
  if n > 0 then tally2 (n-1, res+n) else res
//
(* ****** ****** *)

(*
(*
See the [main0] function below:
*)
*)

(* ****** ****** *)

implement
main0 () =
{
val N = 100
val () = println! ("tally(", N, ") = ", tally(N))
} // end of [main0]

(* ****** ****** *)

(* end of [tally.dats] *)

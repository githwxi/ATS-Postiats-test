//
// lecture-01-21
//
(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
//
(* ****** ****** *)
(*
//
// The ATS implementation of [fact]
// corresponds to the following C implementation:
//
int fact (int n)
{
  return (n > 0) ? (n * fact(n-1)) : 1 ;
}
*)
//
extern
fun fact (n: int): int
//
implement
fact (n) =
  if n > 0 then n * fact(n-1) else 1
//
(* ****** ****** *)
//
(*
//
// The ATS implementation of [fact2]
// corresponds to the following C implementation:
//
int fact2 (int n)
{
  int i, res = 1 ;
  for (i = 0; i <= n; i += 1) res = n * res ;
  return res ;
}
*)
extern
fun fact2 (n: int): int
implement
fact2 (n) = let
//
// This [loop] is tail-recursive
//
fun loop
  (n: int, res: int): int =
  if n > 0 then loop (n-1, n*res) else res
//
in
  loop (n, 1)
end // end of [fact2]

(* ****** ****** *)

implement
main0 () =
{
//
val () = assertloc (fact(9) = 1*2*3*4*5*6*7*8*9)
val () = assertloc (fact2(9) = 1*2*3*4*5*6*7*8*9)
//
} (* end of [main0] *)

(* ****** ****** *)

(* end of [fact.dats] *)

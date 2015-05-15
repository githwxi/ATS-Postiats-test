(*
** An example of programming with theorem-proving
*)

(* ****** ****** *)

#include "share/atspre_staload.hats"

(* ****** ****** *)
//
dataprop
TALLY (int, int) =
  | TALLYbas (0, 0)
  | {n:nat}{r:int}
    TALLYind (n+1, r+n+1) of TALLY (n, r)
//
(* ****** ****** *)
//
extern
fun tally{n:nat}
  (x: int(n)): [r:int] (TALLY (n, r) | int(r))
//
(* ****** ****** *)
//
(*
implement
tally (x) =
if x > 0 then let
  val (pf1 | r1) = tally (x-1) in (TALLYind(pf1) | r1 + x)
end else (TALLYbas () | 0)
*)
//
(* ****** ****** *)

prfun
lemma_tally
  {n:nat} .<n>.
(
  x: int(n)
) : TALLY (n, n*(n+1)/2) =
  if x > 0
    then
      TALLYind (lemma_tally (x-1))
    else let
      prval
      EQINT () = eqint_make{n,0}()
    in
      TALLYbas ()
    end // end of [else]
  // end of [if]

(* ****** ****** *)

implement
tally{n}(x) = let
  val p = x * (x + 1)
  prval () =
    mul_gte_gte_gte{n,n+1}()
  // end of [prval]
in
  (lemma_tally (x) | p \ndiv 2)
end // end of [tally]

(* ****** ****** *)

implement
main0 () =
{
val N = 100
val (pf | res) = tally (N)
val () = println! ("tally(", N, ") = ", res)
} (* end of [main0] *)

(* ****** ****** *)

(* end of [tally.dats] *)
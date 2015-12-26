(* ****** ****** *)
//
// Code for lecture-09-28
//
(* ****** ****** *)

dataprop
SUM(int(*n*), int(*s*)) =
| SUMbas (0, 0) of ()
| {n:nat}{s:int}
  SUMind (n+1, s+n+1) of SUM (n, s)

extern
prfun
lemma_sum{n:nat}(n:int(n)): [s:int | 2*s == n*(n+1)] SUM(n, s)

primplmnt
lemma_sum{n}(n) =
if
(n = 0)
then let
//
  prval
  EQINT() =
  eqint_make{n,0}()
//
in
  SUMbas() // : SUM(0, 0)
end // end of [then]
else // inductive case
  SUMind(lemma_sum(n-1))
// end of [if]

extern
prfun
lemma_sum2
  {n:nat}{s:int}
  (pf: SUM(n, s)): [2*s == n*(n+1)] void
primplmnt
lemma_sum2
  (pf) =
(
case+ pf of
| SUMbas() => ()
| SUMind(pf1) => lemma_sum2(pf1)
)

(* ****** ****** *)

(* end of [tally.dats] *)

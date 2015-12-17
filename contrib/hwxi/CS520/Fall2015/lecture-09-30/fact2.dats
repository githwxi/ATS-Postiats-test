(*
** Code for lecture-09-30
*)

(* ****** ****** *)
//
dataprop
FACT(int(*n*), int(*r*)) =
| FACTbas (0, 1) of ()
| {n:nat}{r:int}
  FACTind (n+1, (n+1)*r) of FACT(n, r)
//
extern
prfun
fact_istot
  {n:nat}(): [r:int] FACT(n, r)
extern
prfun
fact_isfun
  {n:nat}{r1,r2:int}
  (FACT(n, r1), FACT(n, r2)): [r1==r2] void
//
primplement
fact_istot{n}() =
sif
(n==0)
then FACTbas() // FACT(0, 1)
else FACTind(fact_istot{n-1}())
//
primplement
fact_isfun
  {n}{r1,r2}(pf1, pf2) =
(
case+ (pf1, pf2) of
| (FACTbas(),
   FACTbas()) => ()
| (FACTind(pf11),
   FACTind(pf21)) => fact_isfun(pf11, pf21)
) (* end of [fact_isfun] *)
//
(* ****** ****** *)

(* end of [fact2.dats] *)

(* ****** ****** *)

(*

fact(0) = 1
fact(n) = n * fact(n-1) // n >= 1
fact(n+1) = (n+1) * fact(n) // n >= 0

*)

(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
//
(* ****** ****** *)

dataprop
FACT(int, int) =
| FACTbas(0, 1) of ()
| {n:nat}{r:int}
  FACTind(n+1, (n+1)*r) of FACT(n, r)

prfun
fact_istot
  {n:nat} .<n>. (): [r:int] FACT(n, r) =
  sif n > 0 then
    FACTind(fact_istot{n-1}()) else FACTbas()
  // end of [sif]

(* ****** ****** *)
//
extern
prfun
fact_istot{n:nat}(): [r:int] FACT(n, r)
//
primplement
fact_istot{n}() =
(
  sif n > 0 then
    FACTind(fact_istot{n-1}()) else FACTbas()
  // end of [sif]
)
//
(* ****** ****** *)
//
extern
prfun
fact_isfun
  {n:nat}
  {r1,r2:int}(FACT(n, r1), FACT(n, r2)): [r1==r2] void
//
primplement
fact_isfun
  {n}{r1,r2}
  (pf1, pf2) =
(
sif
(n == 0)
then () where
{
  prval FACTbas() = pf1
  prval FACTbas() = pf2
} (* end of [then] *)
else () where
{
  prval FACTind(pf11) = pf1 // pf11: FACT(n-1, r11) // r1 = n*r11
  prval FACTind(pf21) = pf2 // pf21: FACT(n-1, r21) // r2 = n*r21
  prval () = fact_isfun(pf11, pf21)
} (* end of [else] *)
) (* end of [fact_isfun] *)
//
(* ****** ****** *)
//
fun
fact_dyn
  {n:nat} .<n>.
(
  n: int(n)
) : [r:int]
  (FACT(n, r) | int(r)) =
(
if
(n > 0)
then let
//
val (pf1 | r1) =
  fact_dyn{n-1}(n-1)
in
  (FACTind(pf1) | n * r1)
end // end of [then]
else (FACTbas(*void*) | 1)
) (* end of [fact_dyn] *)
//
(* ****** ****** *)

fun
fact_dyn
  {n:nat}
(
  n: int(n)
) : [r:int] (FACT(n, r) | int(r)) = let
//
fun
loop
{i:nat | i <= n}
{r:int}
.<n-i>.
(
  pf: FACT(i, r)
| i: int(i), res: int(r)
) : [r2:int] (FACT(n, r2) | int(r2)) =
  if i < n then loop(FACTind(pf) | i+1, (i+1)*res) else (pf | res)
//
in
  loop(FACTbas() | 0, 1)
end // end of [fact_dyn]

(* ****** ****** *)

implement
main0() =
{
  val pfres = fact_dyn(10)
  val ((*void*)) = println! ("fact_dyn(10) = ", pfres.1)
} (* end of [main0] *)

(* ****** ****** *)

(* end of [fact.dats] *)

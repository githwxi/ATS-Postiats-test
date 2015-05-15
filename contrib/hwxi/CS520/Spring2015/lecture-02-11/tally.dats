(*
** Theorem-proving:
** first-order predicate logic
** plus mathematical induction
*)

(* ****** ****** *)

dataprop
tally(int(*n*), int(*res*)) =
| TALLYbas (0, 0) of ()
| {n:int | n >= 0}{r:int}
  TALLYind (n+1, n+1+r) of tally(n, r)

(* ****** ****** *)

extern
prfun
mylemma
{n:nat} // static argument
{r:int} // static argument
(
  pf: tally(n, r)
) : EQINT(2*r, n*(n+1))

(* ****** ****** *)

primplmnt
mylemma{n}{r}(pf) =
(
case pf of
| TALLYbas() =>
    eqint_make{0,0}()
| TALLYind{n1}{r1}(pf1) => let
    prval
    EQINT() =
      mylemma{n1}{r1}(pf1)
    // end of [prval]
  in
    eqint_make{2*r,n*(n+1)}()
  end // end of [TALLYind]
)

(* ****** ****** *)

(*
//
// HX-2014-02-11:
// the following one works
// but it is difficult to follow!
//
primplmnt
mylemma(pf) =
(
case pf of
| TALLYbas() =>
    eqint_make()
| TALLYind(pf1) => let
    prval EQINT() = mylemma(pf1)
  in
    eqint_make()
  end
) (* end of [mylemma] *)
*)

(* ****** ****** *)

(* end of [tally.dats] *)

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
) : [2*r==n*(n+1)] void

(* ****** ****** *)

primplmnt
mylemma{n}{r}(pf) =
(
case pf of
| TALLYbas() => ()
| TALLYind{n1}{r1}(pf1) => let
(*
    prval () =
      prop_verify{n1+1==n}()
    // end of [prval]
    prval () =
      prop_verify{r1+n==r}()
    // end of [prval]
*)
    prval () = mylemma{n1}{r1}(pf1)
  in
    // nothing
  end // end of [TALLYind]
)

(* ****** ****** *)

(* end of [tally.dats] *)

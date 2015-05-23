(*
** For a little bit of fun
*)
 
(* ****** ****** *)
//
staload
"libats/SATS/ilist_prf.sats"
//
(* ****** ****** *)

stacst rev: ilist -> ilist
stacst append: (ilist, ilist) -> ilist

(* ****** ****** *)

propdef PAL(xs: ilist) = ILISTEQ(xs, rev(xs))

(* ****** ****** *)
//
extern
prfun
lemma_apprev_pal{xs:ilist}(): PAL(append(xs, rev(xs)))
//
(* ****** ****** *)

extern
prfun
lemma_rev_rev{xs:ilist}(): ILISTEQ(xs, rev(rev(xs)))

extern
prfun
lemma_rev_append
  {xs,ys:ilist}
(
  // argumentless
) : ILISTEQ(rev(append(xs, ys)), append(rev(ys), rev(xs)))

(* ****** ****** *)
//
extern
praxi
ILISTEQ_leibniz
  {xs,ys:ilist}{f:ilist->ilist}(ILISTEQ(xs, ys)): ILISTEQ(f(xs), f(ys))
//
(* ****** ****** *)

primplement
lemma_apprev_pal
  {xs}((*void*)) = let
//
prval pf1 = lemma_rev_rev{xs}()
prval pf1 = ILISTEQ_leibniz{xs,rev(rev(xs))}{lam(XS)=>append(XS, rev(xs))}(pf1)
prval pf2 = lemma_rev_append{xs,rev(xs)}()
prval pf2 = ILISTEQ_symm(pf2)
//
in
  ILISTEQ_tran(pf1, pf2)
end // end of [lemma_apprev_pal]

(* ****** ****** *)

(* end of [palindrome.dats] *)

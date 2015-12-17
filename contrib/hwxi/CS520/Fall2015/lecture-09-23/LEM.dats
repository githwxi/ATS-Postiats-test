(* ****** ****** *)
//
// Proving
// the law of Excluded Middle
//
(* ****** ****** *)

staload "./prop-logic.sats"

(* ****** ****** *)

extern
prfun
LEM{A:prop}(): A || ~A

(* ****** ****** *)

primplement
LEM{A}() = let
  prfn fpf1(pf1: ~(A || ~A)) = let
    prfn fpf2 (pf2: A) =
      neg_elim(pf1, PDISJ_inj_l(pf2))
  in
    neg_elim(pf1, PDISJ_inj_r(neg_intr(fpf2)))
  end
in
  negneg_elim(neg_intr(fpf1))
end // end of [LEM]

(* ****** ****** *)

(* end of [LEM.dats] *)

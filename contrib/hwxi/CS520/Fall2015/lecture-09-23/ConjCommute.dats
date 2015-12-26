(* ****** ****** *)
//
// Conjunction is commutative
//
(* ****** ****** *)

staload "./prop-logic.sats"

(* ****** ****** *)
//
extern
prfun
lemma_conj_commutative
  {A,B:prop} (pf: A && B): B && A
//
primplement
lemma_conj_commutative(pf) = conj_intr(pf.r(), pf.l())
//
(* ****** ****** *)

(* end of [ConjCommute.dats] *)

(* ****** ****** *)
//
// Disjunction is commutative
//
(* ****** ****** *)

staload "./prop-logic.sats"

(* ****** ****** *)
//
extern
prfun
lemma_disj_commutative
  {A,B:prop} (pf: A || B): B || A
//
primplement
lemma_disj_commutative
  (pf) =
  case+ pf of
  | PDISJ_inj_l(pfA) => PDISJ_inj_r(pfA)
  | PDISJ_inj_r(pfB) => PDISJ_inj_l(pfB)
//
(* ****** ****** *)

(* end of [DisjCommute.dats] *)

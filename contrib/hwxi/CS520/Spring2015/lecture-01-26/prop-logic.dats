(* ****** ****** *)
//
// An encoding of propositional logic
//
(* ****** ****** *)
//
absprop PTRUE
absprop PFALSE
//
absprop PNEG (prop) // negation
//
absprop PCONJ (prop, prop) // conjunction
absprop PDISJ (prop, prop) // disjunction
absprop PIMPL (prop, prop) // implication
//
absprop PEQUIV (prop, prop) // equivalence
//
(* ****** ****** *)

extern
praxi
conj_intr
  {A,B:prop} (pf1: A, pf2: B): PCONJ (A, B)
// end of [conj_intr]

extern
praxi
conj_elim_l{A,B:prop} (pf: PCONJ (A, B)): A
extern
praxi
conj_elim_r{A,B:prop} (pf: PCONJ (A, B)): B

(* ****** ****** *)

extern
praxi
disj_intr_l{A,B:prop} (pf: A): PDISJ (A, B)
extern
praxi
disj_intr_r{A,B:prop} (pf: B): PDISJ (A, B)

extern
praxi
disj_elim {A,B:prop} {C:prop}
  (pfm: PDISJ (A, B), pf1: A -> C, pf2: B -> C): C
// end of [disj_elim]

(* ****** ****** *)

extern
praxi
impl_intr{A,B:prop}(pf: A -> B): PIMPL (A, B)
extern
praxi
impl_elim{A,B:prop}(pf1: PIMPL (A, B), pf2: A): B

(* ****** ****** *)

extern
praxi
negneg_elim{A:prop}(pf: PNEG(PNEG(A))): A

(* ****** ****** *)

propdef ~(A:prop) = PNEG(A)
propdef &&(A:prop, B:prop) = PCONJ(A, B)
propdef ||(A:prop, B:prop) = PDISJ(A, B)

(* ****** ****** *)
//
extern
prfun
conj_commutative
  {A,B:prop}
  (pf: A && B): B && A
//
(* ****** ****** *)

primplement
conj_commutative
  (pf) = let
  prval pfA = conj_elim_l(pf)
  prval pfB = conj_elim_r(pf)
in
  conj_intr(pfB, pfA)
end // end of [conj_commutative]

(* ****** ****** *)

(* end of [prop-logic.dats] *)

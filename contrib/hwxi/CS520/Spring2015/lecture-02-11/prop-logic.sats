(* ****** ****** *)
//
// An encoding of
// propositional logicn
//
// for CS520, Spring, 2015
//
(* ****** ****** *)
//
absprop PTRUE
//
praxi true_intr(): PTRUE
//
(* ****** ****** *)
//
absprop PFALSE
//
praxi false_elim{A:prop}(PFALSE): A
//
(* ****** ****** *)
//
absprop PNEG (prop) // negation
//
praxi
neg_intr{A:prop}(fpf: A -> PFALSE): PNEG(A)
//
praxi
neg_elim{A:prop}(pf1: PNEG(A), pf2: A): PFALSE
//
praxi
negneg_elim{A:prop}(pf: PNEG(PNEG(A))): A
//
(* ****** ****** *)
//
absprop PIMPL (prop, prop) // implication
//
praxi
impl_intr{A,B:prop}(fpf: A -> B): PIMPL (A, B)
praxi
impl_elim{A,B:prop}(pf1: PIMPL (A, B), pf2: A): B
//
(* ****** ****** *)
//
absprop PCONJ (prop, prop) // conjunction
//
praxi
conj_intr
  {A,B:prop} (pf1: A, pf2: B): PCONJ (A, B)
// end of [conj_intr]
//
praxi
conj_elim_l{A,B:prop} (pf: PCONJ (A, B)): A
praxi
conj_elim_r{A,B:prop} (pf: PCONJ (A, B)): B
//
(* ****** ****** *)
//
(*
absprop PDISJ (prop, prop) // disjunction
*)
dataprop
PDISJ (A: prop, B: prop) =
  | PDISJ_inj_l of A | PDISJ_inj_r of B
//
(*
//
praxi
disj_intr_l{A,B:prop} (pf: A): PDISJ (A, B)
praxi
disj_intr_r{A,B:prop} (pf: B): PDISJ (A, B)
//
praxi
disj_elim
  {A,B:prop}{C:prop}
  (pfm: PDISJ (A, B), pf1: A -> C, pf2: B -> C): C
// end of [disj_elim]
*)
(* ****** ****** *)
//
propdef PTOP = PTRUE
propdef PBOT = PFALSE
//
propdef ~(A:prop) = PNEG(A)
//
propdef &&(A:prop, B:prop) = PCONJ(A, B)
propdef ||(A:prop, B:prop) = PDISJ(A, B)
//
propdef ->>(A:prop, B:prop) = PIMPL(A, B)
//
(* ****** ****** *)

(* end of [prop-logic.sats] *)

(*
//
// For encoding
// propositional logic
//
*)

(* ****** ****** *)

absprop PTRUE
absprop PFALSE

(* ****** ****** *)

extern
praxi true_intr(): PTRUE
extern
praxi false_elim{A:prop}(pf: PFALSE): A

(* ****** ****** *)

absprop PNEG(A: prop) // negation
propdef ~(A: prop) = PNEG(A) // shorthand

(* ****** ****** *)

extern
praxi
neg_intr{A:prop}(pf: A -> PFALSE): ~A
extern
praxi
neg_elim{A:prop}(pf1: ~A, pf2: A): PFALSE

(* ****** ****** *)

extern
prfun
neg_elim2{A:prop}{B:prop}(pf1: ~A, pf2: A): B

(* ****** ****** *)
//
absprop
PCONJ(A: prop, B: prop)
//
propdef &&(A: prop, B: prop) = PCONJ(A, B)
//
extern
praxi
conj_intr
  {A,B:prop} : (A, B) -> A && B
//
extern
praxi
conj_elim_l{A,B:prop} : (A && B) -> A
extern
praxi
conj_elim_r{A,B:prop} : (A && B) -> B
//
(* ****** ****** *)

extern
prfun
conj_commute{A,B:prop}(pf: A && B): B && A

primplement
conj_commute(pf) = let
  prval pf_A = conj_elim_l(pf)
  prval pf_B = conj_elim_r(pf)
in
  conj_intr(pf_B, pf_A)
end
  
(* ****** ****** *)
(*
absprop
PDISJ(A: prop, B: prop)
*)
dataprop
PDISJ(A: prop, B: prop) =
  | disj_intr_l(A, B) of (A)
  | disj_intr_r(A, B) of (B)
//
propdef ||(A: prop, B: prop) = PDISJ(A, B)
//
extern
prfun
disj_elim{A,B:prop}{C:prop}
  (pf0: A || B, fpf1: A -> C, fpf2: B -> C): C
//
(* ****** ****** *)
//
extern
prfun
disj_commute{A,B:prop}(pf: A || B): B || A
//
(* ****** ****** *)
//
(*
primplement
disj_commute
  (pf) =
  case pf of
  | disj_intr_l(pf_A) => disj_intr_r(pf_A)
  | disj_intr_r(pf_B) => disj_intr_l(pf_B)
*)
//
primplement
disj_commute
  {A,B}(pf) = let
  prfn fpf_A(pf_A: A): B || A = disj_intr_r(pf_A)
  prfn fpf_B(pf_B: B): B || A = disj_intr_l(pf_B)
in
  disj_elim(pf, fpf_A, fpf_B)
end
//
(* ****** ****** *)
//
absprop
PIMPL(A: prop, B: prop)
//
infixr (->) ->>
//
propdef ->>(A: prop, B: prop) = PIMPL(A, B)
//
(* ****** ****** *)
//
extern
praxi
impl_intr{A,B:prop}(pf: A -> B): A ->> B
//
extern
praxi
impl_elim{A,B:prop}(pf1: A ->> B, pf2: A): B
//
(* ****** ****** *)
//
absprop
PEQUIV(A: prop, B: prop)
//
propdef ==(A: prop, B: prop) = PEQUIV(A, B)
//
(* ****** ****** *)
//
extern
praxi
equiv_intr
  {A,B:prop}(A ->> B, B ->> A): A == B
//
extern
praxi
equiv_elim_l{A,B:prop}(pf: A == B): A ->> B
extern
praxi
equiv_elim_r{A,B:prop}(pf: A == B): B ->> A
//
(* ****** ****** *)

extern
praxi LDN{A:prop}(~(~A)): A
extern
praxi LEM{A:prop}((*void*)): A || ~A

(* ****** ****** *)
//
extern
praxi
Peirce{P,Q:prop}((*void*)): ((P ->> Q) ->> P) ->> P
//
(* ****** ****** *)

implement main0 () = ()

(* ****** ****** *)

(* end of [prop-logic.dats] *)

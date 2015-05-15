(* ****** ****** *)
//
// A proof of Peirce's Law
//
(* ****** ****** *)
(*
//
Try it on-line:
//
http://www.ats-lang.org/SERVER/MYCODE/Patsoptaas_serve.php?mycode_url=http://www.cs.bu.edu/~hwxi/academic/courses/CS520/Spring15/code/lecture-02-09/Peirce.dats
//
*)
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
disj_elim
  {A,B:prop}{C:prop}
  (pfm: PDISJ (A, B), pf1: A -> C, pf2: B -> C): C
// end of [disj_elim]

(* ****** ****** *)
//
extern
praxi
impl_intr
  {A,B:prop}
  (fpf: A -> B): PIMPL (A, B)
extern
praxi
impl_elim
  {A,B:prop}
  (pf1: PIMPL (A, B), pf2: A): B
//
(* ****** ****** *)
//
extern
praxi
false_elim{A:prop}(pf: PFALSE): A
//
(* ****** ****** *)
//
extern
praxi
neg_intr{A:prop}
  (fpf: A -> PFALSE): PNEG(A)
//
extern
praxi
neg_elim{A:prop}
  (pf1: PNEG(A), pf2: A): PFALSE
//
extern
praxi
negneg_elim{A:prop}(pf: PNEG(PNEG(A))): A
//
(* ****** ****** *)

propdef ~(A:prop) = PNEG(A)
propdef &&(A:prop, B:prop) = PCONJ(A, B)
propdef ||(A:prop, B:prop) = PDISJ(A, B)

(* ****** ****** *)

infix (->) ->>
propdef ->>(A:prop, B:prop) = PIMPL(A, B)

(* ****** ****** *)

extern
prfun
Peirce{A,B:prop}(): ((A ->> B) ->> A) ->> A

(* ****** ****** *)

primplmnt
Peirce{A,B}() = let
//
prfn
fpf0
(
  pf0: (A ->> B) ->> A
) : A = let
//
  prfn fpf1 (pf1: ~A): PFALSE =
    neg_elim(pf1, impl_elim(pf0, impl_intr(lam (pf: A) => false_elim{B}(neg_elim(pf1, pf)))))
//
in
  negneg_elim(neg_intr(fpf1))
end // end of [fpf0]
//
in
  impl_intr(fpf0)
end // end of [Peirce]

(* ****** ****** *)

(* end of [Peirce.dats] *)

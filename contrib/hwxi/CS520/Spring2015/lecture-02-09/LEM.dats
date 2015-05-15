(* ****** ****** *)
//
// A proof of
// Law of Excluded Middle
//
(* ****** ****** *)
(*
//
Try it on-line:
//
http://www.ats-lang.org/SERVER/MYCODE/Patsoptaas_serve.php?mycode_url=http://www.cs.bu.edu/~hwxi/academic/courses/CS520/Spring15/code/lecture-02-09/LEM.dats
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

extern
prfun LEM{A:prop}(): (A || ~A)

(* ****** ****** *)

primplmnt
LEM{A}() = let
//
prfn
fpf0 (
  pf: ~(A || ~A)
) : PFALSE = let
  prfn
  fpf1
  (
    pf1: A
  ) : PFALSE =
    neg_elim(pf, disj_intr_l(pf1))
in
  neg_elim(pf, disj_intr_r(neg_intr(fpf1)))
end (* end of [fpf0] *)
//
in
  negneg_elim(neg_intr(fpf0))
end // end of [LEM]

(* ****** ****** *)

(* end of [LEM.dats] *)

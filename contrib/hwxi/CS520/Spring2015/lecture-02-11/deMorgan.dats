(* ****** ****** *)
//
// A proof of
// Law of Excluded Middle
//
(* ****** ****** *)

staload "./prop-logic.sats"

(* ****** ****** *)

extern
prfun
deMorgan_disj{A,B:prop}(pf: ~(A || B)): ~A && ~B

(* ****** ****** *)

primplement
deMorgan_disj
  {A,B}(pf) =
(
//
conj_intr(
  neg_intr(lam(pfA: A) => neg_elim(pf, PDISJ_inj_l(pfA))),
  neg_intr(lam(pfB: B) => neg_elim(pf, PDISJ_inj_r(pfB)))
) (* end of [conj_intr] *)
//
) (* end of [deMorgan_disj] *)

(* ****** ****** *)

extern
prfun
deMorgan_conj{A,B:prop}(pf: ~(A && B)): ~A || ~B

(* ****** ****** *)

primplmnt
deMorgan_conj{A,B}
  (pf) = let
//
prfn
fpf(
  pf1: ~(~A || ~B)
) : PFALSE = let
  prval pf2 = deMorgan_disj{~A,~B}(pf1)
  prval pfA = negneg_elim(conj_elim_l(pf2))
  prval pfB = negneg_elim(conj_elim_r(pf2))
in
  neg_elim(pf, conj_intr(pfA, pfB))
end // end of [fpf]
//
in
  negneg_elim(neg_intr(fpf))
end // end of [deMorgan_conj]

(* ****** ****** *)

extern
prfun
LEM{A:prop}(): A || ~A

(* ****** ****** *)

primplement
deMorgan_conj
  {A,B}(pf) =
(
//
case+ LEM() of
| PDISJ_inj_l (pf1) =>
  PDISJ_inj_r (
    neg_intr(lam(pfB) => neg_elim(pf, conj_intr(pf1, pfB)))
  ) (* end of [PDISJ_inj_r] *)
| PDISJ_inj_r (pf2) => PDISJ_inj_l(pf2)
//
) (* end of [deMorgan_conj] *)

(* ****** ****** *)

(* end of [deMorgan.dats] *)

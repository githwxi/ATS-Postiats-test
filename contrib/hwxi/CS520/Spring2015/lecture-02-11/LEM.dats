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
LEM{A:prop}(): A || ~A

(* ****** ****** *)

primplmnt
LEM{A}() = let
//
prfn
fpf0 (
  pf: ~(A || ~A)
) : PFALSE = let
//
prfn
fpf1
(
  pf1: A
) : PFALSE =
  neg_elim(pf, PDISJ_inj_l(pf1))
//
in
  neg_elim(pf, PDISJ_inj_r(neg_intr(fpf1)))
end (* end of [fpf0] *)
//
in
  negneg_elim(neg_intr(fpf0))
end // end of [LEM]

(* ****** ****** *)

(* end of [LEM.dats] *)

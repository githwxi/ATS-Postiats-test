(* ****** ****** *)
//
// A proof of Peirce's Law
//
(* ****** ****** *)

staload "./prop-logic.sats"

(* ****** ****** *)
//
infix (->) ->>
//
extern
prfun
Peirce{A,B:prop}(): ((A ->> B) ->> A) ->> A
//
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

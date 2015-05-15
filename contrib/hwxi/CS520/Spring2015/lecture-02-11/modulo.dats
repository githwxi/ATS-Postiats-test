(*
** Theorem-proving:
** first-order predicate logic
** plus mathematical induction
*)

(* ****** ****** *)
//
extern
praxi
lemma0_MOD(): MOD(1, 8, 1)
extern
praxi
lemma1_MOD
  {x:int}
  {n:int}(MOD(x, 8, 1)): MOD(x+8*n, 8, 1)
//
extern
prfun
assgn2ex1{n:nat}(): MOD((2*n+1)*(2*n+1), 8, 1)
//
(* ****** ****** *)

primplmnt
assgn2ex1{n}() =
(
//
sif
n > 0
then (
  lemma1_MOD{..}{n}(assgn2ex1{n-1}())
) (* end of [then] *)
else let
  prval EQINT() = eqint_make{n,0}((*void*)) in lemma0_MOD()
end // end of [else]
//
) (* end of [assgn2ex1] *)

(* ****** ****** *)

(* end of [modulo.dats] *)

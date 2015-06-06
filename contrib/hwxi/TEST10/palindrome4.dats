(*
** For a little bit of fun
*)
 
(* ****** ****** *)
//
staload
"libats/SATS/ilist_prf.sats"
//
(* ****** ****** *)
//
dataprop
PAL (ilist, int) =
| PALnil (ilist_nil, 0)
| {x:int} PALone (ilist_sing (x), 1)
| {x:int}
  {l:ilist}{n:nat}{ll:ilist}
  PALcons (ilist_cons (x, ll), n+2) of (PAL (l, n), SNOC (l, x, ll))
//
(* ****** ****** *)

sortdef elt = int

(* ****** ****** *)
//
extern
prfun
lemma_rev_snoc_cons
  {l:ilist}{x:elt}{ll:ilist}
(
  pfrev: REVERSE(l, l), pfsnoc: SNOC(l, x, ll)
) : REVERSE(ilist_cons(x, ll), ilist_cons(x, ll))
//
(* ****** ****** *)

prfn
pal_rev
{l:ilist}{n:nat}
(
  pfpal0: PAL (l, n)
) : REVERSE (l, l) = let
//
prfun
lemma
{l:ilist}
{n:nat} .<n>.
  (pfpal0: PAL(l, n)): REVERSE (l, l) =
(
case+ pfpal0 of
| PALnil () => REVAPPnil ()
| PALone () => REVAPPcons (REVAPPnil ())
| PALcons
  (
    pfpal, pfsnoc
  ) =>
  (
    lemma_rev_snoc_cons(lemma(pfpal), pfsnoc)
  ) (* end of [PALcons] *)
) (* end of [lemma] *)
//
in
  lemma (pfpal0)
end // end of [pal_rev]

(* ****** ****** *)

(* end of [palindrome4.dats] *)

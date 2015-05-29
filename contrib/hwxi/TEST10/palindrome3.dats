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
PAL (ilist) =
| PALnil (ilist_nil)
| {x:int} PALone (ilist_sing (x))
| {x:int}
  {l,ll,lll:ilist}
  PALcons (ilist_cons (x, ll)) of (PAL (l), SNOC (l, x, ll))
//
(* ****** ****** *)

sortdef elt = int

(* ****** ****** *)
//
(*
extern
prfun
lemma_reverse_scons
  {x:elt}{xs,ys:ilist}{ys1:ilist}
  (REVERSE(xs, ys), SNOC(ys, x, ys1)): REVERSE(ilist_cons(x,xs), ys1)
*)
extern
prfun
lemma2_reverse_scons
  {x:elt}{xs:ilist}{ys1:ilist}
  (REVERSE(ilist_cons(x,xs), ys1)): [ys:ilist] (REVERSE(xs, ys), SNOC(ys, x, ys1))
//
(*
extern
prfun
lemma_append_scons
  {x:elt}{xs,ys,zs:ilist}{ys1,zs1:ilist}
  (APPEND(xs, ys, zs), SNOC(ys, x, ys1), SNOC(zs, x, zs1)): APPEND(xs, ys1, zs1)
*)
extern
prfun
lemma2_append_scons
  {x:elt}{xs,ys:ilist}{ys1,zs1:ilist}
  (APPEND(xs, ys1, zs1), SNOC(ys, x, ys1)): [zs:ilist] (APPEND(xs, ys, zs), SNOC(zs, x, zs1))
//
(* ****** ****** *)

prfun
mylemma
  {l,lr,m:ilist} .<l>.
(
  pf1: REVERSE (l, lr), pf2: APPEND(l, lr, m)
) : PAL (m) =
(
case+ pf2 of
| APPENDnil () => let
    prval REVAPPnil () = pf1 in PALnil ()
  end // end of [APPENDnil()]
| APPENDcons(pf2) => let
    prval (pfrev, pfsnoc) = lemma2_reverse_scons(pf1)
    prval (pfapp, pfsnoc2) = lemma2_append_scons(pf2, pfsnoc)
    prval pfpal = mylemma(pfrev, pfapp)
  in
    PALcons (pfpal, pfsnoc2)
  end // end of [APPENDcons]
)

(* ****** ****** *)

(* end of [palindrome3.dats] *)

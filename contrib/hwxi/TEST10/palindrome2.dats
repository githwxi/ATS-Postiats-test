(*
** For a little bit of fun
*)
 
(* ****** ****** *)
//
staload
"libats/SATS/ilist_prf.sats"
//
(* ****** ****** *)

propdef PAL(xs: ilist) = REVERSE(xs, xs)

(* ****** ****** *)
//
extern
prfun
lemma_apprev_pal{xs,ys,zs:ilist}
  (REVERSE(xs, ys), APPEND(xs, ys, zs)): PAL(zs)
//
(* ****** ****** *)

sortdef elt = int

(* ****** ****** *)
//
extern
prfun
nth_istot
  {xs:ilist}
  {n:int}{i:nat | i < n}
  (LENGTH(xs, n)): [x:elt] NTH(x, xs, i)
//
extern
prfun
nth_isfun
  {x1,x2:elt}{xs:ilist}{i:int}
  (NTH(x1, xs, i), NTH(x2, xs, i)): [x1==x2] void
//
(* ****** ****** *)
//
extern
prfun
mylemma1
  {xs,xs2:ilist}{n:int}
(
  LENGTH(xs, n), LENGTH(xs2, n),
  fpf: {x:elt}{i:int}(NTH(x, xs, i) -> NTH(x, xs2, n-1-i))
) : REVERSE (xs, xs2)
//
(* ****** ****** *)

primplmnt
mylemma1
  {xs,xs2}{n}
  (pflen_xs, pflen_xs2, fpf) = let
  prval
  [ys:ilist]
  pfrev_ys = reverse_istot{xs}()
  prval
  pflen_ys =
    lemma_reverse_length(pfrev_ys, pflen_xs)
  // end of [prval]
  prval pfrev_xs = lemma_reverse_symm(pfrev_ys)
  prval ILISTEQ() =
  lemma_nth_ilisteq{ys,xs2}{n}
  (
    pflen_ys, pflen_xs2
  , lam(pf) => fpf(lemma_reverse_nth(pfrev_xs, pflen_ys, pf))
  ) (* end of [lemma_nth_ilisteq] *)
in
  pfrev_ys
end // end of [mylemma1]

(* ****** ****** *)
//
extern
prfun
mylemma_main
  {xs,ys,zs:ilist}{n:int}
(
  LENGTH(xs, n), REVERSE(xs, ys), APPEND(xs, ys, zs)
) : {z:elt}{i:int}(NTH(z, zs, i) -<prf> NTH(z, zs, 2*n-1-i))
//
(* ****** ****** *)

primplmnt
lemma_apprev_pal
  {xs,ys,zs}
  (pfrev_xs_ys, pfapp_xs_ys_zs) = let
  prval pflen_xs = length_istot{xs}()
  prval pflen_ys =
    lemma_reverse_length(pfrev_xs_ys, pflen_xs)
  prval pflen_zs =
    lemma_append_length(pfapp_xs_ys_zs, pflen_xs, pflen_ys)
in
  mylemma1(pflen_zs, pflen_zs, mylemma_main(pflen_xs, pfrev_xs_ys, pfapp_xs_ys_zs))
end // end of [lemma_apprev_pal]

(* ****** ****** *)

(* end of [palindrome2.dats] *)

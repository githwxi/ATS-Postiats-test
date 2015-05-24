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
mylemma1
  {xs,xs2:ilist}{n:int}
(
  LENGTH(xs, n), LENGTH(xs2, n),
  fpf: {x:elt}{i:int}(NTH(x, xs, i) -> NTH(x, xs2, n-1-i))
) : REVERSE (xs, xs2)
//
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
  prval pflen_ys = lemma_reverse_length(pfrev_xs_ys, pflen_xs)
  prval pflen_zs = lemma_append_length(pfapp_xs_ys_zs, pflen_xs, pflen_ys)
in
  mylemma1(pflen_zs, pflen_zs, mylemma_main(pflen_xs, pfrev_xs_ys, pfapp_xs_ys_zs))
end // end of [lemma_apprev_pal]

(* ****** ****** *)

(* end of [palindrome2.dats] *)

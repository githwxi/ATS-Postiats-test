(*
** Code used for lecture-10-26
*)

(* ****** ****** *)
//
dataview
array_v
(
  a:t@ype, addr(*l*), int(*n*)
) =
  | {l:addr}
    array_v_nil(a, l, 0) of ()
  | {l:addr}{n:nat}
    array_v_cons(a, l, n+1) of (a@l, array_v(a, l+sizeof(a), n))
//
(* ****** ****** *)
//
extern
prfun
array_v_split
  {a:t0p}
  {l:addr}
  {n:nat}
  {i:nat | i <= n}
  (array_v(a, l, n)): (array_v(a, l, i), array_v(a, l+i*sizeof(a), n-i))
//
extern
prfun
array_v_unsplit
  {a:t0p}
  {l:addr}
  {n1,n2:nat}
  (array_v(a, l, n1), array_v(a, l+n1*sizeof(a), n2)): (array_v(a, l, n1+n2))
//
(* ****** ****** *)

primplmnt
array_v_split
  {a}{l}{n}{i}(pf) =
(
sif
i==0
then let // base
  prval pf1 = array_v_nil()
  prval pf2 = pf
  prval EQINT() = eqint_make{i,0}()
in
  (pf1, pf2)
end
else let // inductive
  prval array_v_cons(pfh, pft) = pf
  prval (pft1, pft2) = array_v_split{a}{l+sizeof(a)}{n-1}{i-1}(pft)
  prval pf1 = array_v_cons{a}{l}{i-1}(pfh, pft1)
  prval pf2 = pft2
in
  (pf1, pf2)
end
)

(* ****** ****** *)

implement main0 () = ()

(* ****** ****** *)

(* end of [array_v_split.dats] *)

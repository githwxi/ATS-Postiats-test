(*
** Some examples involving array-views
*)

(* ****** ****** *)
//
(*
dataview
array_v(a:t@ype, addr, int) =
| {l:addr}
  array_v_nil (a, l, 0) of ()
| {l:addr}{n:nat}
  array_v_cons (a, l, n+1) of
    (a @ l, array_v(a, l+sizeof(a), n))
*)
//
(* ****** ****** *)
//
extern
fun{a:t@ype}
array_get_first
  {l:addr}{n:pos}
  (pf: !array_v(a, l, n) | p: ptr(l)):<> (a)
//
(* ****** ****** *)

implement
{a}(*tmp*)
array_get_first
  (pf | p) = x0 where
{
//
prval
(pf1, pf2) = array_v_uncons(pf)
//
val x0 = !p
//
prval () = pf := array_v_cons(pf1, pf2)
//
} // end of [array_get_first]

(* ****** ****** *)
//
extern
fun{a:t@ype}
array_get_at
  {l:addr}{n:int}{i:nat | i < n}
  (pf: !array_v(a, l, n) | p: ptr(l), i: int(i)):<> (a)
//
(* ****** ****** *)

implement
{a}(*tmp*)
array_get_at
  (pf | p, i) = x0 where
{
//
prval
(pf1, pf2) =
array_v_split_at(pf | i2sz(i))
//
val x0 = array_get_first(pf2 | ptr_add<a>(p, i))
//
prval () = pf := array_v_unsplit(pf1, pf2)
//
} (* end of [array_get_at] *)

(* ****** ****** *)

(* end of [array_v.dats] *)

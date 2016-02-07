(*
** Code used for lecture-10-21
*)

(* ****** ****** *)
//
extern
fun{a:t@ype}
ptr_read{l:addr}(pf: !a@l | p: ptr(l)): a
//
extern
fun{a:t@ype}
ptr_write{l:addr}
  (pf: !a? @ l >> a@l | p: ptr(l), x: a): void
//
// T@L: a value of T stored at L // at-view
//
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

extern
fun{a:t@ype}
array_get_first
  {l:addr}{n:pos}
  (pf: !array_v(a, l, n) | p: ptr(l)): a

(* ****** ****** *)

implement
{a}(*tmp*)
array_get_first
  (pf | p) = x where
{
//
prval
array_v_cons(pf1, pf2) = pf // pf1: a@l; pf2: array_v(a, ...)
//
val x = ptr_read(pf1 | p)
//
prval () = pf := array_v_cons(pf1, pf2)
//
} (* end of [array_get_first] *)

(* ****** ****** *)
//
extern
fun{a:t@ype}
array_get_at
  {l:addr}{n:int}
  (pf: !array_v(a, l, n) | p: ptr(l), i: natLt(n)): (a)
//
(* ****** ****** *)

extern
prfun
split
  {a:t@ype}
  {l:addr}{n:int}
  {i:nat | i <= n}
(
  pf: array_v(a, l, n)
) : (array_v(a, l, i), array_v(a, l+i*sizeof(a), n-i))
extern
prfun
unsplit
  {a:t@ype}
  {l:addr}{n:int}
  {n1,n2:nat}
(
  array_v(a, l, n1), array_v(a, l+n1*sizeof(a), n2)
) : array_v(a, l, n1+n2)
//
(* ****** ****** *)

implement
{a}(*tmp*)
array_get_at
  {l}{n}
  (pf | p, [i:int] i) = x where
{
//
prval
(pf1, pf2) = split{a}{l}{n}{i}(pf)
//
val x = array_get_first<a>(pf2 | ptr_add<a>(p, i))
//
prval () = pf := unsplit(pf1, pf2)
//
} (* end of [array_get_at] *)

(* ****** ****** *)

(* end of [array_v.dats] *)

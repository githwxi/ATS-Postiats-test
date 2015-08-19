(*
** HX-2015-08-19:
** Based on one by Kiwamu Okabe
*)

(* ****** ****** *)
//
// How to compile and test: 
// patscc -DATS_MEMALLOC_LIBC -o test06 test06.dats && ./test06
//
(* ****** ****** *)

#include "share/atspre_define.hats"
#include "share/atspre_staload.hats"

staload "libats/SATS/ilist_prf.sats"
staload "libats/SATS/gfarray.sats"
staload _ = "libats/DATS/gfarray.dats"
staload UN = "prelude/SATS/unsafe.sats"

#define ARRAY_SIZE 16

absprop
UNION (
  ys1: ilist, ys2: ilist, res: ilist
) (* end of [absprop] *)

extern
prfun
lemma_perm
{xs1,xs2:ilist}{xs:ilist}
{ys1,ys2:ilist}{ys:ilist}
(
  APPEND (xs1, xs2, xs)
, PERMUTE (xs1, ys1), PERMUTE (xs2, ys2), UNION (ys1, ys2, ys)
) : PERMUTE (xs, ys)

extern fun{a:vt0p}
gfarray_mergesort
  {l:addr}{xs:ilist}{n:int}
(
  pflen: LENGTH(xs, n)
, pfarr: gfarray_v(a, l, xs)
| p: ptr(l), n: size_t n
) : [ys:ilist] (SORT(xs, ys), gfarray_v(a, l, ys) | (*void*))

extern fun{a:vt0p}
gfarray_mergesort$cmp
  {x1,x2:int}
  (x1: &stamped_vt (a, x1), x2: &stamped_vt (a, x2)): int(sgn(x1-x2))

// xxx Instead of "half"?
extern
fun halfsize{n:nat}
  (n: size_t n):<> [n2:nat | 2*n2 <= n] size_t (n2)

extern
prfun sort_nilsing
  {xs:ilist}{n:int | n <= 1} (pf: LENGTH (xs, n)): SORT (xs, xs)

// xxx Not yet
extern fun{a:vt0p}
merge
  {l:addr}{xs1,xs2:ilist}{n1:int}
(
  pflen_xs1: LENGTH (xs1, n1)
, pford_xs1: ISORD (xs1)
, pford_xs2: ISORD (xs2)
, pfarr1: gfarray_v (a, l, xs1)
, pfarr2: gfarray_v (a, l+n1*sizeof(a), xs2)
| p1: ptr(l), p2: ptr(l+n1*sizeof(a))
) : [xs:ilist] (UNION (xs1, xs2, xs), ISORD (xs), gfarray_v (a, l, xs) | (*void*))

implement{a}
gfarray_mergesort
  {l}{xs}{n}
(
  pflen, pfarr | p, n
) =
  if n >= 2 then let
    val [n2:int] n2 = halfsize (n)
    prval (pflen_xs1, pflen_xs2, pfapp_xs1_xs2, pfarr_xs1, pfarr_xs2) =
      gfarray_v_split {a}{..}{..}{..}{n2} (pflen, pfarr)
    val p2 = ptr_add (p, n2)
    val (pfsort_xs1, pfarr_xs1 | (*void*)) = gfarray_mergesort (pflen_xs1, pfarr_xs1 | p, n2)
    prval (pford_xs1, pfperm_xs1) = sort_elim (pfsort_xs1)
    val (pfsort_xs2, pfarr_xs2 | (*void*)) = gfarray_mergesort (pflen_xs2, pfarr_xs2 | p2, n-n2)
    prval (pford_xs2, pfperm_xs2) = sort_elim (pfsort_xs2)
//
    prval pflen_xs1 = lemma_permute_length(pfperm_xs1, pflen_xs1)
    prval pflen_xs2 = lemma_permute_length(pfperm_xs2, pflen_xs2)
//
    val (pfuni, pford, pfarr | (*void*)) =
      merge (pflen_xs1, pford_xs1, pford_xs2, pfarr_xs1, pfarr_xs2 | p, p2)
    prval pfperm = lemma_perm (pfapp_xs1_xs2, pfperm_xs1, pfperm_xs2, pfuni)
    prval pfsrt = sort_make (pford, pfperm)
  in
    (pfsrt, pfarr | (*void*))
  end else
    (sort_nilsing (pflen), pfarr | (*void*))

implement main0 () = {
  // Init array
  var arr = @[int][ARRAY_SIZE](0)
  vtypedef VT = [xs:ilist](LENGTH(xs, ARRAY_SIZE), gfarray_v(int, arr, xs) | ptr(arr))
  val (pflen, pfarr | arr) = $UN.castvwtp0{VT}(addr@arr)
  // Access array
  prval nth0 = NTHbas ()
  prval LENGTHcons _ = pflen
  val v = gfarray_get_at (nth0, pfarr | arr, i2sz(0))
  val () = println! ("gfarray[0] = ", unstamp_t{int}(v))
  // Finish array
  prval () = $UN.castview0(pfarr)
}

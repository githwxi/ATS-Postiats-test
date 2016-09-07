(* ****** ****** *)
//
// Functions on arrays
//
(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
#include
"share/HATS/atspre_staload_libats_ML.hats"
//
(* ****** ****** *)
//
extern
fun{a:t@ype}
myarray_foreach_cloref
  : (array0(a), (a) -<cloref1> void) -> void
extern
fun{a:t@ype}
myarray_iforeach_cloref
  : (array0(a), (int, a) -<cloref1> void) -> void
//
implement
{a}
myarray_foreach_cloref
  (A, fwork) = let
  val n = A.size()
in
  int_foreach_cloref(sz2i(n), lam(i) => fwork(A[i]))
end // [myarray_foreach_cloref]
//
implement
{a}
myarray_iforeach_cloref
  (A, fwork) = let
  val n = A.size()
in
  int_foreach_cloref(sz2i(n), lam(i) => fwork(i, A[i]))
end // [myarray_iforeach_cloref]
//
(* ****** ****** *)
//
extern
fun
{a,b:t@ype}
myarray_foldleft_cloref
  (xs: array0(a), init: b, fopr: (b, a) -<cloref1> b): b
//
(* ****** ****** *)

implement
{a,b}
myarray_foldleft_cloref
  (xs, init, fopr) = let
//
val n = sz2i(xs.size())
//
fun loop(i: int, res: b): b =
  if i < n then loop(i+1, fopr(res, xs[i])) else res
//
in
  loop(0, init)
end // end of [myarray_foldleft_cloref]

(* ****** ****** *)
//
extern
fun
{a,b:t@ype}
myarray_foldright_cloref
  (xs: array0(a), fopr: (b, a) -<cloref1> b, sink: b): b
//
(* ****** ****** *)

implement
{a,b}
myarray_foldright_cloref
  (xs, fopr, sink) = let
//
val n = sz2i(xs.size())
//
fun loop(i: int, res: b): b =
  if i > 0 then loop(i-1, fopr(res, xs[i-1])) else res
//
in
  loop(n, sink)
end // end of [myarray_foldright_cloref]

(* ****** ****** *)
//
extern
fun{a:t@ype}
binary_search(A: array0(a), key: a): int
//
(* ****** ****** *)

implement
{a}(*tmp*)
binary_search
  (A, k0) = let
//
fun
search
(
  l: int, u: int
) : int =
  if l < u
    then let
      val m = l + (u - l) / 2
      val sgn = gcompare_val_val<a>(A[m], k0)
    in
      if sgn > 0
        then search(l, m)
        else (if sgn < 0 then search(m+1, u) else m)
      // end of [if]
    end
    else (l)
//
in
  search(0, sz2i(A.size()))
end // end of [binary_search]

(* ****** ****** *)

(* end of [myarray.dats] *)

(*
//
// HX-2015-10-24:
// For answering the following question:
//
// https://groups.google.com/forum/#!topic/ats-lang-users/Npt1yosB0bw
//
*)

(* ****** ****** *)

#include
"share/atspre_staload.hats"

(* ****** ****** *)

staload
UN = "prelude/SATS/unsafe.sats"

(* ****** ****** *)
//
extern
fun
{a:t@ype}
arrayref_get_subarray
{n:int}
{i,j:nat|i+j <= n}
(
  A: arrayref(a, n), size_t(i)
) :
[
  l:addr
] (
  array_v(a, l, j), array_v(a, l, j) -<lin,prf> void | ptr(l)
) (* end of [arrayref_get_subarray] *)
//
implement
{a}(*tmp*)
arrayref_get_subarray
  (A, i) = $UN.castvwtp0(ptr_add<a>(arrayref2ptr(A), i))
//
(* ****** ****** *)

implement
main0() = () where
{
//
#define N 9
#define I 2
#define J 5
#define T int
//
val A =
arrayref_make_elt<T>(i2sz(N), 0)
//
val out = stdout_ref
//
val () =
  fprint (out, "A = {")
val () = fprint (out, A, i2sz(N))
val () = fprintln! (out, "}")
//
val (pf, fpf | p1) = arrayref_get_subarray(A, i2sz(I))
//
val () = array_foreach_fun(!p1, i2sz(J), lam(x) =<1> x := 1)
//
prval ((*pf-return*)) = fpf(pf)
//
val () =
  fprint (out, "A = {")
val () = fprint (out, A, i2sz(N))
val () = fprintln! (out, "}")
//
} (* end of [main0] *)

(* ****** ****** *)

(* end of [test24.dats] *)

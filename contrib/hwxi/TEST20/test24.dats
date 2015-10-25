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

implement
main0() = () where
{
//
#define N 10
#define N2 6
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
val p0 = arrayref2ptr(A)
val p1 = ptr_add<T>(p0, 2)
val (pf, fpf | p1) = $UN.ptr_vtake{@[T][N2]}(p1)
//
val () = array_foreach_fun(!p1, i2sz(N2), lam(x) =<1> x := 1)
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

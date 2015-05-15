(* ****** ****** *)
//
// A generic version of array0_sum
//
(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
//
staload "libats/ML/SATS/basis.sats"
staload "libats/ML/SATS/array0.sats"
staload _ = "prelude/DATS/gnumber.dats"
staload _ = "libats/ML/DATS/array0.dats"
//
(* ****** ****** *)

(*
fun{a:t@ype}
array0_make_elt (n: int, x: a): array0 (a)

fun{a:t@ype}
array0_get_at (A: array0(a), i: int): a
fun{a:t@ype}
array0_set_at (A: array0(a), i: int, x: a): void
*)

(* ****** ****** *)

extern
fun{a:t@ype}
array0_sum (A: array0 (a)): a

implement
{a}(*tmp*)
array0_sum (A) = let
//
fun
loop (i: size_t, res: a): a =
(
if i < A.size()
  then loop (succ(i), gadd_val_val<a> (res, A[i])) else res
// end of [if]
) (* end of [loop] *)
//
in
  loop (i2sz(0), gnumber_int(0))
end // end of [array0_sum]

val A = array0_make_elt<int> (i2sz(10)(*asz*), 1)
val sum = array0_sum<int> (A)
val () = fprintln! (stdout_ref, "array0(", A, ") = ", sum)

val A2 = array0($arrpsz{double}(1.0, 2.0, 3.0))
val sum = array0_sum<double> (A2)
val () = fprintln! (stdout_ref, "array0(", A2, ") = ", sum)

implement main0 () = ()

(* ****** ****** *)

(* end of [array0_sum2.dats] *)

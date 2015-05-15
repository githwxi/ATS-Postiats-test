(* ****** ****** *)
//
// A simple array-example
//
(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
//
(* ****** ****** *)

staload "libats/ML/SATS/basis.sats"
staload "libats/ML/SATS/array0.sats"
staload _ = "libats/ML/DATS/array0.dats"

(* ****** ****** *)

(*
//
fun{a:t@ype}
array0_make_elt (n: int, x: a): array0 (a)
//
fun{a:t@ype}
array0_get_at (A: array0(a), i: int): a
fun{a:t@ype}
array0_set_at (A: array0(a), i: int, x: a): void
//
*)

(* ****** ****** *)

extern
fun array0_sum (A: array0 (double)): double

(* ****** ****** *)

implement
array0_sum (A) = let
//
fun
loop (i: size_t, res: double): double =
  if i < A.size()
    then loop (succ(i), res + A[i]) else res
  // end of [if]
//
in
  loop (i2sz(0), 0.0)
end // end of [array0_sum]

(* ****** ****** *)

val A = (array0)$arrpsz{double}(1.0, 2.0, 3.0)
val () = println! ("array0_sum(A) = ", array0_sum(A))  
  
(* ****** ****** *)

implement main0 () = ()

(* ****** ****** *)

(* end of [array0_sum.dats] *)

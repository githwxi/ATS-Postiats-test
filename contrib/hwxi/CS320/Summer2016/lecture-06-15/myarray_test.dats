(* ****** ****** *)
//
// Testing functions on arrays
//
(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
#include
"share/HATS/atspre_staload_libats_ML.hats"
//
(* ****** ****** *)

staload "./../mylib/myarray.dats"

(* ****** ****** *)

#define N 100

(* ****** ****** *)

(*
val A =
array0_make_elt<int>(i2sz(N), 0)
*)
val A =
array0_tabulate<int>(i2sz(N), lam(i) => 2**(sz2i(g1ofg0(i))))
val () =
myarray_iforeach_cloref<int>(A, lam(i, x) => println! (i, ": ", x))

(* ****** ****** *)

fun pow2(n: int): lint =
  if n > 0 then 2L * pow2(n-1) else 1L

(* ****** ****** *)

val A =
array0_tabulate<lint>(i2sz(N), lam(i) => pow2(sz2i(i)))
val () =
myarray_iforeach_cloref<lint>(A, lam(i, x) => println! (i, ": ", x))

(* ****** ****** *)

implement main0() = ()

(* ****** ****** *)

(* end of [myarray_test.dats] *)

#include "share/atspre_staload.hats"
#include "share/HATS/atspre_staload_libats_ML.hats"

#include "$PATSHOMELOCS/effectivats-divideconquer/mylibies.hats"

#staload DC = $DivideConquer

(* ****** ****** *)
//
extern
fun
myreverse
  : (list0(int)) -> list0(int)
//
assume
$DC.input_t0ype = (int, list0(int))
//
assume $DC.output_t0ype = list0(int)
//
(* ****** ****** *)

local

implement
$DC.DC_base_test<>
  (nxs) = (nxs.0 < 2)
implement
$DC.DC_base_solve<>(nxs) = nxs.1

implement
$DC.DC_divide<>(nxs) = let
  val n = nxs.0
  val xs = nxs.1
  val n2 = n / 2
  val xs1 = list0_take_exn(xs, n2)
  val xs2 = list0_drop_exn(xs, n2)
in
  list0_cons((n2, xs1), list0_cons((n-n2, xs2), list0_nil()))
end // end of [DC_divide]

implement
$DC.DC_conquer_combine<>
  (_, rs) =
  list0_append(r2, r1) where
{
  val-list0_cons(r1, rs) = rs
  val-list0_cons(r2, rs) = rs
}

in (* in-of-local *)
//
implement
myreverse(xs) =
  $DC.DC_solve<>(@(length(xs), xs))
//
end // end of [local]

(* ****** ****** *)

implement
main0() = 
{
val xs =
g0ofg1
($list{int}(0, 1, 2, 3, 4, 2))
val () = println! ("xs = ", xs)
//
val ys = myreverse(xs)
val () = println! ("ys = ", ys)
//
}

(* ****** ****** *)

(* end of [myreverse2.dats] *)

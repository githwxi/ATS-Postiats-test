#include "share/atspre_staload.hats"
#include "share/HATS/atspre_staload_libats_ML.hats"

#include "$PATSHOMELOCS/effectivats-divideconquer/mylibies.hats"

#staload DC = $DivideConquer

extern
fun MCarthy91 : (int) -> int

assume $DC.input_t0ype = int
assume $DC.output_t0ype = int

local

implement
$DC.DC_base_test<>(n) = (n > 100)
implement
$DC.DC_base_solve<>(n) = n - 10

implement
$DC.DC_divide<>(n) =
  xs where
{
  val xs = list0_nil()
  val xs = list0_cons(n+11, xs)  
}

implement
$DC.DC_conquer_combine<>
  (_, rs) = MCarthy91(r1) where
{
  val-list0_cons(r1, rs) = rs
}

in

implement
MCarthy91(n) = $DC.DC_solve<>(n)

end

(* ****** ****** *)

implement main0() = 
{
  val () = println! ("MCarthy91(10) = ", MCarthy91(10))
  val () = println! ("MCarthy91(20) = ", MCarthy91(20))
}
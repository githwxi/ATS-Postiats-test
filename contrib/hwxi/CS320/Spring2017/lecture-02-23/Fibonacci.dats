#include "share/atspre_staload.hats"
#include "share/HATS/atspre_staload_libats_ML.hats"

#include "$PATSHOMELOCS/effectivats-divideconquer/mylibies.hats"

#staload DC = $DivideConquer

extern
fun Fibonacci : (int) -> int

assume $DC.input_t0ype = int
assume $DC.output_t0ype = int

(* ****** ****** *)

local

implement
$DC.DC_base_test<>(n) = (n < 2)
implement
$DC.DC_base_solve<>(n) = if n = 0 then 0 else 1

implement
$DC.DC_divide<>(n) =
  xs where
{
  val xs = list0_nil()
  val xs = list0_cons(n-1, xs)
  val xs = list0_cons(n-2, xs)
}

implement
$DC.DC_conquer_combine<>
  (_, rs) = r1 + r2 where
{
  val-list0_cons(r1, rs) = rs
  val-list0_cons(r2, rs) = rs
}

in

implement
Fibonacci(n) = $DC.DC_solve<>(n)

end

(* ****** ****** *)

implement main0() = 
{
  val () = println! ("Fibonacci(10) = ", Fibonacci(10))
  val () = println! ("Fibonacci(20) = ", Fibonacci(20))
}

(* ****** ****** *)

(* end of [Fibonacci.dats] *)

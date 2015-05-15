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
fun
array0_sumup
  (A: array0 (int)): int
//
implement
array0_sumup
  (A) = let
//
val n = sz2i(A.size())
//
fun loop (i: int, res: int): int =
  if i < n then loop (i+1, res+A[i]) else res
//
in
  loop (0, 0)
end // end of [array0_sumup]
//
(* ****** ****** *)

implement
main0 () =
{
//
val A =
array0_tabulate (i2sz(10), lam i => sz2i(i))
val () = println! ("sum = ", array0_sumup (A))
//
} (* end of [main0] *)

(* ****** ****** *)

(* end of [array0.dats] *)

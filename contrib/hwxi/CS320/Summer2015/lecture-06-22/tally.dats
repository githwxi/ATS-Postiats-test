//
#include
"share/atspre_define.hats"
#include
"share/atspre_staload.hats"
#include
"share/HATS/atspre_staload_libats_ML.hats"
//
(* ****** ****** *)

extern
fun sum_list(A: list0(int)): int
extern
fun sum_array(A: array0(int)): int

(* ****** ****** *)

implement
sum_array(A) = let
//
val n = sz2i(A.size())
//
fun loop (i: int, res: int): int =
  if i < n then loop(i+1, A[i] + res) else res
//
in
  loop(0, 0)
end // end of [sum_array]

(* ****** ****** *)

(*
implement
sum_list(xs) = let
//
val n = length(xs)
//
fun loop (i: int, res: int): int =
  if i < n then loop(i+1, xs[i] + res) else res
//
in
  loop(0, 0)
end // end of [sum_list]
*)

(* ****** ****** *)

implement
sum_list(xs) = let
//
fun
loop (xs: list0(int), res: int): int =
(
case+ xs of
| nil0 () => res
| cons0 (x, xs) => loop(xs, res + x)
)
in
  loop(xs, 0)
end // end of [sum_list]

(* ****** ****** *)

val xs =
list0_make_intrange(0, 1000000)
val A0 = array0_make_list0( xs )

(* ****** ****** *)

implement main0 () =
{
  val () = println! ("sum_list(xs) = ", sum_list(xs))
  val () = println! ("sum_array(A0) = ", sum_array(A0))
}

(* ****** ****** *)

(* end of [tally.dats] *)

(*
** Loop unrolling
*)

(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
//
(* ****** ****** *)

staload UN = $UNSAFE

(* ****** ****** *)

abstype Z
abstype S(nt:type)

(* ****** ****** *)
//
dataprop
tieq(type, int) =
  | TIEQZ(Z, 0)
  | {nt:type}{n:nat}
    TIEQS(S(nt), n+1) of tieq(nt, n)
//
(* ****** ****** *)
//
extern
fun
{a:t0p}
{nt:type}
dotprod{n:nat}
  (tieq(nt, n) | A: &array(a, n), B: &array(a, n)): (a)
//
(* ****** ****** *)
//
implement
(a)(*tmp*)
dotprod<a><Z>
(
  pf | A, B
) = gnumber_int<a> (0)
//
(* ****** ****** *)
//
implement
(a,nt)
dotprod<a><S(nt)>
  {n}(pf0 | A, B) = let
//
prval
TIEQS(pf1) = pf0
//
val pA0 = addr@A
val pB0 = addr@B
//
val res0 =
  gmul_val_val<a>(A[0], B[0])
//
val (pfA1, fpfA1 | pA1) =
  $UN.ptr0_vtake{array(a,n-1)}(ptr_succ<a>(pA0))
val (pfB1, fpfB1 | pB1) =
  $UN.ptr0_vtake{array(a,n-1)}(ptr_succ<a>(pB0))
//
val res1 = dotprod (pf1 | !pA1, !pB1)
//
prval () = fpfA1 (pfA1) and () = fpfB1 (pfB1)
//
in
  gadd_val_val<a> (res0, res1)
end // end of [dotprod_S_]

(* ****** ****** *)
//
extern
fun
{a:t0p}
dotprod3
  (A: &array(a, 3), B: &array(a, 3)): (a)
//
(* ****** ****** *)

implement
{a}(*tmp*)
dotprod3 (A, B) =
dotprod<a><S(S(S(Z)))> (TIEQS(TIEQS(TIEQS(TIEQZ))) | A, B)

(* ****** ****** *)

implement
main0 () =
{
//
var A =
@[double](1.0, 2.0, 3.0)
var B =
@[double](1.0, 2.0, 3.0)
//
val res = dotprod3<double> (A, B)
//
val () = println! ("res(14) = ", res)
//
} (* end of [main0] *)

(* ****** ****** *)

(* end of [test04.dats] *)

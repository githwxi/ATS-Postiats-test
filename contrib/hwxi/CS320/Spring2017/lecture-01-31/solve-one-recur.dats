(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
//
(* ****** ****** *)
//
#define ATS_DYNLOADFLAG 0
//
(* ****** ****** *)
//
// HX: Solving with one recursive call
//
(* ****** ****** *)
//
extern
fun intsqrt(n0: int): int
//
(* ****** ****** *)

(*
fun intsqrt(n: int): int =
  if n >= 2 then let
    val res1 = intsqrt(n / 4)
    val res2 = 2 * res1
  in
    if (res2 + 1)*(res2 + 1) <= n then res2 + 1 else res2
  end else n // end of [if]
*)

(* ****** ****** *)

extern
fun solve(n: int): int
extern
fun solve$base(n: int): int
and solve$base_test(n: int): bool
and solve$recarg(n: int): int
and solve$assmbl_aft(n: int, res: int): int

(* ****** ****** *)

implement
solve(n) =
if
solve$base_test(n)
then solve$base(n)
else let
//
val res =
  solve(solve$recarg(n))
//
in
  solve$assmbl_aft(n, res)
end

(* ****** ****** *)

implement
intsqrt(n) = solve(n)

(* ****** ****** *)
//
implement
solve$base(n) = n
//
implement
solve$base_test(n) =
  if n >= 2 then false else true
//
implement
solve$recarg(n) = (n/4)
//
implement
solve$assmbl_aft(n, res) = let
  val res2 = 2 * res
  val res21 = res2 + 1
in
  if res21*res21 > n then res2 else res21
end // end of [solve$assmbl_aft]

(* ****** ****** *)

(* end of [solve-one-recur.dats] *)

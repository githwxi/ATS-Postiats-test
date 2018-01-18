(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
#include
"share/atspre_staload_libats_ML.hats"
//
(* ****** ****** *)

extern
fun
{X:t@ype}
int_foldleft
( N: int
, res: X
, fopr: cfun(X, int, X)): X

implement
{X}
int_foldleft
  (N, res, fopr) = let
//
fun loop(i: int, res: X): X =
  if i < N
    then loop(i+1, fopr(res, i)) else res
  // end of [if]
//
in
  loop(0, res)
end // end of [int_foldleft]

(* ****** ****** *)
//
fun // int-instance
fact(n: int): int = // 1*...*n
int_foldleft<int>(n, 1, lam(res, i) => res * (i+1))
fun // double-instance
tally(n: int): double = // 1+...+n
int_foldleft<double>(n, 0.0, lam(res, i) => res + (i+1))
//
(* ****** ****** *)

val () = println! ("fact(10) = ", fact(10))
val () = println! ("tally(10) = ", tally(10))

(* ****** ****** *)

implement main0() = ()

(* ****** ****** *)

(* end of [int_foldleft.dats] *)

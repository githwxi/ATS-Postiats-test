(* ****** ****** *)

#include
"share/atspre_staload.hats"
#include
"share/HATS/atspre_staload_libats_ML.hats"

(* ****** ****** *)

extern
fun
list0_mult(xs: list0(int)): int

(* ****** ****** *)

implement
list0_mult(xs) =
list0_foldleft<int><int>(xs, 1, lam(res, x) => res*x)

(* ****** ****** *)

implement
list0_mult(xs) =
(
 case+ xs of
 | list0_nil() => 1
 | list0_cons(x, xs) => x * list0_mult(xs)
)

(* ****** ****** *)

implement
list0_mult(xs) =
(
 case+ xs of
 | list0_nil() => 1
 | list0_cons(x, xs) =>
     if x = 0 then 0 else x * list0_mult(xs)
   // end of [list0_cons]
)

(* ****** ****** *)

implement
list0_mult(xs) = let
//
exception ZERO of ()
//
fun aux(xs: list0(int)): int =
(
 case+ xs of
 | list0_nil() => 1
 | list0_cons(x, xs) =>
     if x = 0 then $raise ZERO() else x * aux(xs)
   // end of [list0_cons]
)
in
  try aux(xs) with ~ZERO() => 0
end

(* ****** ****** *)

(* end of [list0_mult_exn.dats] *)

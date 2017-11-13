(* ****** ****** *)

#include
"share/atspre_staload.hats"
#include
"share/HATS/atspre_staload_libats_ML.hats"

(* ****** ****** *)

fun
mul1_list
(xs: list0(int)): int =
(
case+ xs of
| list0_nil() => 1
| list0_cons(x, xs) => x * mul1_list(xs)
)

(* ****** ****** *)

fun
mul2_list
(xs: list0(int)): int =
(
case+ xs of
| list0_nil() => 1
| list0_cons(x, xs) =>
  if x = 0 then 0 else x * mul2_list(xs)
)

(* ****** ****** *)

fun
mul3_list
(xs: list0(int)): int = let
//
exception ZERO of ()
//
fun aux(xs: list0(int)): int =
(
case+ xs of
| list0_nil() => 1
| list0_cons(x, xs) =>
  if x = 0
    then $raise(ZERO) else x * aux(xs)
  // end of [if]
)
//
in
  try aux(xs) with ~ZERO() => 0
end // end of [mul3_list]

(* ****** ****** *)

fun
mul4_list
(xs: list0(int)): int = let
//
exception ZERO2 of ()
//
in

try

list0_foldleft<int><int>
( xs, 1
, lam(res, x) =>
  if x = 0 then $raise ZERO2() else x * res
)

with ~ZERO2() => 0

end // end of [mul4_list]

(* ****** ****** *)

val xs =
g0ofg1($list{int}(1, 2, 3, 4, 0, 5, 6, 7, 8, 9))

(* ****** ****** *)

val () = println! ("mul1_list(xs) = ", mul1_list(xs))
val () = println! ("mul2_list(xs) = ", mul2_list(xs))
val () = println! ("mul3_list(xs) = ", mul3_list(xs))
val () = println! ("mul4_list(xs) = ", mul4_list(xs))

(* ****** ****** *)

implement main0() = ()

(* ****** ****** *)

(* end of [mul_list.dats] *)

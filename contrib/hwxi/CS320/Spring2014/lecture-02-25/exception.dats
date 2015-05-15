(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
#include
"share/HATS/atspre_staload_libats_ML.hats"
//
(* ****** ****** *)

typedef intlist = list0 (int)

(* ****** ****** *)

fun mult
  (xs: list0 (int)): int =
(
case+ xs of
| cons0 (x, xs) => x * mult (xs) | nil0 () => 1
)

(* ****** ****** *)

fun mult2
  (xs: list0 (int)): int =
(
case+ xs of
| cons0 (x, xs) =>
    if x = 0 then 0 else x * mult (xs)
| nil0 () => 1
)

(* ****** ****** *)

exception ZERO of ()

fun mult3
  (xs: list0 (int)): int = let
//
fun aux
  (xs: list0 (int)): int =
case+ xs of
| cons0
    (x, xs) =>
    if x = 0 then $raise ZERO else x * mult3 (xs)
| nil0 () => 1
//
in
//
try
  aux (xs)
with
  | ~ZERO () => 0
//
end // end of [mult3]

(* ****** ****** *)

implement
main0 () =
{
val xs =
  $list{int}(1, 2, 0, 3, 4, 5)
val xs = list0_of_list (xs)
//
val () = println! ("mult(", xs, ") = ", mult (xs))
val () = println! ("mult2(", xs, ") = ", mult2 (xs))
val () = println! ("mult3(", xs, ") = ", mult3 (xs))
} (* end of [main0] *)

(* ****** ****** *)

(* end of [exception.dats] *)

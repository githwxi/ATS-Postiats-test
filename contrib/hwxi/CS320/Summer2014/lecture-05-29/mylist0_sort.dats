//
#include
"share/atspre_staload.hats"
//
staload "libats/ML/SATS/basis.sats"
staload "libats/ML/SATS/list0.sats"
staload _ = "libats/ML/DATS/list0.dats"
//
(* ****** ****** *)

#define sing0(x) cons0(x, nil0())

(* ****** ****** *)

extern
fun insertSort (xs: list0(int)): list0(int)

implement
insertSort (xs) = let
//
fun insord
(
  xs: list0(int), x0: int
) : list0(int) =
  case+ xs of
  | nil0 () => sing0 (x0)
  | cons0 (x, xs2) =>
      if x0 < x
        then cons0 (x0, xs)
        else cons0 (x, insord (xs2, x0))
      // end of [if]
//
fun loop
(
  xs: list0(int), ys: list0(int)
) : list0(int) =
  case+ xs of
  | nil0 () => ys
  | cons0 (x, xs) => loop (xs, insord (ys, x))
//
in
  loop (xs, nil0 ())
end // end of [insertSort]

(* ****** ****** *)

implement
main0 () = () where
{
//
val xs =
$list{int}(9, 8, 1, 2, 3, 0, 5, 4, 7)
//
val xs = g0ofg1 (xs)
val () = println! ("xs(unsort) = ", xs)
val xs = insertSort (xs)
val () = println! ("xs(sorted) = ", xs)
//
} (* end of [main0] *)

(* ****** ****** *)

(* end of [mylist0_sort.dats] *)

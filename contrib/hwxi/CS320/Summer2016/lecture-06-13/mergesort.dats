(*
** mergesort: top-down
*)

(* ****** ****** *)

#include
"share/atspre_staload.hats"
#include
"share/HATS/atspre_staload_libats_ML.hats"

(* ****** ****** *)

staload "./../mylib/mylist.dats"

(* ****** ****** *)

extern
fun
{a:t@ype}
mergesort(xs: list0(a)): list0(a)

(* ****** ****** *)

implement
{a}
mergesort(xs) = let
//
fun
merge
(
  xs1: list0(a), xs2: list0(a)
) : list0(a) =
(
case+ xs1 of
| nil0() => xs2
| cons0(x1, xs11) =>
  (
    case+ xs2 of
    | nil0() => xs1
    | cons0(x2, xs21) => let
        val sgn =
          gcompare_val_val<a> (x1, x2)
        // end of [val]
      in
        if sgn <= 0
          then cons0(x1, merge(xs11, xs2))
          else cons0(x2, merge(xs1, xs21))
        // end of [if]
      end // end of [cons0]
  )
)
//
fun
msort
(
  xs: list0(a), n: int // n is the length of xs
) : list0(a) = (
//
if
n >= 2
then let
  val n2 = n / 2
  val xs1 = list0_take_exn(xs, n2)
  val xs2 = list0_drop_exn(xs, n2)
in
  merge(msort(xs1, n2), msort(xs2, n-n2))
end // end of [then]
else (xs) // end of [else]
//
) (* end of [msort] *)
//
in
  msort(xs, length(xs))
end // end of [mergesort]

(* ****** ****** *)

implement
main0() = () where
{
//
val xs =
$list{int}
(
  2, 8, 3, 4, 5, 7, 0, 6, 9, 1
) (* $list *)
val xs = g0ofg1(xs)
//
val xs2 = xs + xs
//
val ys2 = mergesort<int>(xs2)
val () = println! ("xs2 = ", xs2)
val () = println! ("ys2 = ", ys2)
//
} (* end of [main0] *)

(* ****** ****** *)

(* end of [mergesort] *)

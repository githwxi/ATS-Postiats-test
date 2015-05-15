(* ****** ****** *)
//
// quicksort on list0-values
//
(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
//
(* ****** ****** *)

staload "libats/ML/SATS/basis.sats"
staload "libats/ML/SATS/list0.sats"
staload _ = "libats/ML/DATS/list0.dats"

(* ****** ****** *)

extern
fun{
a:t@ype
} qsort (list0(a)): list0(a)

(* ****** ****** *)

extern
fun{
a:t@ype
} part (xs: list0(a), pivot: a): (list0(a), list0(a))

(* ****** ****** *)

implement
{a}(*tmp*)
part (xs, pivot) =
(
case+ xs of
| nil0 () => (nil0(), nil0())
| cons0 (x, xs) => let
    val sgn =
      gcompare_val_val<a> (x, pivot)
    // end of [val]
    val (left, right) = part (xs, pivot)
  in
    if sgn <= 0 then
      (cons0 (x, left), right)
    else
      (left, cons0 (x, right))
    // end of [if]
  end
)

(* ****** ****** *)

implement
{a}(*tmp*)
qsort (xs) = let
//
(*
val () = println! ("qsort: entering")
*)
//
in
//
case+ xs of
| nil0 () => nil0 ()
| cons0
    (x, xs) => let
    val pivot = x
    val (left, right) = part<a> (xs, pivot)
    val left = qsort<a> (left)
    val right = qsort<a> (right)
  in
    list0_append (left, cons0 (x, right))
  end
//
end // end of [qsort]

(* ****** ****** *)

val xs = list0
(
  $arrpsz{int}(9, 0, 2, 3, 4, 8, 7, 6, 1, 5)
) (* end of [val] *)

(* ****** ****** *)

val ys = qsort<int> (xs)
val () = println! ("qsort(", xs, ") = ", ys)

(* ****** ****** *)

implement main0 () = ()

(* ****** ****** *)

(* end of [list0_quicksort.dats] *)

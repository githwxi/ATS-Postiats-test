(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
#include
"share/HATS/atspre_staload_libats_ML.hats"
//
(* ****** ****** *)

staload "./../mylib/mylist.dats"

(* ****** ****** *)
//
extern
fun
{a:t@ype}
quicksort : (list0(a)) -> list0(a)
//
(* ****** ****** *)
(*
implement
{a}(*tmp*)
quicksort(xs) = let
(*
val () = println! ("quicksort:...")
*)
in
//
case+ xs of
| list0_nil() => list0_nil()
| list0_cons(x0, xs) => let
    val xs_l =
      mylist_filter_cloref<a>
        (xs, lam(x) => gcompare_val_val<a>(x, x0) < 0)
    val xs_m =
      mylist_filter_cloref<a>
        (xs, lam(x) => gcompare_val_val<a>(x, x0) = 0)
    val xs_r =
      mylist_filter_cloref<a>
        (xs, lam(x) => gcompare_val_val<a>(x, x0) > 0)
  in
    quicksort(xs_l) + cons0(x0, xs_m) + quicksort(xs_r)
  end (* end of [list0_cons] *)
end // end of [quicksort]
*)
(* ****** ****** *)

implement
{a}(*tmp*)
quicksort(xs) = let
//
fun split
(
  xs: list0(a), pivot: a
, xs_l: list0(a), xs_r: list0(a)
): (list0(a), list0(a)) =
(
case+ xs of
| list0_nil() => (xs_l, xs_r)
| list0_cons(x, xs) => let
    val sgn = gcompare_val_val<a>(x, pivot)
  in
    if sgn <= 0
      then split(xs, pivot, cons0(x, xs_l), xs_r)
      else split(xs, pivot, xs_l, cons0(x, xs_r))
    // end of [if]
  end
)
//
in
//
case+ xs of
| list0_nil() => list0_nil()
| list0_cons(x0, xs) => let
    val (xs_l, xs_r) = split(xs, x0, nil0, nil0)
  in
    quicksort(xs_l) + cons0(x0, quicksort(xs_r))
  end
//
end // end of [quicksort]

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
val ys2 = quicksort<int>(xs2)
//
val () = println! ("xs2 = ", xs2)
val () = println! ("ys2 = ", ys2)
//
} (* end of [main0] *)

(* ****** ****** *)

(* end of [quicksort.dats] *)

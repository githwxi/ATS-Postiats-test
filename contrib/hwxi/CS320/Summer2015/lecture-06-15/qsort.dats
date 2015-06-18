//
#include
"share/atspre_staload.hats"
//
#include
"share/HATS/atspre_staload_libats_ML.hats"
//
(* ****** ****** *)

extern
fun{a:t@ype} qsort : (list0(a)) -> list0(a)

(* ****** ****** *)

implement
{a}(*tmp*)
qsort(xs) = let
//
fun
split 
(
  pivot: a, xs: list0(a)
) : (list0(a), list0(a)) = let
//
fun
loop
(
  xs: list0(a), xs1: list0(a), xs2: list0(a)
) : (list0(a), list0(a)) =
(
case+ xs of
| list0_nil() => (xs1, xs2)
| list0_cons(x, xs) => let
    val sgn = gcompare_val_val<a> (x, pivot)
  in
    if sgn <= 0
      then loop(xs, list0_cons(x, xs1), xs2)
      else loop(xs, xs1, list0_cons(x, xs2))
    // end of [if]
  end // end of [list0_cons]
)
in
  loop (xs, list0_nil, list0_nil)
end // end of [split]
//
in
(
case+ xs of
| list0_nil() => list0_nil()
| list0_cons(x, xs) => let
    val (xs1, xs2) = split(x, xs)
    val ys1 = qsort(xs1)
    and ys2 = qsort(xs2)
  in
    list0_append(ys1, list0_cons(x, ys2))
  end
)
end // end of [qsort]

(* ****** ****** *)

val xs = g0ofg1($list{int}(9, 8, 1, 3, 4, 6, 7, 5, 2, 0))

(* ****** ****** *)

val ys1 = qsort<int> (xs)

(* ****** ****** *)

local

implement
gcompare_val_val<int> (x1, x2) = ~(x1 - x2)

in

val ys2 = qsort<int> (xs)

end // end of [local]

(* ****** ****** *)

val ys3 = qsort<int> (xs)

(* ****** ****** *)

val () = println! ("xs = ", xs)
val () = println! ("ys1 = ", ys1)
val () = println! ("ys2 = ", ys2)
val () = println! ("ys3 = ", ys3)

(* ****** ****** *)

implement main0 () = ()

(* ****** ****** *)

(* end of [qsort.dats] *)

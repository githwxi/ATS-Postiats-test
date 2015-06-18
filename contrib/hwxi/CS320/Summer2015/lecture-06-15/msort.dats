//
#include
"share/atspre_staload.hats"
//
#include
"share/HATS/atspre_staload_libats_ML.hats"
//
(* ****** ****** *)

extern
fun{a:t@ype} msort : (list0(a)) -> list0(a)
extern
fun{a:t@ype} msort2 : (list0(a), int) -> list0(a)

(* ****** ****** *)

implement
{a}(*tmp*)
msort(xs) = msort2 (xs, length(xs))

implement
{a}(*tmp*)
msort2(xs, n) = let
//
fun
split
(
  xs: list0(a), k: int, xs1: list0(a)
) : (list0(a), list0(a)) =
(
if k > 0 then let
  val-list0_cons(x, xs) = xs
in
  split (xs, k-1, cons0(x, xs1))
end else (xs1, xs)
)
//
fun
merge
(
  xs1: list0(a), xs2: list0(a)
) : list0(a) =
(
case+ (xs1, xs2) of
| (list0_nil(), _) => xs2
| (_, list0_nil()) => xs1
| (list0_cons(x1, xs1_tl),
   list0_cons(x2, xs2_tl)) => let
    val sgn = gcompare_val_val<a> (x1, x2)
  in
    if sgn <= 0
      then list0_cons(x1, merge(xs1_tl, xs2))
      else list0_cons(x2, merge(xs1, xs2_tl))
    // end of [if]
  end
)
//
in
//
if
n >= 2
then let
  val (xs1, xs2) = split(xs, n/2, nil0)
  val ys1 = msort2(xs1, n/2) and ys2 = msort2(xs2, n-n/2)
in
  merge(ys1, ys2)
end // end of [then]
else xs // end of [else]
//
end // end of [msort2]

(* ****** ****** *)

val xs = g0ofg1($list{int}(9, 8, 1, 3, 4, 6, 7, 5, 2, 0))

(* ****** ****** *)

val ys1 = msort<int> (xs)

(* ****** ****** *)

local

implement
gcompare_val_val<int> (x1, x2) = ~(x1 - x2)

in

val ys2 = msort<int> (xs)

end // end of [local]

(* ****** ****** *)

val ys3 = msort<int> (xs)

(* ****** ****** *)

val () = println! ("xs = ", xs)
val () = println! ("ys1 = ", ys1)
val () = println! ("ys2 = ", ys2)
val () = println! ("ys3 = ", ys3)

(* ****** ****** *)

implement main0 () = ()

(* ****** ****** *)

(* end of [msort.dats] *)

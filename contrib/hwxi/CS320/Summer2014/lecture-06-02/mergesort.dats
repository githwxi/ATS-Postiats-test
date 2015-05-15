(* ****** ****** *)
//
// An implementation of merge-sort
//
(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
//
staload "libats/ML/SATS/basis.sats"
staload "libats/ML/SATS/list0.sats"
staload _ = "libats/ML/DATS/list0.dats"
//
(* ****** ****** *)

extern
fun{a:t@ype}
mergesort (xs: list0(a)): list0(a)

(* ****** ****** *)

extern
fun{a:t@ype} mergesort2 : (list0(a), int) -> list0(a)

(* ****** ****** *)

extern
fun{a:t@ype}
split : (list0(a), int) -> (list0(a), list0(a))
extern
fun{a:t@ype}
merge : (list0(a), list0(a)) -> list0(a)

(* ****** ****** *)

implement
{a}(*tmp*)
split (xs, k) = let
  val xs1 = list0_take_exn<a> (xs, k)
  val xs2 = list0_drop_exn<a> (xs, k)
in
  (xs1, xs2)
end // end of [split]

(* ****** ****** *)

implement
{a}(*tmp*)
merge (xs, ys) =
(
case+ (xs, ys) of
| (_, nil0()) => xs
| (nil0(), _) => ys
| (cons0 (x, xs1),
   cons0 (y, ys1)) => let
    val sgn =
      gcompare_val_val<a> (x, y)
    // end of [val]
  in
    if sgn <= 0
      then cons0 (x, merge<a> (xs1, ys))
      else cons0 (y, merge<a> (xs, ys1))
    // end of [if]
  end // end of ...
) (* end of [merge] *)

(* ****** ****** *)

implement
{a}(*tmp*)
mergesort (xs) = let
  val n = list0_length<a> (xs) in mergesort2<a> (xs, n)
end // end of [mergesort]

(* ****** ****** *)

implement
{a}(*tmp*)
mergesort2
  (xs, n) =
(
  if n >= 2 then let
    val n2 = n / 2
    val (xs1, xs2) = split<a> (xs, n2)
    val ys1 = mergesort2<a> (xs1, n2)
    and ys2 = mergesort2<a> (xs2, n-n2)
  in
    merge<a> (ys1, ys2)
  end else (xs) // end of [if]
)

(* ****** ****** *)

val xs0 =
$list{int}(1, 9, 4, 2, 6, 8, 5, 7, 0, 3)
val xs0 = g0ofg1 (xs0) // list0(int)
val ((*void*)) = println! ("xs0 = ", xs0)

(* ****** ****** *)

val xs1 = mergesort<int> (xs0)
val ((*void*)) = println! ("xs1 = ", xs1)

(* ****** ****** *)

local
//
implement
gcompare_val_val<int>
  (x, y) = ~(compare(x, y))
//
in (*in-of-local*)
//
val xs2 = mergesort<int> (xs0)
val ((*void*)) = println! ("xs2 = ", xs2)
//
end // end of [local]

(* ****** ****** *)

implement main0 () = ()

(* ****** ****** *)

(* end of [mergesort.dats] *)

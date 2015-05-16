//
// Implementation of mergesort
//
(* ****** ****** *)
//
// Course CS520: Lecture-2013-09-26
// Instructor: Hongwei Xi (hwxiATcsDOTbuEDU)
//
(* ****** ****** *)

#include
"share/atspre_staload.hats"

(* ****** ****** *)

staload "libats/ML/SATS/basis.sats"
staload "libats/ML/SATS/list0.sats"
staload _(*anon*) = "libats/ML/DATS/list0.dats"

(* ****** ****** *)
//
extern
fun{a:t@ype} mergesort (xs: list0 (a)): list0 (a)
//
(* ****** ****** *)
//
// HX: n is the length of the list
//
extern
fun{a:t@ype}
msort (xs: list0 (a), n: int): list0 (a)
//
// HX: n2 is the length of the first part
//
extern
fun{a:t@ype}
split (xs: list0 (a), n2: int): (list0 (a), list0 (a))
//
// HX: [merge] is stable
//
extern
fun{a:t@ype}
merge (xs: list0 (a), ys: list0 (a)): list0 (a)
//
(* ****** ****** *)
//
implement{a}
mergesort (xs) =
  msort<a> (xs, list0_length(xs))
//
(* ****** ****** *)

implement
{a}(*tmp*)
msort (xs, n) = let
//
(*
val () = println! ("Mergesort: entering")
*)
//
in
//
if n >= 2 then let
  val n2 = n / 2
  val (xs1, xs2) = split<a> (xs, n2)
  val ys1 = msort<a> (xs1, n2)
  and ys2 = msort<a> (xs2, n - n2)
in
  merge<a> (ys1, ys2)
end else xs // end of [if]
//
end // end of [mergesort]

implement{a}
split (xs, n) = let
in
//
if n > 0 then let
  val-cons0 (x, xs) = xs
  val (xs1, xs2) = split<a> (xs, n-1)
in
  (cons0{a}(x, xs1), xs2)
end else (nil0 (), xs)
//
end // end of [split]

implement{a}
merge (xs1, xs2) = let
in
//
case+ (xs1, xs2) of
| (cons0 (x1, xs1tl),
   cons0 (x2, xs2tl)) => let
//
    val sgn = gcompare_val_val<a> (x1, x2)
//
  in
    if sgn <= 0
      then cons0{a}(x1, merge<a> (xs1tl, xs2))
      else cons0{a}(x2, merge<a> (xs1, xs2tl))
    // end of [if]
  end // end of [cons0, cons0]
//
| (cons0 _, nil0 ()) => xs1
| (nil0 (), cons0 _) => xs2
| (nil0 (), nil0 ()) => nil0
//
end // end of [merge]

(* ****** ****** *)

implement
main0{n}
(
  argc, argv
) = let
//
val xs = let
//
fun
loop {i:nat | i <= n}
(
  argv: !argv(n)
, i: int (i), xs: list0(int)
) : list0(int) =
(
  if i < argc then let
    val x = g0string2int (argv[i]) in
    loop (argv, i+1, list0_cons{int}(x, xs))
  end else xs // end of [if]
)
//
in
  loop (argv, 1(*i*), list0_nil)
end // end of [val]
//
val xs = list0_reverse (xs)
val xs_sorted = mergesort<int> (xs)
//
in
  fprint_list0_sep (stdout_ref, xs_sorted, ", "); fprint_newline (stdout_ref)
end // end of [main0]

(* ****** ****** *)

(* end of [mergesort.dats] *)

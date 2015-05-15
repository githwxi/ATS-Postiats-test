(*
** Introduction to datatypes
*)

(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
//
(* ****** ****** *)

datatype
intlist =
  | intlist_nil of ()
  | intlist_cons of (int, intlist)

(* ****** ****** *)

#define nil intlist_nil
#define :: intlist_cons
#define cons intlist_cons

(* ****** ****** *)

extern
fun intlist_is_nil (intlist): bool
extern
fun intlist_is_cons (intlist): bool

(* ****** ****** *)

overload iseqz with intlist_is_nil
overload isneqz with intlist_is_cons

(* ****** ****** *)

implement
intlist_is_nil (xs) =
  (case+ xs of nil () => true | _ => false)
implement
intlist_is_cons (xs) =
  (case+ xs of cons _ => true | _ => false)

(* ****** ****** *)
//
extern
fun fprint_intlist
  (out: FILEref, xs: intlist): void
//
overload fprint with fprint_intlist
//
(* ****** ****** *)

implement
fprint_intlist
  (out, xs) = let
//
fun loop
  (xs: intlist, i: int): void =
  if isneqz(xs) then let
    val-cons (x, xs) = xs
    val () = if i > 0 then fprint (out, "; ")
    val () = fprint (out, x)
  in
    loop (xs, i+1)
  end else () // end of [if]
//
in
  loop (xs, 0)
end // end of [fprint_intlist]

(* ****** ****** *)

extern
fun intlist_length (intlist): int

implement
intlist_length (xs) = let
//
fun loop
  (xs: intlist, res: int): int =
  case+ xs of
  | nil () => res
  | cons (_, xs) => loop (xs, res+1)
//
in
  loop (xs, 0)
end // end of [intlist_length]

(* ****** ****** *)

extern
fun revapp (intlist, intlist): intlist
implement
revapp (xs, ys) =
(
case+ xs of
| nil () => ys
| cons (x, xs) => revapp (xs, cons (x, ys))
)

(* ****** ****** *)

extern
fun append (intlist, intlist): intlist
implement
append (xs, ys) =
(
case+ xs of
| nil () => ys
| cons (x, xs) => cons (x, append (xs, ys))
)

(* ****** ****** *)

extern
fun mergesort (intlist): intlist

(* ****** ****** *)

extern
fun split (intlist): (intlist, intlist)

(* ****** ****** *)

extern
fun merge (intlist, intlist): intlist

(* ****** ****** *)

implement
mergesort (xs) = let
  val n = intlist_length (xs)
in
  if n >= 2 then let
    val (xs1, xs2) = split (xs)
    val xs1_sorted = mergesort (xs1)
    val xs2_sorted = mergesort (xs2)
  in
    merge (xs1_sorted, xs2_sorted)
  end else (xs) // end of [if]
end // end of [mergesort]

(* ****** ****** *)

implement
split (xs) = let
//
fun loop
(
  xs: intlist
, res1: intlist, res2: intlist
) : (intlist, intlist) =
(
case+ xs of
| cons (x1, cons (x2, xs)) =>
    loop (xs, cons (x1, res1), cons (x2, res2))
| cons (x1, nil ()) => (cons (x1, res1), res2)
| nil () => (res1, res2)
)
//
in
  loop (xs, nil(), nil())
end // end of [split]

(* ****** ****** *)

implement
merge (xs, ys) =
(
case (xs, ys) of
| (nil (), _) => ys
| (_, nil ()) => xs
| (cons (x, xs1), cons (y, ys1)) =>
    if x <= y
      then cons (x, merge (xs1, ys))
      else cons (y, merge (xs, ys1))
    // end of [if]
)

(* ****** ****** *)

implement
main0 () = () where
{
//
val xs =
1 :: 9 :: 8 :: 3 :: 2 :: 4
  :: 5 :: 7 :: 6 :: 0 :: nil ()
//
val () = fprintln! (stdout_ref, "xs = ", xs)
//
val xs = mergesort (xs)
val () = fprintln! (stdout_ref, "xs = ", xs)
//
} (* end of [main0] *)

(* ****** ****** *)

(* end of [intlist.dats] *)

(* ****** ****** *)
//
// Implementing list-based quicksort
//
(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
//
(* ****** ****** *)

datatype intlist =
  | intlist_nil of ()
  | intlist_cons of (int, intlist)
  
(* ****** ****** *)

#define nil intlist_nil
#define :: intlist_cons
#define cons intlist_cons

(* ****** ****** *)

extern
fun append (intlist, intlist): intlist

implement
append (xs, ys) =
(
case+ xs of
| nil () => ys | cons (x, xs) => cons (x, append (xs, ys))
)

(* ****** ****** *)
//
extern
fun print_intlist (intlist): void
//
extern
fun fprint_intlist (FILEref, intlist): void
//
overload print with print_intlist
overload fprint with fprint_intlist
//
(* ****** ****** *)
//
implement
print_intlist
  (xs) = fprint_intlist (stdout_ref, xs)
//
implement
fprint_intlist
  (out, xs) = let
//
fun loop
  (xs: intlist, i: int): void =
(
  case+ xs of
  | cons (x, xs) => let
      val () = if i > 0 then fprint (out, ", ")
      val () = fprint (out, x)
    in
      loop (xs, i+1)
    end // end of [cons]
  | nil ((*void*)) => ()
)
//
in
  loop (xs, 0)
end // end of [fprint_intlist]

(* ****** ****** *)

extern
fun quicksort (intlist): intlist

extern
fun partition (pvt: int, xs: intlist): (intlist, intlist)

(* ****** ****** *)

implement
quicksort (xs) =
(
case+ xs of
| nil () => nil ()
| cons (x, xs) => let
    val (
      xs_left, xs_right
    ) = partition (x(*pvt*), xs)
    val ys_left = quicksort (xs_left)
    val ys_right = quicksort (xs_right)
  in
    append (ys_left, cons(x, ys_right))
  end // end of [cons]
) (* end of [quicksort] *)

(* ****** ****** *)

implement
partition (pvt, xs) = let
//
fun loop
(
  xs: intlist
, left: intlist, right: intlist
) : (intlist, intlist) =
  case+ xs of
  | nil () => (left, right)
  | cons (x, xs) =>
    (
      if x <= pvt
        then loop (xs, x :: left, right)
        else loop (xs, left, x :: right)
      // end of [if]
    ) (* end of [cons] *)
//
in
  loop (xs, nil (), nil ())
end // end of [partition]

(* ****** ****** *)

val xs =
1 :: 8 :: 7 :: 6 :: 9 :: 2 :: 3 :: 4 :: 0 :: 5 :: nil ()
val xs_sorted = quicksort (xs)
val () = println! ("xs_sorted = ", xs_sorted)

(* ****** ****** *)

implement main0 () = ()

(* ****** ****** *)

(* end of [quicksort.dats] *)

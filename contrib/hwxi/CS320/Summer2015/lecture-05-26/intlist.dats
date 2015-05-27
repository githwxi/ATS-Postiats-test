(*
** For lecture-05-26
*)

(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
//
(* ****** ****** *)

datatype intlist =
  | intlist_nil of () // nullary
  | intlist_cons of (int, intlist) // binary

(* ****** ****** *)

val xs0 = intlist_nil() // xs0 = []
val xs1 = intlist_cons(1, xs0) // xs1 = [1]
val xs2 = intlist_cons(2, xs1) // xs2 = [1,2]

(* ****** ****** *)

extern
fun
print_intlist (xs: intlist): void
extern
fun
fprint_intlist (out: FILEref, xs: intlist): void
//
overload print with print_intlist
overload fprint with fprint_intlist
//
(* ****** ****** *)

implement
print_intlist(xs) =
  fprint_intlist(stdout_ref, xs)

(* ****** ****** *)
//
implement
fprint_intlist
  (out, xs) =
  case+ xs of
  | intlist_nil() => fprint! (out, "nil")
  | intlist_cons(x, xs) => fprint! (out, x, "::", xs)
//
(* ****** ****** *)

extern
fun
intrange (start:int, finish: int): intlist

implement
intrange (m, n) =
  if m < n then
    intlist_cons(m, intrange(m+1, n)) else intlist_nil()
  // end of [if]

(* ****** ****** *)

extern
fun length : intlist -> int

implement
length(xs) =
  case xs of
  | intlist_nil() => 0
  | intlist_cons(x, xs2) => length(xs2) + 1
  
(* ****** ****** *)

extern
fun append : (intlist, intlist) -> intlist

implement
append (xs, ys) =
case+ xs of
| intlist_nil() => ys
| intlist_cons(x, xs) => intlist_cons(x, append(xs, ys))

(* ****** ****** *)

extern
fun reverse : (intlist) -> intlist
extern
fun revappend : (intlist, intlist) -> intlist

(* ****** ****** *)

implement
reverse(xs) = revappend(xs, intlist_nil())

implement
revappend(xs, ys) =
case+ xs of
| intlist_nil() => ys
| intlist_cons(x, xs) => revappend(xs, intlist_cons(x, ys))

(* ****** ****** *)

extern
fun merge_ordered : (intlist, intlist) -> intlist

implement
merge_ordered
  (xs, ys) =
(
//
case+ xs of
| intlist_nil() => ys
| intlist_cons (x1, xs2) =>
  (
    case+ ys of
    | intlist_nil() => xs
    | intlist_cons(y1, ys2) =>
        if x1 <= y1
          then intlist_cons(x1, merge_ordered(xs2, ys))
          else intlist_cons(y1, merge_ordered(xs, ys2))
        // end of [if]
  )
//
) (* end of [merge_ordered] *)


(* ****** ****** *)

implement
main0 () =
{
val () = println! ("length(xs0) = ", length(xs0))
val () = println! ("length(xs1) = ", length(xs1))
val () = println! ("length(xs2) = ", length(xs2))
val xs_10 = intrange(0, 10)
val () = println! ("xs_10 = ", xs_10)
val () = println! ("length(xs_10) = ", length(xs_10))
val xs_10_10 = append (xs_10, xs_10)
val () = println! ("xs_10_10 = ", xs_10_10)
val () = println! ("length(xs_10_10) = ", length(xs_10_10))
val rxs_10_10 = reverse (xs_10_10)
val () = println! ("rxs_10_10 = ", rxs_10_10)
val () = println! ("length(rxs_10_10) = ", length(rxs_10_10))
//
val xs2_10_10 = merge_ordered(xs_10, xs_10)
val () = println! ("xs2_10_10 = ", xs2_10_10)
//
}

(* ****** ****** *)

(* end of [intlist.dats] *)

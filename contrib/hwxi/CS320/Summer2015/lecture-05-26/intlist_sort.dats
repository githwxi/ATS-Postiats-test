(*
** For lecture-2015-05-26
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
  case xs of
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
fun
insertion_sort : intlist -> intlist

(* ****** ****** *)

extern
fun
insord: (int, intlist) -> intlist
implement
insord(x, xs) =
(
case+ xs of
| intlist_nil() =>
    intlist_cons(x, intlist_nil())
| intlist_cons(x1, xs2) =>
    if x <= x1
      then intlist_cons(x, xs)
      else intlist_cons(x1, insord(x, xs2))
    // end of [if]
) (* end of [insord] *)

implement
insertion_sort (xs) =
(
case+ xs of
| intlist_nil() => intlist_nil()
| intlist_cons(x, xs2) => insord(x, insertion_sort(xs2))
) (* end of [insertion_sort] *)

(* ****** ****** *)

#define nil intlist_nil
#define :: intlist_cons
#define cons intlist_cons

(* ****** ****** *)

implement
main0() =
{
//
val xs = 4 :: 5 :: 1 :: 3 :: 2 :: 9 :: 8 :: 7 :: 6 :: 0 :: nil()
val () = println! ("xs = ", xs)
val xs = insertion_sort(xs)
val () = println! ("xs(sorted) = ", xs)
//
}

(* ****** ****** *)

(* end of [intlist_sort.dats] *)

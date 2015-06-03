(* ****** ****** *)
//
// Author: aren-2015-06-03
//
(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
#include
"share/HATS/atspre_staload_libats_ML.hats"
//
(* ****** ****** *)
//
// Question 1
// Given an integer r, find all the possible pairs such that
// x * x + y * y = r * r
// Hint (Dijkstra 1976)
// Enumerate pair (x, y)
// x goes down from r, y goes up from 0
// if x*x + y*y < r*r, then increment y by 1, and move on
// if x*x + y*y = r*r, then record the tuple, decrement x by 1 and increment y by 1, and move on
// if x*x + y*y > r*r, then decrement x by 1, and move on
// if x < y then stop
//
extern
fun
factor (r: int): list0 '(int, int)
implement factor (r) = let
  fun loop (x: int, y: int, accu: list0 '(int, int)): list0 '(int, int) = let
    val xy = x * x + y * y
    val r2 = r * r
  in
    if x < y then accu
    else if xy < r2 then loop (x, y + 1, accu)
    else if xy = r2 then loop (x - 1, y + 1, cons0{'(int, int)} ('(x, y), accu))
    else loop (x - 1, y, accu)
  end
in
  loop (r, 0, nil0)
end
//
(* ****** ****** *)
//
// Question 2
// Remove all the duplicates in a given list. E.g. the list
// [1, 7, 2, 1, 3, 5, 3] becomes [1, 7, 2, 3, 5] after all
// duplicates are removed.
//
extern
fun
{a:t@ype}
list0_remove_dup
  (xs: list0 a, eq: (a, a) -> bool): list0 a
//
implement
{a}(*tmp*)
list0_remove_dup
  (xs, eq) = let
//
fun
list0_contains
  (x: a, xs: list0 a, eq: (a, a) -> bool): bool =
  case+ xs of
  | cons0 (x0, xs0) => if eq (x, x0) then true else list0_contains (x, xs0, eq)
  | nil0 () => false
//
fun
loop
(
  cur: list0 a, next: list0 a, eq: (a, a) -> bool
) : list0 a =
  case+ next of
  | cons0 (x, next0) =>
    if list0_contains (x, cur, eq)
      then loop (cur, next0, eq) else loop (cons0 (x, cur), next0, eq)
    // end of [if]
  | nil0 () => cur
//
val r = loop (nil0, xs, eq)
//
in
  list0_reverse (r)
end // end of [list0_remove_dup]
//
(* ****** ****** *)
//
// Question 3
// We use list [a0, a2, a3, ..., an] to represent a polynomial 
// a0 + a1 * x + a2 * x**2 + an * x**n
// Please implement the operations for addition and multiplication of two polynomials.
//
extern fun add_poly (xs: list0 int, ys: list0 int): list0 int
extern fun mul_poly (xs: list0 int, ys: list0 int): list0 int
//
(* ****** ****** *)

fun
print_tuple
  (x: '(int, int)): void = () where
{
  val () = print! ("(", x.0, ", ", x.1, ")")
} (* end of [print_tuple] *)

overload print with print_tuple of 20

(* ****** ****** *)

extern
fun{a:t@ype} my_print_ele (x: a): void
extern
fun{a:t@ype} my_print_list (xs: list0 a): void

implement
{a}(*tmp*)
my_print_list (xs) =
(
case+ xs of
| nil0 () => print ("nil")
| cons0 (x, xs) =>
  (
    my_print_ele<a> (x); print " -> "; my_print_list (xs)
  ) (* end of [cons0] *)
) (* end of [my_print_list] *)
//
(* ****** ****** *)

implement my_print_ele<int> (x) = print x
implement my_print_ele<'(int, int)> (x) = print_tuple(x)

(* ****** ****** *)

implement
main0 () =
{
  val r = 10
  val xs = factor (r)
  // val () = println! (xs)

  val () = println! ('(1, 2))
  val () = my_print_list<'(int, int)> (xs)
  val () = println! ()

  val ys = cons0 (1, cons0 (2, cons0 (1, nil0)))
  val () = my_print_list<int> (ys)
  val () = println! ()
  val zs = list0_remove_dup<int> (ys, lam (x, y) => x = y)
  val () = my_print_list<int> (zs)
  val () = println! ()
} (* end of [main0] *)

(* ****** ****** *)

(* end of [quiz-by-aren.dats] *)

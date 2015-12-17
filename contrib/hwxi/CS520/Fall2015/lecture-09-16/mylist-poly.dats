(* ****** ****** *)
//
// Code for lecture-09-16
//
(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
//
(* ****** ****** *)
//
(*
ploymorphic list
*)
//
datatype
mylist(a:t@ype) =
| mylist_nil of ()
  // mylist_nil : () -> mylist(a)
| mylist_cons of (a, mylist(a))
  // mylist_cons : (a, mylist(a)) -> mylist(a)
//
(* ****** ****** *)

extern
fun{a:t@ype} mylist_length : mylist(a) -> int

(* ****** ****** *)

implement
{a}
mylist_length(xs) =
(
case xs of
| mylist_nil() => 0
| mylist_cons(x, xs) => 1 + mylist_length(xs)
)

(* ****** ****** *)

extern
fun{a:t@ype}
mylist_append: (mylist(a), mylist(a)) -> mylist(a)
extern
fun{a:t@ype}
mylist_revappend: (mylist(a), mylist(a)) -> mylist(a)

(* ****** ****** *)

implement
{a}(*tmp*)
mylist_append
  (xs, ys) =
(
case+ xs of
| mylist_nil() => ys
| mylist_cons(x, xs) =>
    mylist_cons(x, mylist_append(xs, ys))
  // end of [mylist_cons]
)

implement
{a}(*tmp*)
mylist_revappend(xs, ys) =
(
case+ xs of
| mylist_nil() => ys
| mylist_cons(x, xs) =>
    mylist_revappend(xs, mylist_cons(x, ys))
  // end of [mylist_cons]
)

(* ****** ****** *)
//
extern
fun{a:t@ype}
mylist_reverse : mylist(a) -> mylist(a)
//
implement
{a}(*tmp*)
mylist_reverse(xs) = mylist_revappend(xs, mylist_nil)
//
(* ****** ****** *)

#define nil mylist_nil
#define cons mylist_cons

(* ****** ****** *)

val xs = cons{int}(1, cons(2, nil()))
val () = assertloc (mylist_length<int> (xs) = 2)

(* ****** ****** *)

val xs = cons{double}(1.0, cons(2.0, nil()))
val () = assertloc (mylist_length<double> (xs) = 2)

(* ****** ****** *)

implement main0 () = ()

(* ****** ****** *)

(* end of [mylist-poly.dats] *)

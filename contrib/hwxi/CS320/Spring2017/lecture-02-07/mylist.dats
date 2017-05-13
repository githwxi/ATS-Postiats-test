(* ****** ****** *)
//
// Code for lecture-02-07
//
(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
//
(* ****** ****** *)
//
// HX:
// Only for integer lists
//
datatype
mylist =
| mylist_nil of ()
| mylist_cons of (int, mylist)
//
(* ****** ****** *)

#define nil mylist_nil
#define :: mylist_cons // infix
#define cons mylist_cons

(* ****** ****** *)

val xs0 = nil()
val xs1 = cons(1, xs0)
val xs2 = 2 :: xs1

(* ****** ****** *)

extern
fun is_nil : mylist -> bool

extern
fun length : mylist -> int

extern
fun append : (mylist, mylist) -> mylist

(* ****** ****** *)

implement
is_nil(xs) =
case xs of
| nil() => true
| cons(_, _) => false

(* ****** ****** *)

implement
length(xs) =
case xs of
| nil() => 0
| cons(_, xs) => 1 + length(xs)

(* ****** ****** *)

implement
append(xs, ys) =
case xs of
| nil() => ys
| cons(x, xs) => cons(x, append(xs, ys))

(* ****** ****** *)

extern
fun reverse : (mylist) -> mylist

(*
//
// HX: it is correct but inefficient!
//
implement
reverse(xs) = // O(n^2)
case xs of
| nil() => nil()
| cons(x, xs) =>
  append(reverse(xs), cons(x, nil()))
*)

(* ****** ****** *)

extern
fun revappend : (mylist, mylist) -> mylist

implement
reverse(xs) = 
revappend(xs, nil()) // O(n)-time

implement
revappend(xs, ys) =
case xs of
| nil() => ys
| cons(x, xs) => revappend(xs, cons(x, ys))

(* ****** ****** *)

implement main0 () =
{
  val () = println! ("Hello from [mylist]!")
}

(* ****** ****** *)

(* end of [mylist.dats] *)

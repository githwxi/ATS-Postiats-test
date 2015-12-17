(* ****** ****** *)
//
// Code for lecture-09-14
//
(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
//
(* ****** ****** *)
//
(*
monomorphic list
*)
//
datatype
mylist =
| mylist_nil of ()
  // mylist_nil : () -> mylist
| mylist_cons of (int, mylist)
  // mylist_cons : (int, mylist) -> mylist
//
(* ****** ****** *)

val xs0 = mylist_nil() // []
val xs1 = mylist_cons (1, xs0) // [1] // singleton
val xs2 = mylist_cons (2, xs1) // [2, 1] // pair

(* ****** ****** *)

extern fun mylist_length : mylist -> int

(* ****** ****** *)

(*
implement
mylist_length(xs) =
(
case xs of
| mylist_nil() => 0
| mylist_cons(x, xs) => 1 + mylist_length(xs)
)
*)

implement
mylist_length(xs) = let
//
fun loop (xs: mylist, n:int): int =
(
case+ xs of
  | mylist_nil() => n
  | mylist_cons(_, xs) => loop(xs, n+1)
)
//
in
  loop(xs, 0)
end // end of [mylist_length]

val () = assertloc (mylist_length(xs2) = 2)

(* ****** ****** *)

extern
fun
mylist_append: (mylist, mylist) -> mylist
extern
fun
mylist_revappend: (mylist, mylist) -> mylist

(* ****** ****** *)

implement
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
fun mylist_reverse : mylist -> mylist
//
implement
mylist_reverse(xs) = mylist_revappend(xs, mylist_nil)
//
(* ****** ****** *)

implement main0 () = ()

(* ****** ****** *)

(* end of [mylist-mono.dats] *)

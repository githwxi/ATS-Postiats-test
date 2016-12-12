(* ****** ****** *)

(*
** Datatype
*)

(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
//
(* ****** ****** *)
//
datatype
intlist =
  | intlist_nil of ()
  | intlist_cons of (int, intlist)
//
#define nil intlist_nil
#define :: intlist_cons
#define cons intlist_cons
//
(* ****** ****** *)
//
fun
intlist_sing
  (x: int): intlist = cons(x, nil())
//
fun
intlist_pair
  (x1: int, x2: int): intlist = x1 :: x2 :: nil()
//
(* ****** ****** *)
//
fun // not tail-recursive
from_to(m: int, n: int): intlist = // [m, n)
  if m < n then m :: from_to(m+1, n) else nil()
//
(* ****** ****** *)
//
// nil(): pattern
// cons(x1, xs2): pattern
//
fun
length(xs: intlist): int =
  case xs of
    | nil() => 0
(*
    | cons(x1, nil()) => 1
*)
    | cons(x1, xs2) => length(xs2) + 1
(*
    | cons(x1, cons(x2, xs3)) => length(xs3) + 2
*)
//
(* ****** ****** *)

(*

list_foldleft // tail-recursive
list_foldright // non-tail-recursive

*)

(* ****** ****** *)
//
extern
fun // higher-order function
intlist_map :
  (intlist, int -> int) -> intlist
//
implement
intlist_map(xs, fopr) =
(
  case+ xs of
  | nil() => nil()
  | cons(x, xs) =>
    cons(fopr(x), intlist_map(xs, fopr))
) (* end of [intlist_map] *)
//
(* ****** ****** *)

implement
main0() =
{
  val () = println! ("Hello from [mylist]!")
} (* end of [main0] *)

(* ****** ****** *)

(* end of [mylist.dats] *)

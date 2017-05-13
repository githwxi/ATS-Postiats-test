(* ****** ****** *)
//
// HX: for introducing datatypes
//
(* ****** ****** *)
//
datatype
mylist =
| mylist_nil of () // mylist_nil : () -> mylist
| mylist_cons of (int, mylist) // mylist_cons : (int, mylist) -> mylist
//
(* ****** ****** *)

val xs0 = mylist_nil() // []
val xs1 = mylist_cons(1, xs0) // [1]
val xs1 = mylist_cons(2, xs1) // [2, 1]
val xs1 = mylist_cons(3, xs1) // [3, 2, 1]

(*
fun
mylist_length(xs: mylist): int =
  if is_empty(xs) then 0 else 1+mylist_length(tail_of(xs))
*)
fun
mylist_length
  (xs: mylist): int =
(
  case xs of
  | mylist_nil() => 0
  | mylist_cons(x, xs_tail) => 1 + mylist_length(xs_tail)
) // end of [mylist_length]

(* ****** ****** *)

(* end of [mylist.dats] *)

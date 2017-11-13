(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
//
(* ****** ****** *)

(*
typedef int2 =
$tup(int, int) // int2 is an alias!
*)

(* ****** ****** *)

datatype mylist =
  | mynil of ()
  | mycons of (int, mylist)

(* ****** ****** *)

val xs0 = mynil() // ()
val xs1 = mycons(1, xs0) // (1)
val xs2 = mycons(2, xs1) // (2, 1)
val xs3 = mycons(3, xs2) // (2, 1)

(* ****** ****** *)

fun
mylist_length(xs: mylist): int =
case xs of
| mynil() => 0
| mycons(x1, xs2) => 1 + mylist_length(xs2)

(* ****** ****** *)

fun
mylist_fromto(m: int, n: int): mylist =
if m >= n
  then mynil()
  else mycons(m, mylist_fromto(m+1, n))
// end of [if]

(* ****** ****** *)

fun
mylist_fromto(m: int, n: int): mylist = let
//
fun
loop(n1: int, res: mylist): mylist =
  if m <= n1 then loop(n1-1, mycons(n1, res)) else res
//
in
  loop(n-1, mynil())
end

(* ****** ****** *)

fun
mylist_append
  (xs: mylist, ys: mylist): mylist =
(
case+ xs of
| mynil() => ys
| mycons(x1, xs2) => mycons(x1, mylist_append(xs2, ys))
)

(* ****** ****** *)

fun
mylist_revappend
  (xs: mylist, ys: mylist): mylist =
(
case+ xs of
| mynil() => ys
| mycons(x1, xs2) => mylist_revappend(xs2, mycons(x1, ys))
)

fun
mylist_reverse
  (xs: mylist): mylist =
  mylist_revappend(xs, mynil())

(* ****** ****** *)

fun
mylist_foreach
  (xs: mylist, do_sth: (int) -> void): void =
(
case+ xs of
| mynil() => ()
| mycons(x1, xs2) => (do_sth(x1); mylist_foreach(xs2, do_sth))
)

(* ****** ****** *)

fun
print_mylist
  (xs: mylist): void =
  mylist_foreach(xs, lam(x) => println!(x))

overload print with print_mylist

(* ****** ****** *)

val () = print! ("xs2:\n", xs2)
val () = print! ("xs2+xs2:\n", mylist_append(xs2, xs2))
val () = print! ("rev(xs2):\n", mylist_reverse(xs2))

val () = print! ("xs3:\n", xs3)
val () = print! ("xs3+xs3:\n", mylist_append(xs3, xs3))
val () = print! ("rev(xs3):\n", mylist_reverse(xs3))

(* ****** ****** *)

implement main0() = ()

(* ****** ****** *)

(* end of [mylist.dats] *)

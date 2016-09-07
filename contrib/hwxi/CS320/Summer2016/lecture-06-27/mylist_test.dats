(* ****** ****** *)
//
// Testing some list functions
//
(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
#include
"share/HATS/atspre_staload_libats_ML.hats"
//
(* ****** ****** *)

staload "./../mylib/mylist.dats"

(* ****** ****** *)

#define N 10000

val xs = list0_make_intrange(0, N)
val ys = mylist_reverse<int>(xs)
val xsys = mylist_append<int>(xs, ys)

(* ****** ****** *)

fun{a:t@ype}
mylist_reverse_slow
  (xs: list0(a)): list0(a) =
(
case+ xs of
| list0_nil() => list0_nil()
| list0_cons(x, xs) => mylist_append(mylist_reverse_slow(xs), list0_sing(x))
)

(* ****** ****** *)

val () = println! ("length(xs) = ", mylist_length(xs))
val () = println! ("length(ys) = ", mylist_length(ys))
val () = println! ("length(xsxs) = ", mylist_length(xsys))

(* ****** ****** *)

val zs = mylist_reverse_slow<int>(xs)
val () = println! ("length(zs) = ", mylist_length(zs))

(* ****** ****** *)

implement main0 () = ()

(* ****** ****** *)

(* end of [mylist_test.dats] *)

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

#define N 2000000

(* ****** ****** *)

val xs = list0_make_intrange(0, N)
val () = println! ("length(xs) = ", mylist_length(xs))

(* ****** ****** *)

val ys = list0_mergesort<int>(xs, lam(x, y) => compare(x, y))
val () = println! ("length(ys) = ", mylist_length(ys))

(* ****** ****** *)

implement main0 () = ()

(* ****** ****** *)

(* end of [mylist_test2.dats] *)

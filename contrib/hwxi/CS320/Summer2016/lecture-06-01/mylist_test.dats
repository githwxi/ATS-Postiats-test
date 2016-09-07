(* ****** ****** *)

#include
"share/atspre_staload.hats"
#include
"share/HATS/atspre_staload_libats_ML.hats"

(* ****** ****** *)

staload "./../mylib/mylist.dats"

(* ****** ****** *)

implement
main0() =
{
  val xs = g0ofg1($list{int}(0, 1, 2, 3, 4, 5, 6, 7, 8, 9))
  val () = mylist_foreach_cloref<int>(xs, lam(x) => println! (x))
}

(* ****** ****** *)

(* end of [mylist_test.dats] *)

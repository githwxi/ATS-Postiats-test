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
  val () = mylist_foreach_cloref<int>(xs, lam(x) => print!(x, " "))
  val () = print_newline()
  val ys = mylist_map_cloref<int,int>(xs, lam(x) => x * x)
  val () = mylist_foreach_cloref<int>(ys, lam(x) => print!(x, " "))
  val () = print_newline()
(*
  val xs2 = list0_make_intrange(0, 1000000)
  val ys2 = mylist_map_cloref<int,int>(xs2, lam(x) => x * x)
*)
  val () = println! ("Good news!")
}

(* ****** ****** *)

(* end of [mylist_test.dats] *)

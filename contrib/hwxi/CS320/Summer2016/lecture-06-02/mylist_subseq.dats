(* ****** ****** *)
//
// HX-2016-06:
// mylist_subseq returns
// all the subsequences of a given one
//
(* ****** ****** *)

#include
"share/atspre_staload.hats"
#include
"share/HATS/atspre_staload_libats_ML.hats"

(* ****** ****** *)

staload "./../mylib/mylist.dats"

(* ****** ****** *)
//
extern
fun
{a:t@ype}
mylist_subseq
  (xs: list0(a)): list0(list0(a))
//
implement
{a}
mylist_subseq(xs) = let
//
fun
aux
(
  xs: list0(a)
) : list0(list0(a)) =
  case xs of
  | list0_nil() =>
      list0_sing(list0_nil)
  | list0_cons(x, xs) => let
      val res1 = aux(xs)
      val res2 = mylist_mcons(res1, x)
    in
      mylist_append(res1, res2)
    end
in
  aux(xs)
end
//
(* ****** ****** *)

implement
main0() =
{
//
  val xs =
    list0_make_intrange(0, 10)
  // end of [val]
//
  val xss = mylist_subseq<int>(xs)
//
  val () =
    println! ("length(xss) = ", length(xss))
  // end of [val]
//
  val () = assertloc(length(xss) = 1024)
  val () = println! ("The code has passed testing!")
//
}

(* ****** ****** *)

(* end of [mylist_subseq.dats] *)

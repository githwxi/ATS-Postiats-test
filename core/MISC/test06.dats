(*
** HX-2015-08-07:
** Based on one by deech
*)

(* ****** ****** *)
//
// How to compile and test: 
// patscc -DATS_MEMALLOC_LIBC -o test06 test06.dats && ./test06
//
(* ****** ****** *)

#include "share/atspre_staload.hats"

(* ****** ****** *)

fun
{a:t@ype}
list_vt_filter
  {n: int}
(
  l: !list_vt (a, n), f: a -> bool
) : listLte_vt (a, n) =
(
  case+ l of
  | list_vt_nil() => list_vt_nil()
  | list_vt_cons (x, xs) when f (x) =>
      list_vt_cons (x, list_vt_filter(xs,f))
  | list_vt_cons (x, xs) => list_vt_filter (xs, f)
)

implement
main0() = {
  val a = list_make_intrange(0,10)
  val b = list_vt_filter<int>(a, lam(x) => x mod 2 = 0)
  val () = println! ("a = ", a)
  val () = println! ("b = ", b)
  val () = list_vt_free(a) and () = list_vt_free(b)
}

(* ****** ****** *)

(* end of [test06.dats] *)

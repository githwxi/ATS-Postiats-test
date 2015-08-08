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

(* ****** ****** *)
//
// HX-2015-08-07:
// A tail-recursive version
// for the reference purpose:
//
fun
{a:t@ype}
list_vt_filter
  {n:nat}
(
  l: !list_vt (a, n), f: a -> bool
) : listLte_vt (a, n) = let
//
fun
loop{n:nat}
(
  l: !list_vt(a, n)
, res: &ptr? >> listLte_vt(a, n)
) : void =
(
  case+ l of
  | list_vt_nil() =>
      res := list_vt_nil()
  | list_vt_cons(x, xs) =>
    if f (x)
      then let
        val () =
        res :=
          list_vt_cons{a}{0}(x, _)
        // end of [val]
        val+
        list_vt_cons(_, res1) = res
      in
        loop (xs, res1); fold@ (res)
      end // end of [then]
      else loop (xs, res)
    // end of [if]
)
//
var res: ptr
//
in
  loop(l, res); res
end // end of [list_vt_filter]
//
(* ****** ****** *)

implement
main0() = {
  val a = list_make_intrange(0,10)
  val b = list_vt_filter<int>(a, lam(x) => x mod 2 = 0)
  val () = println! ("a = ", a)
  val () = println! ("b = ", b)
  val () = list_vt_free(a) and () = list_vt_free(b)
} (* end of [main0] *)

(* ****** ****** *)

(* end of [test06.dats] *)

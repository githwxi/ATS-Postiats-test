(* ****** ****** *)

#include
"share/atspre_staload.hats"
#include
"share/HATS/atspre_staload_libats_ML.hats"

(* ****** ****** *)

extern
fun
{a:t@ype}
mylist0_exists_cloref
(
xs: list0(a), test: (a) -<cloref1> bool
) : bool

implement
{a}(*tmp*)
mylist0_exists_cloref
  (xs, test) =
  loop(xs) where
{
//
fun
loop(xs: list0(a)): bool =
  case+ xs of
  | list0_nil() => false
  | list0_cons(x, xs) =>
      if test(x) then true else loop(xs)
    // end of [list0_cons]
}

(* ****** ****** *)

(* end of [list0_exists] *)

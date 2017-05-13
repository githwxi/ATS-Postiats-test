(* ****** ****** *)

#include
"share/atspre_staload.hats"
#include
"share/HATS/atspre_staload_libats_ML.hats"

(* ****** ****** *)

extern
fun
{a:t@ype}
mylist0_find_cloref
(
xs: list0(a), test: (a) -<cloref1> bool
) : Option(a)

implement
{a}(*tmp*)
mylist0_find_cloref
  (xs, test) =
  loop(xs) where
{
//
fun
loop(xs: list0(a)): Option(a) =
  case+ xs of
  | list0_nil() => None()
  | list0_cons(x, xs) =>
      if test(x) then Some(x) else loop(xs)
    // end of [list0_cons]
}    

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
  (xs, test) = let
  val opt = mylist0_find_cloref<a>(xs, test)
in
  case+ opt of
  | Some _ => true
  | None _ => false
end // end of [mylist0_exists_cloref]

(* ****** ****** *)

(* end of [list0_find_opt.dats] *)

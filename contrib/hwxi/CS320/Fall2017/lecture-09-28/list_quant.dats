(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
#include
"share/atspre_staload_libats_ML.hats"
//
(* ****** ****** *)

extern
fun
{a:t@ype}
list0_exists
(
  xs: list0(a), test: (a) -<cloref1> bool
) : bool // list0_exists

(* ****** ****** *)

implement
{a}
list0_exists
  (xs, test) =
(
case+ xs of
| list0_nil() => false
| list0_cons(x, xs) => test(x) || list0_exists<a>(xs, test)
)

(* ****** ****** *)

extern
fun
{a:t@ype}
list0_forall
(
  xs: list0(a), test: (a) -<cloref1> bool
) : bool // list0_forall

(* ****** ****** *)

implement
{a}
list0_forall
  (xs, test) =
(
case+ xs of
| list0_nil() => true
| list0_cons(x, xs) => test(x) && list0_forall<a>(xs, test)
)

(* ****** ****** *)

implement main0() = ()

(* ****** ****** *)

(* end of [list_quant.dats] *)

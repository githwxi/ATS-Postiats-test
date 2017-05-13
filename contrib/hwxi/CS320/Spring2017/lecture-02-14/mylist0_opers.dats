(* ****** ****** *)
(*
** Operations on list0-values
*)
(* ****** ****** *)

#include
"share/atspre_staload.hats"
#include
"share/HATS/atspre_staload_libats_ML.hats"

(* ****** ****** *)

(*
datatype
list0(a:t@ype) =
  | list0_nil of ()
  | list0_cons of (a, list0(a))
*)

(* ****** ****** *)

(*
extern
fun
{a:t@ype}
{b:t@ype}
list0_map_cloref(xs: list0(a), fopr: (a) -<cloref1> b): list0(b)

(*
implement
{a}{b}
list0_map_cloref
  (xs, fopr) =
(
case+ xs of
| list0_nil() => list0_nil()
| list0_cons(x, xs) => list0_cons(fopr(x), list0_map_cloref<a><b>(xs, fopr))
)
*)

implement
{a}{b}
list0_map_cloref
  (xs, fopr) = aux(xs) where
{  
//
fun aux(xs: list0(a)): list0(b) =
(
case+ xs of
| list0_nil() => list0_nil()
| list0_cons(x, xs) => list0_cons(fopr(x), aux(xs))
)
} (* end of [list0_map_cloref] *)
*)

(* ****** ****** *)

(*
extern
fun
{a:t@ype}
list0_filter_cloref(xs: list0(a), test: (a) -<cloref1> bool): list0(a)

implement
{a}(*tmp*)
list0_filter_cloref
  (xs, test) = aux(xs) where
{  
//
fun aux(xs: list0(a)): list0(a) =
(
case+ xs of
| list0_nil() => list0_nil()
| list0_cons(x, xs) => if test(x) then list0_cons(x, aux(xs)) else aux(xs)
)
} (* end of [list0_filter_cloref] *)
*)

(* ****** ****** *)

val xs =
g0ofg1($list{int}(0, 1, 2, 3, 4))
//
val () = println! ("xs = ", xs)
//
val xs2 =
list0_map<int><int>(xs, lam x => 2*x)
(*
//
// HX: dot-notation:
//
val xs2 = xs.map(TYPE{int})(lam x => 2 * x)
//
*)
//
val () = println! ("xs2 = ", xs2)
//
(* ****** ****** *)
//
val ys2 =
list0_filter<int>(xs2, lam x => x <= 4)
//
(*
//
// HX: dot-notation:
//
val ys2 = xs2.filter()(lam x => x <= 4)
//
*)
//
val () = println! ("ys2 = ", ys2)
//
(* ****** ****** *)

implement main0 () = ()

(* ****** ****** *)

(* end of [list0.dats] *)

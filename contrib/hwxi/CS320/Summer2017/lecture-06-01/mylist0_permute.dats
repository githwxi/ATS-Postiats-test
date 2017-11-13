(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
#include
"share/HATS\
/atspre_staload_libats_ML.hats"
//
(* ****** ****** *)
//
extern
fun
{a:t@ype}
mylist0_permute
  (xs: list0(a)): list0(list0(a))
//
(* ****** ****** *)
//
extern
fun
{a:t@ype}
mylist0_insert_all
  (x0: a, xs: list0(a)): list0(list0(a))
//
implement
{a}
mylist0_insert_all(x0, xs) =
(
case+ xs of
| list0_nil() =>
  list0_cons(list0_sing(x0), list0_nil)
| list0_cons(x1, xs2) =>
  list0_cons
  (
    list0_cons(x0, xs)
  , list0_map<list0(a)><list0(a)>
      (mylist0_insert_all<a>(x0, xs2), lam xs => list0_cons{a}(x1, xs))
  )
)
//
(* ****** ****** *)

implement
{a}
mylist0_permute
  (xs) =
(
case+ xs of
| list0_nil() =>
  list0_sing(list0_nil)
| list0_cons(x0, xs1) => let
    val xss1 = mylist0_permute<a>(xs1)
  in
    list0_concat<list0(a)>
    (
      list0_map<list0(a)><list0(list0(a))>
        (xss1, lam xs1 => mylist0_insert_all<a>(x0, xs1))
    )
  end
)

(* ****** ****** *)

val xs =
g0ofg1($list{int}(1,2,3,4,5))
val xss = mylist0_permute<int>(xs)
val ((*void*)) = xss.foreach()(lam(xs) => println! xs)
val ((*void*)) = println! ("|xss| = ", length(xss))

(* ****** ****** *)

implement main0 () = ()

(* ****** ****** *)

(* end of [mylist0_permute.dats] *)

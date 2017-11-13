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
mylist0_append
  (list0(a), list0(a)): list0(a)
//
extern
fun
{a:t@ype}
mylist0_concat
  (list0(list0(a))): list0(a)
//
implement
{a}
mylist0_concat(xss) =
(
case+ xss of
| list0_nil() =>
  list0_nil()
| list0_cons(xs, xss) =>
  list0_append<a>(xs, mylist0_concat<a>(xss))
)

extern
fun
{a:t@ype}
mylist0_tabulate
  (n: int, fopr: (int) -<cloref1> a): list0(a)
//
implement
{a}
mylist0_tabulate
  (n, fopr) = let
//
fun aux(i: int): list0(a) =
if i < n
  then list0_cons(fopr(i), aux(i+1)) else list0_nil()
//
in
  aux(0)
end // end of [mylist0_tabulate]

(* ****** ****** *)
//
extern
fun
{a:t@ype}
mylist0_filter
  (xs: list0(a), test: (a) -<cloref1> bool): list0(a)
//
implement
{a}
mylist0_filter
  (xs, test) =
(
case+ xs of
| list0_nil() => list0_nil()
| list0_cons(x, xs) =>
    if not(test(x))
      then mylist0_filter<a>(xs, test)
      else list0_cons(x, mylist0_filter<a>(xs, test))
    // end of [if]

)
//
(* ****** ****** *)

val xss = mylist0_tabulate<list0(int)>(100, lam(x) => list0_cons(x, list0_nil))

val () = (xss).foreach()(lam(xs) => println! ("(", xs, ")"))

val xss2 = list0_append<list0(int)>(xss, xss)

val flattened = mylist0_concat<int>(xss2)
val () = println! ("flattened = ", flattened)

(*
val flattened_filtered = mylist0_filter<int>(flattened, lam(x) => x >= 90)
*)
val flattened_filtered = flattened.filter()(lam(x) => x >= 90)


val () = println! ("flattened_filtered = ", flattened_filtered)

(* ****** ****** *)

implement main0 () = ()

(* ****** ****** *)

(* end of [mylist0_funs.dats] *)

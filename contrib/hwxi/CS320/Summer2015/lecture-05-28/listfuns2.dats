//
#include
"share/atspre_staload.hats"
//
#include
"share/HATS/atspre_staload_libats_ML.hats"
//
(* ****** ****** *)
//
extern
fun
{a,b:t@ype}
list0_foldl
  (xs: list0(a), init: b, f: (b, a) -> b): b
//
(* ****** ****** *)
//
// HX: list0_foldl is tail-recursive!
//
implement
{a,b}(*tmp*)
list0_foldl(xs, init, f) =
case+ xs of
| nil0 () => init
| cons0 (x, xs) => list0_foldl(xs, f (init, x), f)
//
(* ****** ****** *)

//
extern
fun
{a,b:t@ype}
list0_foldr
  (xs: list0(a), f: (a, b) -> b, sink: b): b
//
(* ****** ****** *)

implement
{a,b}
list0_foldr(xs, f, sink) =
case+ xs of
| nil0 () => sink
| cons0 (x, xs) => f (x, list0_foldr(xs, f, sink))

(* ****** ****** *)

extern
fun list0_sum (xs: list0(int)): int

(* ****** ****** *)

implement
list0_sum(xs) = list0_foldl<int,int>(xs, 0, lam(x, y) => x + y)

(* ****** ****** *)

extern
fun list0_mul (xs: list0(int)): int

(* ****** ****** *)

implement
list0_mul(xs) = list0_foldr<int,int>(xs, lam(x, y) => x * y, 1)

(* ****** ****** *)

extern
fun{a:t@ype}
mylist_length : (list0(a)) -> int

implement
{a}(*tmp*)
mylist_length(xs) =
  list0_foldl<a,int>(xs, 0, lam(res, x) => res+1)

(* ****** ****** *)

extern
fun{a:t@ype}
mylist_append : (list0(a), list0(a)) -> list0(a)

implement
{a}(*tmp*)
mylist_append(xs, ys) =
  list0_foldr<a,list0(a)>(xs, lam(x, res) => cons0 (x, res), ys)

(* ****** ****** *)

extern
fun{a:t@ype}
mylist_revappend : (list0(a), list0(a)) -> list0(a)

implement
{a}(*tmp*)
mylist_revappend(xs, ys) =
  list0_foldl<a,list0(a)>(xs, ys, lam(res, x) => cons0 (x, res))

(* ****** ****** *)

val
xs_10 =
list0_make_intrange(1, 11) // 1,2,3,...,9,10

(* ****** ****** *)

val () =
println!("list0_sum(", xs_10, ") = ", list0_sum(xs_10))
val () =
println!("list0_mul(", xs_10, ") = ", list0_mul(xs_10))

(* ****** ****** *)

val xs_10_10 = mylist_append<int>(xs_10, xs_10)
val () = println! ("append(xs_10, xs_10) = ", xs_10_10)

(* ****** ****** *)

implement main0 () = ()

(* ****** ****** *)

(* end of [listfuns2.dats] *)

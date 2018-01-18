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
{
res:t@ype
}{a:t@ype}
list0_ifoldleft
(
  xs: list0(a), init: res, fopr: cfun(res, int, a, res)
) : res // list0_ifoldleft

(* ****** ****** *)

implement
{res}{a}
list0_ifoldleft
(
  xs, init, fopr
) = loop(init, 0, xs) where
{
//
fun
loop(r0: res, i: int, xs: list0(a)): res=
(
case+ xs of
| list0_nil() => r0
| list0_cons(x, xs) => loop(fopr(r0, i, x), i+1, xs)
)
}

(* ****** ****** *)

extern
fun
{a:t@ype}
{res:t@ype}
list0_ifoldright
(
  xs: list0(a), fopr: cfun(int, a, res, res), sink: res
) : res // list0_ifoldright

(* ****** ****** *)

implement
{a}
{res}
list0_ifoldright
(
  xs, fopr, sink
) = aux(0, xs) where
{
//
fun aux(i: int, xs: list0(a)): res=
(
case+ xs of
| list0_nil() => sink
| list0_cons(x, xs) => fopr(i, x, aux(i+1, xs))
)
}

(* ****** ****** *)
//
fun
print_intlist
(xs: list0(int)): void =
ignoret
(
list0_ifoldleft<int><int>
(xs, 0, lam(res, i, x) => (if i > 0 then print ", "; print(x); 0))
)
//
(* ****** ****** *)

val xs = g0ofg1($list{int}(1,2,3,4,5))
val () = (print("xs = "); print_intlist(xs); print_newline())

(* ****** ****** *)

implement main0() = ()

(* ****** ****** *)

(* end of [list_ifold.dats] *)

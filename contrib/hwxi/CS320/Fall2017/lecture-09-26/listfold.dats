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
list0_foldleft
(
  xs: list0(a), init: res, fopr: cfun(res, a, res)
) : res // list0_foldleft

(* ****** ****** *)

implement
{res}{a}
list0_foldleft
(
  xs, init, fopr
) = loop(init, xs) where
{
//
fun
loop(r0: res, xs: list0(a)): res=
(
case+ xs of
| list0_nil() => r0
| list0_cons(x, xs) => loop(fopr(r0, x), xs)
)
}

(* ****** ****** *)

extern
fun
{a:t@ype}
{res:t@ype}
list0_foldright
(
  xs: list0(a), fopr: cfun(a, res, res), sink: res
) : res // list0_foldright

(* ****** ****** *)

implement
{a}
{res}
list0_foldright
(
  xs, fopr, sink
) = aux(xs) where
{
//
fun aux(xs: list0(a)): res=
(
case+ xs of
| list0_nil() => sink
| list0_cons(x, xs) => fopr(x, aux(xs))
)
}

(* ****** ****** *)

implement
{a}
list0_append(xs, ys) =
$effmask_all
(
list0_foldright<a><list0(a)>
  (xs, lam(x, res) => list0_cons(x, res), ys)
)

(* ****** ****** *)

implement
{a}
list0_reverse(xs) =
$effmask_all
(
list0_foldleft<list0(a)><a>
  (xs, list0_nil, lam(res, x) => list0_cons(x, res))
)
(* ****** ****** *)

(*
/
list0_reverse(poor style!!!):
list0_foldright<a><list0(a)>
  (xs, lam(x, res) => list0_extend<a>(res, x), list0_nil)
//
*)

(* ****** ****** *)

implement main0() = ()

(* ****** ****** *)

(* end of [listfold.dats] *)

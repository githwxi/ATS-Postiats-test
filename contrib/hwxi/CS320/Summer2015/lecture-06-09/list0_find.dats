//
#include
"share/atspre_staload.hats"
//
#include
"share/HATS/atspre_staload_libats_ML.hats"
//
(* ****** ****** *)

extern
fun
{a:t@ype}
list0_find (list0(a), pred: a -<cloref1> bool): int

(* ****** ****** *)

(*
implement
{a}(*tmp*)
list0_find (xs, pred) = let
//
fun
loop(xs: list0(a), i: int): int =
(
case+ xs of
| list0_nil() => ~1
| list0_cons(x, xs) =>
    if pred(x) then i else loop(xs, i+1)
  // end of [list0_cons]
)
in
  loop(xs, 0)
end // end of [list0_find]
*)

(* ****** ****** *)

(*
fun{
a:t0p}{res:t0p
} list0_foldleft
  (xs: list0(INV(a)), ini: res, fopr: cfun2(res, a, res)): res
*)

implement
{a}(*tmp*)
list0_find
  (xs, pred) = let
//
exception Found of (int)
//
fun neg1 (x: int): int = ~1
//
in
//
try
//
neg1(
list0_foldleft<int><a>
(
  xs, 0(*ini*)
, lam(res, x) => if pred(x) then $raise Found(res) else res+1
)
)
//
with
| ~Found(res) => res
//
end // end of [list0_find]

(* ****** ****** *)

extern
fun
{a:t@ype}
list0_find_eq(list0(a), x0: a, eq: (a, a) -<cloref1> bool): int

(* ****** ****** *)

implement
{a}(*tmp*)
list0_find_eq(xs, x0, eq) = list0_find<a> (xs, lam (x) => eq(x0, x))  
  
(* ****** ****** *)

val xs = (100).list_map(TYPE{int})(lam x => x*x)
val ans = list0_find_eq<int>(xs, 71 * 71, lam(x, y) => x = y)

(* ****** ****** *)

val () = println! ("ans = ", ans)

(* ****** ****** *)

implement main0 () = ()

(* ****** ****** *)

(* end of [list0_find.dats] *)

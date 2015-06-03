(* ****** ****** *)
//
// Author: HX-2015-06-03
//
(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
#include
"share/HATS/atspre_staload_libats_ML.hats"
//
(* ****** ****** *)

extern
fun
int2digits(int): list0(int)

(* ****** ****** *)

extern
fun
digits2int(list0(int)): int

(* ****** ****** *)

extern
fun
{a:t0ype}
list0_remdup(xs: list0(a), eq: (a, a) -> bool): list0(a)

(* ****** ****** *)
//
implement
int2digits(x) = let
//
fun
loop(x: int, res: list0(int)): list0(int) =
  if x = 0 then res else loop(x/10, list0_cons(x%10, res))
//
val res = loop(x, list0_nil)
//
in
  case+ res of
  | list0_nil _ => list0_sing(0) | _ => res
end // end of [int2digits]
//
implement
digits2int(xs) =
  list0_foldleft<int><int>(xs, 0, lam(res, x) => 10 * res + x)
//
(* ****** ****** *)

implement
{a}(*tmp*)
list0_remdup(xs, eq) = let
//
fun
rem_one
(
  xs: list0(a), x0: a
) : list0(a) = list0_filter(xs, lam(x) => ~eq(x0, x))
//

in
//
case+ xs of
| list0_nil() => list0_nil()
| list0_cons(x1, xs2) => list0_cons(x1, list0_remdup(rem_one(xs2, x1), eq))
//
end // end of [list0_remdup]

(* ****** ****** *)

implement
main0 () =
{
//
val x0 = 123456789
val () = assert(digits2int(int2digits(x0)) = x0)
//
#define :: cons0
//
val xs = 1 :: 2 :: 3 :: 1 :: 4 :: 3 :: nil0{int}()
val xs2 = list0_remdup<int>(xs, lam (x1, x2) => x1 = x2)
//
val () = fprintln! (stdout_ref, "xs2 = ", xs2)
//
} (* end of [main0] *)

(* ****** ****** *)

(* end of [quiz-by-hwxi.dats] *)

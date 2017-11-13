(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
#include
"share/HATS/\
atspre_staload_libats_ML.hats"
//
(* ****** ****** *)
(*
The following type is already
available in libats/ML/SATS/basis.sats
*)

(*
datatype
list0(a:t0ype) =
| list0_nil of ()
| list0_cons of (a, list0(a))
*)

(* ****** ****** *)

extern
fun
{a:t@ype}
mylist0_length(xs: list0(a)): int

implement
{a}
mylist0_length(xs) = let
//
fun
aux(xs: list0(a)): int =
case xs of
| list0_nil() => 0
| list0_cons(x1, xs2) => 1 + aux(xs2)
//
in
  aux(xs)
end // end of [mylist0_length]

(* ****** ****** *)

extern
fun
{a:t@ype}
mylist0_get_at(xs: list0(a), n: int): a

(* ****** ****** *)

implement
{a}
mylist0_get_at
  (xs, n) =
(
case- xs of
(*
| list0_nil() => ...
*)
| list0_cons(x, xs) =>
  if n = 0 then x else mylist0_get_at<a>(xs, n-1)
)

(* ****** ****** *)

(*
datatype
option0(a:t@ype) =
  | Some0 of (a) | None0 of ()
*)

(* ****** ****** *)

extern
fun
{a:t@ype}
mylist0_get_at_opt(xs: list0(a), n: int): option0(a)

implement
{a}
mylist0_get_at_opt
  (xs, n) =
(
case xs of
| list0_nil() => None0()
| list0_cons(x, xs) =>
  if n = 0
    then Some0(x)
    else mylist0_get_at_opt<a>(xs, n-1)
  // end of [if]
)

(* ****** ****** *)
//
extern
fun
{a:t@ype}
{b:t@ype}
mylist0_map
  (xs: list0(a), fopr: (a) -<cloref1> b): list0(b)
//
implement
{a}{b}
mylist0_map
  (xs, fopr) =
(
case+ xs of
| list0_nil() => list0_nil()
| list0_cons(x, xs) => list0_cons(fopr(x), mylist0_map<a><b>(xs, fopr))
)
//
(* ****** ****** *)

#define :: list0_cons

(* ****** ****** *)

val xs =
(
1 :: 2 :: 3 :: nil0()
) : list0(int)

val ys = mylist0_map<int><double>(xs, lam (x) => 2.0 * x)

val () = println! ("xs = ", xs)
val () = println! ("ys = ", ys)

val
xs2 =
g0ofg1($list{int}
(
0, 1, 2, 3, 4, 5, 6, 7, 8, 9,
10, 11, 12, 13, 14, 15, 16, 17, 18, 19
)
)

val ys2 = mylist0_map<int><int>(xs2, lam (x) => x * x)

val () = println! ("xs2 = ", xs2)
val () = println! ("ys2 = ", ys2)

(* ****** ****** *)

implement main0 () = ((*void*))

(* ****** ****** *)

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
list0_foldl
  (xs: list0(int), init: int, f: (int, int) -> int): int
//
(* ****** ****** *)
//
// HX: list0_foldl is tail-recursive!
//
implement
list0_foldl(xs, init, f) =
case+ xs of
| nil0 () => init
| cons0 (x, xs) => list0_foldl(xs, f (init, x), f)

(* ****** ****** *)
//
extern
fun
list0_foldr
  (xs: list0(int), f: (int, int) -> int, sink: int): int
//
(* ****** ****** *)

implement
list0_foldr(xs, f, sink) =
case+ xs of
| nil0 () => sink
| cons0 (x, xs) => f (x, list0_foldr(xs, f, sink))

(* ****** ****** *)

extern
fun list0_sum (xs: list0(int)): int

(* ****** ****** *)

(*
implement
list0_sum(xs) =
case+ xs of
| nil0 () => 0
| cons0 (x, xs) => x + list0_sum(xs)
*)
implement
list0_sum(xs) = list0_foldl(xs, 0, lam(x, y) => x + y)

(* ****** ****** *)

extern
fun
list0_sub (xs: list0(int)): int
implement
list0_sub(xs) = list0_foldr(xs, lam(x, y) => x - y, 0)

(* ****** ****** *)

extern
fun list0_mul (xs: list0(int)): int

(* ****** ****** *)

(*
implement
list0_mul(xs) =
case+ xs of
| nil0 () => 1
| cons0 (x, xs) => x * list0_mul(xs)
*)
implement
list0_mul(xs) =
  list0_foldr(xs, lam (x, y) => x * y, 1)

(* ****** ****** *)

extern
fun list0_print(xs: list0(int)): void

(* ****** ****** *)

implement
list0_print(xs) =
  ignoret(list0_foldl(xs, 0, lam(_, x) => (print(x); 0)))

(* ****** ****** *)

val xs_10 = list0_make_intrange(1, 11) // 1,2,3,...,9,10

(* ****** ****** *)

val () =
println!("list0_sum(", xs_10, ") = ", list0_sum(xs_10))
val () =
println!("list0_mul(", xs_10, ") = ", list0_mul(xs_10))

(* ****** ****** *)

val () =
println!("list0_sub(", xs_10, ") = ", list0_sub(xs_10))

(* ****** ****** *)

val () = list0_print(xs_10)
val () = print_newline()

(* ****** ****** *)

implement main0 () = ()

(* ****** ****** *)

(* end of [listfuns.dats] *)

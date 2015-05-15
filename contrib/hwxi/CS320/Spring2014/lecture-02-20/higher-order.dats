(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
#include
"share/HATS/atspre_staload_libats_ML.hats"
//
(* ****** ****** *)

typedef intlist = list0 (int)

(* ****** ****** *)
//
extern
fun intlist_foldleft
  (xs: intlist, f: (int, int) -> int, init: int): int
//
(* ****** ****** *)

implement
intlist_foldleft (xs, f, init) =
(
case+ xs of
| nil0 () => init
| cons0 (x, xs) => intlist_foldleft (xs, f, f (init, x))
)

(* ****** ****** *)

fun intlist_sum (xs: intlist): int =
  intlist_foldleft (xs, lam (x, y) => x + y, 0)
  
fun intlist_prod (xs: intlist): int =
  intlist_foldleft (xs, lam (x, y) => x * y, 1)
  
fun fact (x: int) = intlist_prod (list0_make_intrange (1, x+1))
  
(* ****** ****** *)

val xs = list0_make_intrange (0, 10)

val () = println! ("intlist_sum(", xs, ") = ", intlist_sum(xs))

val () = println! ("fact(10) = ", fact(10))

(* ****** ****** *)

implement main0 () = ()

(* ****** ****** *)

(* end of [higher-order.dats] *)

(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
//
(* ****** ****** *)

fn mysquare(x: int): int = x * x

val mysquare = lam(x: int): int => x * x 

(* ****** ****** *)

fn once(f: int -> int, x: int): int = f(x)
fn twice(f: int -> int, x: int): int = f(f(x))
fn thrice(f: int -> int, x: int): int = f(f(f(x)))

(* ****** ****** *)

implement main0() = ()

(* ****** ****** *)

(* end of [higher-order.dats] *)

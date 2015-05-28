(*
** uint as pattern
*)

(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
//
(* ****** ****** *)

static
fun
fib (n: uint): uint
implement
fib(n) =
(
case+ n of
| 0u => 0U
| 1u => 1U
| _ (* >= 2 *) =>> fib(n-2u) + fib(n-1u)
)

(* ****** ****** *)

implement main0() = assertloc (fib(10u) = 55U)

(* ****** ****** *)

(* end of [test10.dats] *)

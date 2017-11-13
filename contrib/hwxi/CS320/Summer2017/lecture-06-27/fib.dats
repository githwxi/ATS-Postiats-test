(* ****** ****** *)

#include
"share/atspre_staload.hats"
#include
"share/HATS/atspre_staload_libats_ML.hats"

(* ****** ****** *)

fun fib(n: int): int =
  if n >= 2 then fib(n-1) + fib(n-2) else n

(* ****** ****** *)

implement
main0() =
{
//
val () = println! ("fib(10) = ", fib(10))
//
(*
val () = println! ("fib(100) = ", fib(100))
*)
//
} (* end of [main0] *)

(* ****** ****** *)

(* end of [fib.dats] *)

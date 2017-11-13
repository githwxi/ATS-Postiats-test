(* ****** ****** *)

#include
"share/atspre_staload.hats"

(* ****** ****** *)

extern
fun
for_loop(n: int, do_sth: (int) -> void): void

(* ****** ****** *)

implement
for_loop(n, do_sth) =
  loop(0) where
{
  fun loop(i: int): void =
    if i < n then (do_sth(i); loop(i+1)) // else ()
} (* end of [for_loop] *)

(* ****** ****** *)

implement
main0() =
for_loop(100, do_sth) where
{
  fun fact(i: int): int =
    if i <= 0 then 1 else i * fact(i-1)
  fun do_sth(i: int): void = println! (i, " -> ", fact(i))
}

(* ****** ****** *)

(* end of [for_loop.dats] *)

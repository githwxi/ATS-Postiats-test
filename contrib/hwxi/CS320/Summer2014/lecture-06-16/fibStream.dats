(* ****** ****** *)

#include
"share/atspre_staload.hats"

(* ****** ****** *)

(*
fun fib (n: int): int =
  if n >= 2 then fib(n-1) + fib(n-2) else n
*)

(* ****** ****** *)

(*
val
rec
fib: int -> int =
  lam (n) => if n >= 2 then fib(n-1) + fib(n-2) else n
*)

(* ****** ****** *)

(*
extern
fun fib (n: int): int
implement
fib (n) = if n >= 2 then fib(n-1) + fib(n-2) else n
*)

(* ****** ****** *)

val
rec
theFibs_0: stream(int) = $delay (stream_cons (0, theFibs_1))

and
theFibs_1: stream(int) = $delay (stream_cons (1, theFibs_2))

and
theFibs_2: stream(int) =
stream_map2_fun<int,int><int> (theFibs_0, theFibs_1, lam (x, y) => x + y)

(* ****** ****** *)

implement
main0 () =
{
//
val N = 10
val N2 = 20
//
val () = println! ("fib(", N, ") = ", theFibs_0[N])
val () = println! ("fib(", N2, ") = ", theFibs_0[N2])
//
} (* end of [main0] *)

(* ****** ****** *)

(* end of [fibStream.dats] *)

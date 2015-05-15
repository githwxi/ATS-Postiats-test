(* ****** ****** *)

#include
"share/atspre_staload.hats"
#include
"share/HATS/atspre_staload_libats_ML.hats"

(* ****** ****** *)

(*
extern
fun fromto (m: int, n: int): list0(int)
implement
fromto (m, n) =
  if m < n then cons0 (m, fromto (m+1, n)) else nil0()
// end of [fromto]
*)

(* ****** ****** *)

(*
fun from (m: int): list0 (int) = cons0 (m, fromto (m+1))
*)

(* ****** ****** *)

extern
fun from (m: int): stream (int)

implement
from (m) = $delay (stream_cons (m, from (m+1)))

(* ****** ****** *)


val theNats = from (0)

val xs = theNats
val-stream_cons(0, xs) = !xs
val-stream_cons(1, xs) = !xs
val-stream_cons(2, xs) = !xs
val-stream_cons(x, xs) = !xs
val () = println! ("x(3) = ", x)
val () = println! ("1000000")
val-1000000 = theNats[1000000]
val () = println! ("1000001")
val-1000001 = theNats[1000001]
val () = println! ("1000002")

(* ****** ****** *)

fun fib (n: int): int =
  if n >= 2 then fib(n-1) + fib(n-2) else n

val () = println! ("fib(10) = ", fib(10))

(*
val () = println! ("fib(100) = ", fib(100))
*)

(* ****** ****** *)
//
val // the following values are defined mutually recursively
rec theFibs_0
  : stream(int) = $delay (stream_cons(0, theFibs_1)) // fib0, fib1, ...
and theFibs_1
  : stream(int) = $delay (stream_cons(1, theFibs_2)) // fib1, fib2, ...
and theFibs_2
  : stream(int) = // fib2, fib3, fib4, ...
(
  stream_map2_fun<int,int><int> (theFibs_0, theFibs_1, lam (x, y) => x + y)
) (* end of [val/and/and] *)
//
(* ****** ****** *)

val () = println! ("fib(10) = ", theFibs_0[10])
val () = println! ("fib(100) = ", theFibs_0[100])

(* ****** ****** *)

implement main0 () = ()

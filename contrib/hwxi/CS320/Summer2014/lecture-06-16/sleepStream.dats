(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
//
(* ****** ****** *)

%{^
#include <unistd.h>
%}
extern
fun usleep (n: uint): void
implement
usleep (n) = ignoret($extfcall (int, "usleep", n))

(* ****** ****** *)

extern
fun sleepStream (n: uint): stream (int)

implement
sleepStream
  (n) = $delay
(
  stream_cons (0, (usleep(n); sleepStream(n)))
) (* end of [sleepStream] *)

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

val xs = theFibs_0
val ys = sleepStream (500000U)
val zs = stream_map2_fun<int,int><int> (xs, ys, lam (x, y) => x)

(* ****** ****** *)

local
//
typedef
tenv = int
//
implement
stream_foreach$cont<int><tenv> (x, env) = if env > 40 then false else true
implement
stream_foreach$fwork<int><tenv> (x, env) =
  let val n = env; val () = env := n+1 in println! ("fib(", n, ") = ", x) end
//
in(*in-of-local*)
//
var env: tenv = 0
val () = stream_foreach_env<int><tenv> (zs, env)
//
end // end of [local]

(* ****** ****** *)

implement main0 () = ()

(* ****** ****** *)

(* end of [sleepStream.dats] *)

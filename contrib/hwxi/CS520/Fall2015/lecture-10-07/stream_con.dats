(*
** Code for lecture-10-07
*)

(* ****** ****** *)

(*
//
datatype
stream_con (a:t@ype+) =
  | stream_nil of ((*void*)) | stream_cons of (a, stream(a))
where stream (a:t@ype) = lazy (stream_con(a))
//
*)

(* ****** ****** *)
//
extern
fun
from(int): stream(int)
//
implement
from(n) = $delay(stream_cons(n, from(n+1)))
//
(* ****** ****** *)

extern
fun
intstream_rem_multiple(stream(int)): stream(int)

(* ****** ****** *)

implement
intstream_rem_multiple
  (xs) = let
//
fun
aux(xs: stream(int)): stream_con(int) =
  case+ !xs of
  | stream_nil() => stream_nil()
  | stream_cons(x0, xs) =>
      stream_cons(x0, $delay(aux2(xs, x0)))
and
aux2(xs: stream(int), x0: int): stream_con(int) =
  case+ !xs of
  | stream_nil() => stream_nil()
  | stream_cons(x, xs) =>
      if x % x0 > 0
        then stream_cons(x, $delay(aux2(xs, x0))) else aux2(xs, x0)
      // end of [if]
    // end of [stream_cons]
//
in
  $delay(aux(xs))
end // intstream_rem_multiple

(* ****** ****** *)

implement
intstream_rem_multiple
  (xs) = let
//
fun
aux
(
  xs: stream(int)
) : stream_con(int) =
  case+ !xs of
  | stream_nil() => stream_nil()
  | stream_cons(x0, xs) =>
      stream_cons(x0, stream_filter_cloref(xs, lam(x) => x % x0 > 0))
    // end of [stream_cons]
//
in
  $delay(aux(xs))
end // intstream_rem_multiple

(* ****** ****** *)
//
extern
fun
Eratosthenes_sieve(stream(int)): stream(int)
//
(* ****** ****** *)

implement
Eratosthenes_sieve(xs) =
$delay let
  val xs =
    intstream_rem_multiple(xs)
  // end of [val]
  val-stream_cons(x, xs) = !xs
in
  stream_cons(x, Eratosthenes_sieve(xs))
end // end of [Eratosthenes_sieve]

(* ****** ****** *)

(* end of [stream_con.dats] *)

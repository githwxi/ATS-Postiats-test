(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
//
(* ****** ****** *)

staload "libats/ML/SATS/basis.sats"
staload "libats/ML/SATS/list0.sats"

(* ****** ****** *)

fun from (m: int): stream(int) =
  $delay (stream_cons (m, from (m+1)))

(* ****** ****** *)

fun remove
(
  xs: stream(int), x0: int
) : stream(int) =
  $delay (remove_con (xs, x0))

and remove_con
(
  xs: stream(int), x0: int
) : stream_con (int) = let
  val-stream_cons (x, xs) = !xs
in
//
if (x mod x0 = 0)
  then remove_con (xs, x0)
  else stream_cons (x, remove (xs, x0))
//
end // end of [remove_con]

(* ****** ****** *)

fun sieve
(
  xs: stream(int)
) : stream(int) = $delay
(
let
  val-stream_cons (x0, xs) = !xs
in
  stream_cons (x0, sieve (remove (xs, x0)))
end
)

(* ****** ****** *)

val theNat2 = from (2)
val thePrimes = sieve (theNat2)

(* ****** ****** *)

val ps = thePrimes
val-stream_cons (p, ps) = !ps
val () = println! ("p = ", p)
val-stream_cons (p, ps) = !ps
val () = println! ("p = ", p)
val-stream_cons (p, ps) = !ps
val () = println! ("p = ", p)
val-stream_cons (p, ps) = !ps
val () = println! ("p = ", p)
val-stream_cons (p, ps) = !ps
val () = println! ("p = ", p)
val-stream_cons (p, ps) = !ps
val () = println! ("p = ", p)

(* ****** ****** *)
//
val qs =
  stream_take_exn (ps, 5)
//
val () = println! ("qs = ", qs)
//
(* ****** ****** *)
//
val
p1000 =
  stream_nth_exn (ps, 1000)
//
val () = println! ("p1000 = ", p1000)
//
(* ****** ****** *)

implement main0 () = ()

(* ****** ****** *)

(* end of [primes.dats] *)

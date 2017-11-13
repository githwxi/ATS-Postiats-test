(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
#include
"share/HATS\
/atspre_staload_libats_ML.hats"
//
(* ****** ****** *)

extern
fun
sieve(stream(int)): stream(int)

(* ****** ****** *)

implement
sieve(xs) = $delay
(
let
//
val-
stream_cons(x0, xs) = !xs
val xs =
stream_filter_cloref(xs, lam(x) => x % x0 > 0)
//
in
  stream_cons(x0, sieve(xs))
end
) (* end of [sieve] *)

(* ****** ****** *)

val
thePrimes =
sieve
(
(fix f(i: int): stream(int) => $delay(stream_cons(i, f(i+1))))(2)
) (* end of [sieve] *)

(* ****** ****** *)
//
val ps = thePrimes
//
val-
stream_cons(p, ps) = !ps
val () = println!("p = ", p)
val-
stream_cons(p, ps) = !ps
val () = println!("p = ", p)
val-
stream_cons(p, ps) = !ps
val () = println!("p = ", p)
val-
stream_cons(p, ps) = !ps
val () = println!("p = ", p)
val-
stream_cons(p, ps) = !ps
val () = println!("p = ", p)
val-
stream_cons(p, ps) = !ps
val () = println!("p = ", p)
val-
stream_cons(p, ps) = !ps
val () = println!("p = ", p)
val-
stream_cons(p, ps) = !ps
val () = println!("p = ", p)
val-
stream_cons(p, ps) = !ps
val () = println!("p = ", p)
//
(* ****** ****** *)

implement main0() = ()

(* ****** ****** *)

(* end of [sieve.dats] *)

(* ****** ****** *)

#include
"share/atspre_staload.hats"
#include
"share/HATS/atspre_staload_libats_ML.hats"

(* ****** ****** *)

(*
PI/4 = 1 - 1/3 + 1/5 - 1/7 + ...
*)

(* ****** ****** *)

fun{
a:t@ype
} tabulate
(
  f: int -<cloref1> a
) : stream(a) = let
//
fun aux (i: int): stream(a) =
  $delay(stream_cons (f(i), aux(i+1)))
//
in
  aux (0)
end // end of [tabulate]

(* ****** ****** *)

fun partsum
(
  xs: stream(double)
) : stream(double) = let
//
fun aux
(
  psum: double, xs: stream(double)
) : stream(double) = $delay
(
let
  val-stream_cons (x, xs) = !xs
in
  stream_cons (psum, aux (psum + x, xs))
end
)
//
in
  aux (0.0, xs)
end

(* ****** ****** *)

fun sign (i: int): double =
  if i mod 2 = 0 then 1.0 else ~1.0

val seq1 = tabulate<double> (lam (i) => sign(i) / (2*i+1))
val psum1 = partsum (seq1)

(* ****** ****** *)

extern
fun EulerTrans (stream(double)): stream(double) = "ext#C__EulerTrans"

(* ****** ****** *)

val psum2 = EulerTrans (psum1)
val psum3 = EulerTrans (psum2)
val psum4 = EulerTrans (psum3)
val psum5 = EulerTrans (psum4)
val psum6 = EulerTrans (psum5)
val psum7 = EulerTrans (psum6)
val psum8 = EulerTrans (psum7)

(* ****** ****** *)

val Pi = 4 * stream_nth_exn (psum8, 0)

(* ****** ****** *)

val () = $extfcall (void, "printf", "Pi(3.1415926) = %.18g\n", Pi)

(* ****** ****** *)

implement main0 () = ()

(* ****** ****** *)

(* end of [Pi.dats] *)

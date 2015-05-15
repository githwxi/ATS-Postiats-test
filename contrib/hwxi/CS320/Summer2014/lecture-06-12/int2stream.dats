(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
//
(* ****** ****** *)

staload "libats/ML/SATS/basis.sats"
staload "libats/ML/SATS/list0.sats"

(* ****** ****** *)

typedef int2 = (int, int)

(* ****** ****** *)
//
extern
fun from
  (m: int, n: int): stream(int2)
extern
fun from2
  (m: int, n: int): stream(int2)
//
(* ****** ****** *)

implement
from (m, n) = $delay
(
  stream_cons{int2}((m, n), from (m, n+1))
)

(* ****** ****** *)

extern
fun{
a:t@ype
} interleave : (stream(a), stream(a)) -> stream(a)

implement
{a}(*tmp*)
interleave
  (xs, ys) = $delay (
let
  val-stream_cons (x, xs) = !xs
in
  stream_cons (x, interleave (ys, xs))
end
) // end of [interleave]

(* ****** ****** *)

implement
from2 (m, n) = $delay (
let
  val mn = (m, n)
  val xys1 = from (m, n+1)
  val xys2 = from2 (m+1, n)
//
implement
stream_merge$cmp<int2>
  (xy1, xy2) =
  compare ((xy1.0+xy1.1), (xy2.0+xy2.1))
//
in
  stream_cons (mn, interleave<int2> (xys1, xys2))
end
) (* end of [$delay] *)

(* ****** ****** *)

val theNatPairs = from2 (0, 0)

(* ****** ****** *)

val xys = stream_take_exn (theNatPairs, 20)
val () = fprintln! (stdout_ref, "xys = ", xys)

(* ****** ****** *)

implement main0 () = ()

(* ****** ****** *)

(* end of [int2stream.dats] *)

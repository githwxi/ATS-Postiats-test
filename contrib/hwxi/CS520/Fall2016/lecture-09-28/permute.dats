(* ****** ****** *)
//
// HX: for teaching CS520, Fall, 2016
//
(* ****** ****** *)

#include
"share/atspre_staload.hats"
#include
"share/HATS/atspre_staload_libats_ML.hats"

(* ****** ****** *)
//
extern
fun
permute(xs: list0(int)): stream(list0(int))
//
(* ****** ****** *)

implement
permute(xs) = let
//
fun
aux
(
  xs: list0(int), n: int
) : stream(list0(int)) =
(
case+ xs of
| nil0() => stream_make_sing(nil0())
| cons0(x, xs) => aux2(x, 0, n, aux(xs, n-1))
)
//
and
aux2
(
  x: int, i: int, n: int, xss: stream(list0(int))
) : stream(list0(int)) =
(
//
if
(i < n)
then
stream_append
(
  stream_map_cloref(xss, lam(xs) => $effmask_all(list0_insert_at_exn(xs, i, x))), aux2(x, i+1, n, xss)
) (* end of [then] *)
else stream_make_nil()
//
) (* end of [aux2] *)
//
in
  aux(xs, length(xs))
end // end of [permute]

(* ****** ****** *)

implement
main0() =
{
//
val xs = g0ofg1($list{int}(1,2,3,4,5))
val () = println! ("|permute(", xs, ")| = ", length(permute(xs)))
//
} (* end of [main0] *)

(* ****** ****** *)

(* end of [permute.dats] *)

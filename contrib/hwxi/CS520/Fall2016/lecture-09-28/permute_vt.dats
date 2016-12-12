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
permute_vt(xs: list0(int)): stream_vt(list0(int))
//
(* ****** ****** *)

implement
permute_vt(xs) = let
//
fun
aux
(
  xs: list0(int), n: int
) : stream_vt(list0(int)) =
(
case+ xs of
| nil0() =>
  stream_vt_make_sing(nil0())
| cons0(x, xs) => aux2(x, xs, 0, n)
)
//
and
aux2
(
  x: int, xs: list0(int), i: int, n: int
) : stream_vt(list0(int)) =
(
//
if
(i < n)
then
stream_vt_append
(
  stream_vt_map_cloptr(aux(xs, n-1), lam(xs) => $effmask_all(list0_insert_at_exn(xs, i, x))), aux2(x, xs, i+1, n)
) (* end of [then] *)
else stream_vt_make_nil()
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
val () = println! ("|permute(", xs, ")| = ", length(permute_vt(xs)))
//
} (* end of [main0] *)

(* ****** ****** *)

(* end of [permute_vt.dats] *)

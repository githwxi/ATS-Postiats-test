(* ****** ****** *)
//
// Implementing Game-of-24
//
(* ****** ****** *)

#include
"share/atspre_staload.hats"
#include
"share/HATS\
/atspre_staload_libats_ML.hats"

(* ****** ****** *)
//
#include
"$PATSHOMELOCS\
/effectivats-divideconquer/mylibies.hats"
//
#staload DC = $DivideConquer
//
(* ****** ****** *)

extern
fun
{a:t@ype}
stream_make_list0
(xs: list0(INV(a))): stream(a)

implement
{a}(*tmp*)
stream_make_list0
  (xs) =
  auxmain(xs) where
{
//
fun
auxmain:
$d2ctype
(
stream_make_list0<a>
) = lam(xs) => $delay
(
case+ xs of
| list0_nil() => stream_nil()
| list0_cons(x, xs) => stream_cons(x, auxmain(xs))
)
//
} (* end of [stream_make_list0] *)

(* ****** ****** *)
//
extern
fun
{a:t@ype}
choose1(xs: list0(a)): stream($tup(a, list0(a)))
extern
fun
{a:t@ype}
choose2(xs: list0(a)): stream($tup(a, a, list0(a)))
//
implement
{a}
choose1(xs) = $delay
(
case+ xs of
| list0_nil() =>
  stream_nil()
| list0_cons(x1, xs) => let
    val xss =
    stream_map_cloref
    (choose1(xs), lam($tup(y1, xs)) => $tup(y1, list0_cons(x1, xs)))
  in
    stream_cons($tup(x1, xs), xss)
  end // end of [list0_cons]
)
//
implement
{a}
choose2(xs) = $delay
(
case+ xs of
| list0_nil() =>
  stream_nil()
| list0_cons(x1, xs) => let
    val
    xss1 =
    stream_map_cloref
    (choose1(xs), lam($tup(y1, xs)) => $tup(x1, y1, xs))
    val
    xss2 =
    stream_map_cloref
    (choose2(xs), lam($tup(y1, y2, xs)) => $tup(y1, y2, list0_cons(x1, xs)))
  in
    !(stream_append(xss1, xss2))
  end
)
//
(* ****** ****** *)

#define EPSILON 1E-8

(* ****** ****** *)

extern
fun
arithops
(x: double, y: double): list0(double)
//
implement
arithops(x, y) = let
//
val res = list0_nil()
//
val res = list0_cons(x+y, res)
val res = list0_cons(x-y, res)
val res = list0_cons(y-x, res)
val res = list0_cons(x*y, res)
val res = (if abs(y) > EPSILON then list0_cons(x/y, res) else res): list0(double)
val res = (if abs(x) > EPSILON then list0_cons(y/x, res) else res): list0(double)
//
in
  list0_reverse(res)
end // end of [arithops]

(* ****** ****** *)
//
assume
$DC.input_t0ype = list0(double)
assume
$DC.output_t0ype = list0(double)

(* ****** ****** *)
//
implement
$DC.DC_base_test<>
  (xs) = (length(xs) <= 1)
//
implement
$DC.DC_base_solve<>(xs) = xs
//
(* ****** ****** *)

implement
$DC.DC_divide<>(xs) = let
//
val ts = stream2list(choose2<double>(xs))
//
in
//
list0_concat
(
list0_map
(
g0ofg1(ts)
,
lam
(
$tup(x, y, zs)
) =>
  list0_map(arithops(x, y), lam(z) => list0_cons(z, zs))
// end of [lam]
)
)
//
end // end of [$DC.DC_divide]

(* ****** ****** *)
//
implement
$DC.DC_conquer_combine<>(_, rs) = list0_concat(rs)

(* ****** ****** *)
//
#define :: cons0
//
extern
fun
play_game_of_24(n1: int, n2: int, n3: int, n4: int): bool
//
implement
play_game_of_24
  (n1, n2, n3, n4) = let
//
val n1 = g0i2f(n1)
val n2 = g0i2f(n2)
val n3 = g0i2f(n3)
val n4 = g0i2f(n4)
//
in
  list0_exists($DC.DC_solve<>(n1::n2::n3::n4::nil0()), lam(r) => abs(r-24.0) < EPSILON)
end // end of [Play_game_of_24]

(* ****** ****** *)

implement
main0() =
{
val () = println! ("play_game_of_24(1, 1, 1, 1) = ", play_game_of_24(1, 1, 1, 1))
val () = println! ("play_game_of_24(1, 2, 3, 4) = ", play_game_of_24(1, 2, 3, 4))
val () = println! ("play_game_of_24(3, 3, 8, 8) = ", play_game_of_24(3, 3, 8, 8))
val () = println! ("play_game_of_24(5, 5, 7, 11) = ", play_game_of_24(5, 5, 7, 11))
val () = println! ("play_game_of_24(5, 7, 7, 11) = ", play_game_of_24(5, 7, 7, 11))
val () = println! ("play_game_of_24(4, 4, 10, 10) = ", play_game_of_24(4, 4, 10, 10))
}

(* ****** ****** *)

(* end of [Game-of-24.dats] *)

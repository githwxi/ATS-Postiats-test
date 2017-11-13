(* ****** ****** *)

#include
"share/atspre_staload.hats"
#include
"share/HATS/atspre_staload_libats_ML.hats"

(* ****** ****** *)

typedef
node = list0(double)

(* ****** ****** *)
//
extern
fun
node_get_children(node): list0(node)
//
(* ****** ****** *)

extern
fun
solve(node): stream(node)

extern
fun
solves(stream(node)): stream(node)

(* ****** ****** *)

fun
{a:t@ype}
combine
(
xss: list0(stream(a))
) : stream(a) = $delay
(
case+ xss of
| list0_nil() => stream_nil()
| list0_cons
    (xs, xss) => !(stream_append(xs, combine(xss)))
  // end of [list0_cons]
) 


(* ****** ****** *)

implement
solve(nx0) = $delay
(
let
//
val len = length(nx0)
//
in
//
if
len <= 1
then stream_sing(nx0)
else let
  val nxs = node_get_children(nx0)
in
  !(combine(list0_map(nxs, lam(nx) => solve(nx))))
end
//
end
)

(* ****** ****** *)
//
extern
fun
arithops
(x: double, y: double): list0(double)
//
(* ****** ****** *)

#define EPSILON 1E-8

(* ****** ****** *)

fn
iszero
(
x: double
):<> bool = abs(x) < EPSILON

(* ****** ****** *)

implement
arithops
  (x, y) = res where
{
//
val res = list0_nil()
val res = list0_cons(x+y, res)
val res = list0_cons(x-y, res)
val res = list0_cons(y-x, res)
val res = list0_cons(x*y, res)
val res = (if iszero(y) then res else list0_cons(x/y, res)): list0(double)
val res = (if iszero(x) then res else list0_cons(y/x, res)): list0(double)
//
} (* arithops *)

(* ****** ****** *)
//
extern
fun
{a:t@ype}
list0_choose_1
  (xs: list0(a)): list0($tup(a, list0(a)))
extern
fun
{a:t@ype}
list0_choose_2
  (xs: list0(a)): list0($tup(a, a, list0(a)))
//
(* ****** ****** *)

implement
{a}
list0_choose_1
  (xs) =
(
case+ xs of
| list0_nil() =>
  list0_nil()
| list0_cons(x1, xs1) => let
    typedef t2 = $tup(a, list0(a))
  in
    list0_cons
    ( $tup(x1, xs1)
    , list0_map<t2><t2>(list0_choose_1(xs1), lam(t2) => $tup(t2.0, list0_cons(x1, t2.1)))
    )
  end // end of [list0_cons]
)

implement
{a}
list0_choose_2
  (xs) =
(
case+ xs of
| list0_nil() =>
  list0_nil()
| list0_cons(x1, xs1) => let
    typedef t2 = $tup(a, list0(a))
    typedef t3 = $tup(a, a, list0(a))
    val t2s = list0_choose_1<a>(xs1)
    val res1 = list0_map<t2><t3>(t2s, lam(t2) => $tup(x1, t2.0, t2.1))
    val t3s = list0_choose_2<a>(xs1)
    val res2 = list0_map<t3><t3>(t3s, lam(t3) => $tup(t3.0, t3.1, list0_cons(x1, t3.2)))
  in
    list0_append(res1, res2)
  end // end of [list0_cons]
)

(* ****** ****** *)
//
implement
node_get_children
  (nx0) = let
//
val tups = list0_choose_2(nx0)
//
in
list0_concat
(
  list0_map
  ( tups
  , lam(tup) =>
    let
      val $tup(x, y, rest) = tup
    in
      list0_map(arithops(x, y), lam(xy) => list0_cons(xy, rest))
    end
  )
)
end // end of [node_get_children]

(* ****** ****** *)

implement
solves(nxs) =
stream_concat
(
stream_map_cloref<node><stream(node)>(nxs, lam(nx) => $effmask_all(solve(nx)))
)

(* ****** ****** *)
//
(*
val nx0 = g0ofg1($list{double}(3.0, 3.0, 8.0, 8.0))
val nxs = solve(nx0) // 3
val nxs = solves(nxs) // 2
val nxs = solves(nxs) // 1
val nxs =
stream_filter_cloref<list0(double)>
  (nxs, lam(nx) => let val-list0_cons(x, _) = nx in iszero(x-24.0) end)
*)
//
(* ****** ****** *)
//
extern
fun
GameOf24_play
(
int, int, int, int
) : stream(list0(double))
//
implement
GameOf24_play
(n1, n2, n3, n4) = let
//
val
nx0 =
g0ofg1
(
$list{double}
(g0i2f(n1), g0i2f(n2), g0i2f(n3), g0i2f(n4))
)
//
val nxs = solve(nx0) // 3
val nxs = solves(nxs) // 2
val nxs = solves(nxs) // 1
//
in
//
stream_filter_cloref<list0(double)>
( nxs
, lam(nx) =>
  let
    val-list0_cons(x, _) = nx in iszero(x-24.0)
  end // end of [let]
)
//
end // end of [GameOf24_play]
//
(* ****** ****** *)

implement
main0() = () where
{
//
val
nxs =
GameOf24_play(1, 1, 2, 2)
val () = println!("|nxs| = ", length(nxs))
//
val
nxs =
GameOf24_play(3, 3, 8, 8)
val () = println!("|nxs| = ", length(nxs))
//
val
nxs =
GameOf24_play(3, 5, 7, 13)
val () = println!("|nxs| = ", length(nxs))
//
val
nxs =
GameOf24_play(4, 4, 10, 10)
val () = println!("|nxs| = ", length(nxs))
//
} (* end of [main0] *)

(* ****** ****** *)

(* end of [Game-of-24.dats] *)

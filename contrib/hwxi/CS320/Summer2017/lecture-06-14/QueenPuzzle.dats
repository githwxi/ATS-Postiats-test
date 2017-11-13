(* ****** ****** *)

#include
"share/atspre_staload.hats"
#include
"share/HATS/atspre_staload_libats_ML.hats"

(* ****** ****** *)

typedef config = list0(int)

(* ****** ****** *)

#define N 8

(* ****** ****** *)
//
extern
fun
solve(config): stream(config)
//
(* ****** ****** *)
//
extern
fun
{a:t@ype}
myconcat(list0(stream(a))): stream(a)
//
implement
{a}
myconcat(xss) = $delay
(
case+ xss of
| list0_nil() =>
  stream_nil()
| list0_cons(xs, xss) =>
  !(stream_append<a>(xs, myconcat(xss)))
)
//
(* ****** ****** *)

extern
fun
fromto : (int, int) -> list0(int)

(* ****** ****** *)

implement
fromto(m, n) = list0_make_intrange(m, n)

(* ****** ****** *)

extern
fun
safety_test(config, position: int): bool

(* ****** ****** *)

implement
safety_test
  (ps, p0) = loop(1, ps) where
{
fun
loop(df: int, ps: list0(int)): bool =
 (case+ ps of
  | list0_nil() => true
  | list0_cons(p, ps) =>
      if ((p0 != p) && (abs(p0-p) != df)) then loop(df+1, ps) else false
    // end of [list0_cons]
 )
}

(* ****** ****** *)

implement
solve(config) = $delay
(
let
  val n =
  list0_length(config)
in
  if
  (n >= N)
  then stream_sing(config)
  else let
    val xs =
    list0_filter<int>
    (fromto(0, N), lam(x) => safety_test(config, x))
  in
    stream_cons
    ( config,
      myconcat
      (
        list0_map<int><stream(config)>
        (xs, lam(x) => solve(list0_cons(x, config)))
      )
    )
  end
end
)

(* ****** ****** *)

val
thePSolutions = solve(list0_nil())

val
theCSolutions =
stream_filter_fun(thePSolutions, lam(xs) => length(xs) >= N)

(* ****** ****** *)

val
sol = theCSolutions[0]
val () = println!("sol = ", sol)

(* ****** ****** *)

val () = println! ("length(thePSolutions) = ", length(thePSolutions))
val () = println! ("length(theCSolutions) = ", length(theCSolutions))

(* ****** ****** *)

implement main0 () = ()

(* ****** ****** *)

(* end of [QueenPuzzle.dats] *)

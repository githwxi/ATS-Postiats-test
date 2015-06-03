//
#include
"share/atspre_staload.hats"
//
#include
"share/HATS/atspre_staload_libats_ML.hats"
//
(* ****** ****** *)

extern
fun
{a:t@ype}
{b:t@ype}
list0_map(xs: list0(a), f: a -<cloref1> b): list0(b)

(*
implement
{a}{b}
list0_map(xs, f) =
case+ xs of
| list0_nil() => list0_nil()
| list0_cons(x, xs) => list0_cons(f(x), list0_map<a><b>(xs, f))
*)

implement
{a}{b}
list0_map(xs, f) = (
//
list0_foldright<a><list0(b)>(xs, lam(x, res) => list0_cons(f(x), res), list0_nil)
//
) (* end of [list0_map] *)

(* ****** ****** *)
//
extern
fun{a:t@ype}
list0_filter(xs: list0(a), pred: a -<cloref1> bool): list0(a)
//
(*
//
implement
{a}(*tmp*)
list0_filter
  (xs, pred) =
(
case+ xs of
| list0_nil() => list0_nil()
| list0_cons(x, xs) =>
    if pred(x)
      then list0_cons(x, list0_filter(xs, pred)) else list0_filter(xs, pred)
    // end of [if]
  // end of [list0_cons]
) (* end of [list0_filter] *)
//
*)
//
implement
{a}(*tmp*)
list0_filter
  (xs, pred) =
  list0_foldright<a><list0(a)>
    (xs, lam(x, res) => if pred(x) then list0_cons(x, res) else res, list0_nil)
  // end of [list0_foldright]
//
(* ****** ****** *)

extern
fun
{a,b:t@ype}
list0_zip(xs: list0(a), ys: list0(b)): list0( @(a, b) )

extern
fun
{a,b:t@ype}{c:t@ype}
list0_map2(xs: list0(a), ys: list0(b), f: (a, b) -<cloref> c): list0(c)
extern
fun
{a,b:t@ype}{c:t@ype}
list0_zipwith(xs: list0(a), ys: list0(b), f: (a, b) -<cloref> c): list0(c)

(* ****** ****** *)

(*
implement
{a,b}
list0_zip(xs, ys) =
(
case+ xs of
| list0_nil() => list0_nil()
| list0_cons(x, xs) =>
  (
    case+ ys of
    | list0_nil() => list0_nil()
    | list0_cons(y, ys) => list0_cons ((x, y), list0_zip(xs, ys))
  )
)
*)

implement
{a,b}
list0_zip(xs, ys) =
(
case+ (xs, ys) of
| (list0_nil(), _          ) => list0_nil()
| (_          , list0_nil()) => list0_nil()
| (list0_cons(x, xs), list0_cons(y, ys)) => list0_cons ((x, y), list0_zip(xs, ys))
)

(* ****** ****** *)

extern
fun
{a:t@ype}
list0_tabulate(n: int, f: int -<cloref1> a): list0(a)
implement
{a}(*tmp*)
list0_tabulate(n, f) = let
//
fun aux(i: int): list0(a) =
  if i < n then list0_cons(f(i), aux(i+1)) else list0_nil()
//
in
  aux(0)
end // end of [list0_tabulate]

(* ****** ****** *)
//
extern
fun
{a,b:t@ype}
list0_cross(xs: list0(a), ys: list0(b)): list0( @(a, b) )
//
extern
fun
{a,b:t@ype}{c:t@ype}
list0_crosswith
  (xs: list0(a), ys: list0(b), f: (a, b) -<cloref> c): list0(c)
//
(* ****** ****** *)

implement
{a,b}
list0_cross(xs, ys) =
(
case+ xs of
| list0_nil() => list0_nil()
| list0_cons(x, xs2) => let
    val res1 =
      list0_map<b><(a,b)>(ys, lam y => (x, y)) // n
    val res2 = list0_cross<a,b> (xs2, ys) // (m-1)*n = m*n-n
  in
    list0_append<(a,b)> (res1, res2)
  end
)

(* ****** ****** *)
//
val xs0 = list0_make_intrange(0, 10) // 0, 1, 2, ..., 9
//
val xs1 = list0_filter<int>(xs0, lam(x) => (x%2 = 0))
val xs2 = list0_filter<int>(xs0, lam(x) => (x%2 = 1))
//
(* ****** ****** *)

val xs12 = list0_zip<int,int>(xs1, xs2)
val xs1x2 = list0_cross<int,int>(xs1, xs2)
//
val xs0x0 = list0_cross<int,int>(xs0, xs0)
//
val xs0x0_2 = list0_filter<(int,int)>(xs0x0, lam (xy) => (xy.0 > 0))
val xs0x0_2 = list0_filter<(int,int)>(xs0x0_2, lam (xy) => (xy.0 <= xy.1))
val xs0x0_2 =
list0_mergesort<(int,int)>
(xs0x0_2,
 lam(xy1, xy2) =>
 let val sgn = compare(xy1.1, xy2.1) in
   if sgn != 0 then sgn else compare(xy1.0, xy2.0) end
 // end of [lam]
)
//
(* ****** ****** *)

val () = println! ("xs1 = ", xs1)
val () = println! ("xs2 = ", xs2)
val () = println! ("xs12 = ", xs12)

val () = println! ("xs1x2 = ", xs1x2)
val () = println! ("xs0x0 = ", xs0x0)
val () = println! ("xs0x0_2 = ", xs0x0_2)

val () = assertloc(list0_length(xs1x2) = 25)
val () = assertloc(list0_length(xs0x0) = 100)

(* ****** ****** *)

fun print2_int(x: int): void = $extfcall(void, "printf", "%2d", x)

(* ****** ****** *)

val () =
list0_foreach
(xs0x0_2,
 lam @(x,y) => (print! (x,  "x", y,  " = "); print2_int (x * y); if (x < y) then print " | "; if x = y then print_newline();)
)

(* ****** ****** *)

implement main0 () = ()

(* ****** ****** *)

(* end of [listfuns.dats] *)

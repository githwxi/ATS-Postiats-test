(* ****** ****** *)
//
// HX: zipwith
//
(* ****** ****** *)

fun
{a,
 b:t@ype}
{c:t@ype}
list_zipwith
  {n:int}
(
  xs: list(a, n)
, ys: list(b, n)
, fopr: (a, b) -<cloref1> c
) : list(c, n) = (
//
case+ (xs, ys) of
| ( list_cons(x, xs)
  , list_cons(y, ys)) =>
  (
    list_cons(fopr(x, y), list_zipwith<a,b><c>(xs, ys, fopr))
  )
| (_, _) =>> list_nil((*void*))
//
) (* end of [list_zipwith] *)

(* ****** ****** *)

(* end of [zipwith.dats] *)
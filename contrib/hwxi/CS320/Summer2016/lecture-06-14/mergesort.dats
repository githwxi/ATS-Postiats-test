(*
** mergesort: bottom-up
*)

(* ****** ****** *)

#include
"share/atspre_staload.hats"
#include
"share/HATS/atspre_staload_libats_ML.hats"

(* ****** ****** *)

staload "./../mylib/mylist.dats"

(* ****** ****** *)

extern
fun
{a:t@ype}
mergesort(xs: list0(a)): list0(a)

(* ****** ****** *)

implement
{a}
mergesort(xs) = let
//
fun
merge
(
  xs1: list0(a), xs2: list0(a)
) : list0(a) =
(
case+ xs1 of
| nil0() => xs2
| cons0(x1, xs11) =>
  (
    case+ xs2 of
    | nil0() => xs1
    | cons0(x2, xs21) => let
        val sgn =
          gcompare_val_val<a> (x1, x2)
        // end of [val]
      in
        if sgn <= 0
          then cons0(x1, merge(xs11, xs2))
          else cons0(x2, merge(xs1, xs21))
        // end of [if]
      end // end of [cons0]
  )
)
//
fun
pairing
(
  xs: list0(a)
) : list0(list0(a)) =
(
  case+ xs of
  | cons0(x1, cons0(x2, xs)) => let
      val sgn = gcompare_val_val<a>(x1, x2)
      val pair =
      (
        if sgn <= 0
          then list0_pair(x1, x2) else list0_pair(x2, x1)
        // end of [if]
      ) : list0(a)
    in
      cons0(pair, pairing(xs))
    end
  | _(*nil or singleton*) => list0_sing(xs)
)
//
fun
mergeone
(
  xss: list0(list0(a))
) : list0(list0(a)) =
(
case+ xss of
| cons0(xs1, cons0(xs2, xss)) =>
    cons0(merge(xs1, xs2), mergeone(xss))
  | _(*nil or singleton*) => xss
)
//
fun
mergeall
(
  xss: list0(list0(a))
) : list0(a) =
(
  case+ xss of
  | cons0(xs, nil0()) => xs
  | _(* cons0(_, cons0(_, _)) *) => mergeall(mergeone(xss))
)
//
in
  mergeall(pairing(xs))
end // end of [mergesort]

(* ****** ****** *)

implement
main0() = () where
{
//
val xs =
$list{int}
(
  2, 8, 3, 4, 5, 7, 0, 6, 9, 1
) (* $list *)
val xs = g0ofg1(xs)
//
val xs2 = xs + xs
val ys2 = mergesort<int>(xs2)
//
val () = println! ("xs2 = ", xs2)
val () = println! ("ys2 = ", ys2)
//
} (* end of [main0] *)

(* ****** ****** *)

(* end of [mergesort] *)

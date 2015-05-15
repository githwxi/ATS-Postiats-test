(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
#include
"share/HATS/atspre_staload_libats_ML.hats"
//
(* ****** ****** *)

(*
datatype
list0(a:t@ype) =
list0_nil of () | list0_cons of (a, list(a))
*)

(* ****** ****** *)

#define :: cons0

(* ****** ****** *)

extern
fun{a:t@ype}
list0_length (xs: list0(a)): int

(* ****** ****** *)

implement
{a}(*tmp*)
list0_length (xs) =
(
  case+ xs of
  | nil0 () => 0 | cons0 (_, xs) => list0_length (xs) + 1
)

(* ****** ****** *)

extern
fun{a:t@ype}
list0_append (xs: list0(a), ys: list0(a)): list0(a)

(* ****** ****** *)

implement
{a}(*tmp*)
list0_append
  (xs, ys) =
(
if isneqz (xs)
  then list0_cons (xs.head(), list0_append (xs.tail(), ys)) else ys
// end of [if]
)

(* ****** ****** *)

implement
main0 () =
{
//
val xs =
  1 :: 2 :: 3 :: nil0 ()
//
val xs = xs: list0 (int)
//
val () = println! ("|(", xs, ")| = ", list0_length(xs))
//
val xs2 = list0_append<int> (xs, xs)
//
val () = println! ("|(", xs2, ")| = ", list0_length(xs2))
//
} (* end of [main0] *)

(* ****** ****** *)

(* end of [list0.dats] *)

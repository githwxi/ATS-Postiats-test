(*
** For illustrating
** a typical use of exceptions
*)

(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
//
staload "libats/ML/SATS/basis.sats"
staload "libats/ML/SATS/list0.sats"
staload _ = "libats/ML/DATS/list0.dats"
//
(* ****** ****** *)

extern
fun listprod (list0(int)): int
//
implement
listprod (xs) =
  case+ xs of
  | nil0 () => 1
  | cons0 (x, xs) => x * listprod (xs)
//
(* ****** ****** *)

extern
fun listprod2 (list0(int)): int
//
implement
listprod2 (xs) =
  case+ xs of
  | nil0 () => 1
  | cons0 (x, xs) =>
    if x = 0 then 0 else x * listprod2 (xs)
//
(* ****** ****** *)
//
// HX: this is the best one:
//
extern
fun listprod3 (list0(int)): int

implement
listprod3 (xs) = let
//
exception ZERO of ()
//
fun aux (xs: list0(int)): int =
  case+ xs of
  | nil0 () => 1
  | cons0 (x, xs) =>
    if x = 0 then $raise ZERO() else x * listprod3 (xs)
//
in
//
try aux(xs) with ~ZERO () => 0
//
end // end of [listprod3]

(* ****** ****** *)

implement
main0 () =
{
//
val xs =
$list{int}(1, 3, 4, 0, 5, 6)
//
val xs = g0ofg1 (xs): list0 (int)
//
val () = println! ("listprod(", xs, ") = ", listprod(xs))
val () = println! ("listprod2(", xs, ") = ", listprod2(xs))
val () = println! ("listprod3(", xs, ") = ", listprod3(xs))
val () = println! ("Testing is over!")
//
} (* end of [main0] *)

(* ****** ****** *)

(* end of [listprod.dats] *)

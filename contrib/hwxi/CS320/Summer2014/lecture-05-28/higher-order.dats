//
#include
"share/atspre_staload.hats"
//
staload "libats/ML/SATS/basis.sats"
staload "libats/ML/SATS/list0.sats"
staload _ = "libats/ML/DATS/list0.dats"
//
(* ****** ****** *)
//
extern
fun fromto (m: int, n: int): list0(int)
//
implement
fromto (m, n) =
  if m < n then list0_cons(m, fromto (m+1, n)) else list0_nil()
//
(* ****** ****** *)

extern
fun sumlist (xs: list0 (int)): int

(*
implement
sumlist (xs) =
  case xs of
  | list0_nil () => 0
  | list0_cons (x, xs2) => x + sumlist (xs2)
*)
(* ****** ****** *)

extern
fun prodlist (xs: list0 (int)): int

(*
implement
prodlist (xs) =
  case xs of
  | list0_nil () => 1
  | list0_cons (x, xs2) => x * prodlist (xs2)
*)
(* ****** ****** *)

extern
fun list_fold
  (xs: list0 (int), unit: int, f: (int, int) -> int): int

implement
list_fold (xs, unit, f) =
  case xs of
  | list0_nil () => unit
  | list0_cons (x, xs2) => f (x, list_fold (xs2, unit, f))

(* ****** ****** *)

implement
sumlist (xs) = list_fold (xs, 0, lam (x, y) => x + y)
implement
prodlist (xs) = list_fold (xs, 1, lam (x, y) => x * y)

(* ****** ****** *)

implement
main0 () =
{
val xs = fromto (1, 10)
val () = println! ("xs = ", xs)
val () = println! ("sumlist(", xs, ") = ", sumlist(xs))
val () = println! ("prodlist(", xs, ") = ", prodlist(xs))
}

(* ****** ****** *)

(* end of [higher-order.dats] *)

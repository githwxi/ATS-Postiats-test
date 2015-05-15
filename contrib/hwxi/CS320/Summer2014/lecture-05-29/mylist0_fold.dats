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
fun
{a:t@ype}
{b:t@ype}
mylist0_foldleft
  (xs: list0 (b), init: a, f: (a, b) -> a): a

(* ****** ****** *)

implement
{a}{b}
mylist0_foldleft
  (xs, init, f) = let
//
fun aux
(
  xs: list0(b), res: a
) : a =
  case+ xs of
  | nil0 () => res
  | cons0 (x, xs) => aux (xs, f (res, x))
//
in
  aux (xs, init)
end // end of [mylist0_foldleft]

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

implement
sumlist (xs) = mylist0_foldleft<int><int> (xs, 0, lam (x, y) => x + y)
implement
prodlist (xs) = mylist0_foldleft<int><int> (xs, 1, lam (x, y) => x * y)

(* ****** ****** *)

extern
fun{a:t@ype}
mylist0_length (xs: list0(a)): int

implement{a}
mylist0_length (xs) =
mylist0_foldleft<int><a> (xs, 0(*init*), lam (res, _) => res+1)

(* ****** ****** *)

implement
main0 () =
{
val xs = fromto (1, 10)
val () = println! ("xs = ", xs)
val () = println! ("length(xs) = ", mylist0_length<int> (xs))
val () = println! ("sumlist(", xs, ") = ", sumlist(xs))
val () = println! ("prodlist(", xs, ") = ", prodlist(xs))
}

(* ****** ****** *)

(* end of [mylist0_fold.dats] *)

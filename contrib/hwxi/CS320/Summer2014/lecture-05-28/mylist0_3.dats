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
fun{a:t@ype}
mylist0_append
  (xs: list0(a), ys: list0(a)): list0(a)

implement
{a}(*tmp*)
mylist0_append (xs, ys) =
  case+ xs of
  | nil0 () => ys
  | cons0 (x, xs) => cons0 (x, mylist0_append (xs, ys))

(* ****** ****** *)

extern
fun{a:t@ype}
mylist0_reverse (xs: list0(a)): list0(a)

extern
fun{a:t@ype}
mylist0_reverse_append
  (xs: list0(a), ys: list0(a)): list0(a)

implement{a}
mylist0_reverse (xs) = mylist0_reverse_append (xs, nil0)

implement{a}
mylist0_reverse_append (xs, ys) =
  case+ xs of
  | nil0 () => ys
  | cons0 (x, xs) => mylist0_reverse_append (xs, cons0 (x, ys))

(* ****** ****** *)

extern
fun{a:t@ype}
mylist0_find
  (xs: list0 (a), x0: a, eq: (a, a) -> bool): bool

implement
{a}(*tmp*)
mylist0_find
  (xs, x0, eq) =
(
  case+ xs of
  | nil0 () => false
  | cons0 (x, xs) => eq (x0, x) || mylist0_find (xs, x0, eq)
)

(* ****** ****** *)

implement
main0 () =
{
val xs = list0_make_intrange (0, 3)
val () = println! ("xs = ", xs)
val () = println! ("mylist0_append(xs, xs) = ", mylist0_append<int> (xs,
xs))
val () = println! ("mylist0_reverse(", xs, ") = ",
mylist0_reverse<int>(xs))
//
val ss = cons0 ("a", cons0 ("b", cons0 ("c", nil0()))): list0(string)
val () = println! ("ss = ", ss)
val () = println! ("mylist0_append(ss, ss) = ", mylist0_append<string> (ss,
ss))
//
val () = println! ("mylist0_find([", ss, "]", ", ", "\"a\"", ") = ", mylist0_find<string> (ss, "a", lam (s1, s2) => s1 = s2))
//
} (* end of [main0] *)

(* ****** ****** *)

(* end of [mylist0_3.dats] *)

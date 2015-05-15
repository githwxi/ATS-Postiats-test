//
#include
"share/atspre_staload.hats"
//
staload "libats/ML/SATS/basis.sats"
staload "libats/ML/SATS/list0.sats"
staload _ = "libats/ML/DATS/list0.dats"
//
(* ****** ****** *)

(*
datatype
list0(a:t@ype) =
  | list0_nil of ()
  | list0_cons of (a, list0(a))
*)

(* ****** ****** *)

extern
fun fromto (m: int, n: int): list0(int)

(* ****** ****** *)

implement
fromto (m, n) =
if m < n
  then list0_cons(m, fromto (m+1, n))
  else list0_nil()
// end of [fromto]

(* ****** ****** *)
  
extern
fun tally (xs: list0 (int)): int
  
implement
tally (xs) =
(
 case+ xs of
 | list0_nil () => 0
 | list0_cons (x, xs2) => x + tally (xs2)
)
        
(* ****** ****** *)

val xs = fromto (1, 10)
val () = println! ("tally(", xs, ") = ", tally(xs))

(* ****** ****** *)

extern
fun mylist_print (xs: list0 (int)): void

implement
mylist_print (xs) =
(
  case+ xs of
  | list0_nil () =>
    {
      val () = print! ("list0_nil()")
    }
  | list0_cons (x, xs) =>
    {
      val () = print! ("list0_cons(")
      val () = print! (x)
      val () = print! (", ")
      val () = mylist_print (xs)
      val () = print! (")")
    }
) (* end of [mylist_print] *)

(* ****** ****** *)

val () = print "xs = "
val () = mylist_print (xs)
val () = print_newline ()

(* ****** ****** *)

extern
fun length (xs: list0(int)): int
    
implement
length (xs) =
(
  case+ xs of
  | list0_nil () => 0
  | list0_cons (_, xs) => 1 + length (xs)
)

(* ****** ****** *)

val () = println! ("length(", xs, ") = ", length(xs))

(* ****** ****** *)

extern
fun maxlist (xs: list0 (int)): int
extern
fun maxlist2 (x0: int, xs: list0 (int)): int

implement
maxlist (xs) =
//
// pattern matching is non-exhaustive
//
(
  case- xs of
  | list0_cons (x, xs) => maxlist2 (x, xs)
)

implement
maxlist2 (x0, xs) =
(
  case xs of
  | list0_nil () => x0
  | list0_cons (x, xs2) => max (x, maxlist2 (x0, xs2))
)

(* ****** ****** *)

val () = println! ("maxlist(", xs, ") = ", maxlist(xs))

(* ****** ****** *)

extern
fun minlist (xs: list0 (int)): int
extern
fun minlist2 (x0: int, xs: list0 (int)): int

implement
minlist (xs) =
//
// pattern matching is non-exhaustive
//
(
  case- xs of
  | list0_cons (x, xs) => minlist2 (x, xs)
)

implement
minlist2 (x0, xs) =
(
  case xs of
  | list0_nil () => x0
  | list0_cons (x, xs2) => min (x, minlist2 (x0, xs2))
)

(* ****** ****** *)

val () = println! ("minlist(", xs, ") = ", minlist(xs))

(* ****** ****** *)

implement main0 () = ()

(* ****** ****** *)

(* end of [mylist0.dats] *)

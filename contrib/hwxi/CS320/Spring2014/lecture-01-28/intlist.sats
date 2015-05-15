(* ****** ****** *)
//
// HX-2014-01-28:
// An abstract interface for integer lists
//
(* ****** ****** *)

abstype intlist = ptr

(* ****** ****** *)

fun intlist_nil (): intlist // ...
fun intlist_cons (x: int, xs: intlist): intlist

(* ****** ****** *)

fun intlist_head (xs: intlist): int
fun intlist_tail (xs: intlist): intlist
fun intlist_uncons (xs: intlist): (int, intlist)

(* ****** ****** *)

fun intlist_is_nil (intlist): bool
fun intlist_is_cons (intlist): bool

(* ****** ****** *)
//
// The following functions are based on the above ones
//
(* ****** ****** *)

fun fprint_intlist
  (out: FILEref, xs: intlist): void
overload fprint with fprint_intlist

(* ****** ****** *)

fun intlist_length (intlist): int
fun intlist_is_ordered (intlist): bool

(* ****** ****** *)

fun intlist_nth (intlist, int(*index*)): int

(* ****** ****** *)

fun intlist_append (xs: intlist, ys: intlist): intlist

(* ****** ****** *)

fun intlist_sort (xs: intlist): intlist // recursive insertion sort
fun intlist_sort2 (xs: intlist): intlist // tail-recursive insertion sort

(* ****** ****** *)

macdef nil() = intlist_nil ()
macdef ::(x, xs) = intlist_cons(,(x), ,(xs))

(* ****** ****** *)

symintr .head .tail
overload .head with intlist_head
overload .tail with intlist_tail

(* ****** ****** *)

overload iseqz with intlist_is_nil
overload isneqz with intlist_is_cons

(* ****** ****** *)

overload length with intlist_length

(* ****** ****** *)

(* end of [intlist.sats] *)

(* ****** ****** *)
//
// Introducing on datatypes
//
(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
//
(* ****** ****** *)
//
datatype
intlist =
  | intlist_nil of () // nullary
  | intlist_cons of (int, intlist) // binary
//
#define nil intlist_nil
//
#define :: intlist_cons
#define cons intlist_cons
//
(* ****** ****** *)

val digits = 0 :: 1 :: 2 :: 3 :: 4 :: 5 :: 6 :: 7 :: 8 :: 9 :: nil()

(* ****** ****** *)
//
// Pattern matching
// 
(* ****** ****** *)

extern
fun
intlist_tally : intlist -> int

implement
intlist_tally(xs) =
(
case xs of
| intlist_nil() => 0
| intlist_cons(x_head, xs_tail) => x_head + intlist_tally(xs_tail)
)

(* ****** ****** *)

extern
fun
intlist_length : intlist -> int

implement
intlist_length(xs) =
(
case xs of
| intlist_nil() => 0
| intlist_cons(_, xs_tail) => 1 + intlist_length(xs_tail)
)

(* ****** ****** *)
//
extern
fun
intlist_is_nil : intlist -> bool
implement
intlist_is_nil(xs) =
  case+ xs of
  | intlist_nil() => true | intlist_cons _ => false
//
(* ****** ****** *)
//
// The so-called nth function
//
extern
fun
intlist_get_at
  (xs: intlist, pos: int): int
//
implement
intlist_get_at
  (xs, pos) = let
//
val () = assertloc(pos >= 0)
//
in
//
case xs of
| intlist_nil() => 0
| intlist_cons(x, xs) =>
    if pos = 0 then x else intlist_get_at(xs, pos-1)
  // end of [intlist_cons]
//
end // end of [intlist_get_at]
//
(* ****** ****** *)

extern
fun
intlist_print : intlist -> void

implement
intlist_print(xs) = let
//
fun loop(xs: intlist, i: int): void =
(
case xs of
| intlist_nil() => ()
| intlist_cons(x_head, xs_tail) =>
  (
    if i = 0 then () else print ",";
    print x_head; loop(xs_tail, i+1);
  )
)
in
  loop(xs, 0)
end // end of [intlist_print]

(* ****** ****** *)
//
extern
fun
intlist_append : (intlist, intlist) -> intlist
//
implement
intlist_append(xs, ys) =
(
case xs of
| intlist_nil() => ys
| intlist_cons(x, xs) => x :: intlist_append(xs, ys)
)
//
(* ****** ****** *)

extern
fun
intlist_reverse : intlist -> intlist
extern
fun
intlist_revappend : (intlist, intlist) -> intlist

(* ****** ****** *)
//
implement
intlist_reverse(xs) =
  intlist_revappend(xs, intlist_nil())
//
(* ****** ****** *)
//
implement
intlist_revappend(xs, ys) =
(
case xs of
| intlist_nil() => ys
| intlist_cons(x, xs) => intlist_revappend(xs, x :: ys)
)
//
(* ****** ****** *)
//
val () =
  intlist_print(digits)
//
val () = print_newline()
//
(* ****** ****** *)
//
val () =
intlist_print
  (intlist_append(digits,digits))
//
val () = print_newline()
//
(* ****** ****** *)
//
val () =
  intlist_print(intlist_reverse(digits))
//
val () = print_newline()
//
(* ****** ****** *)

implement main0() = ()

(* ****** ****** *)

(* end of [lists.dats] *)


(* ****** ****** *)
//
// Code for insertion sort
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
insord (
  xs(*sorted*): intlist, x0: int
) : intlist
//
implement
insord(xs, x0) =
(
case xs of
| intlist_nil() => x0 :: nil()
| intlist_cons(x1, xs2) =>
    if x0 <= x1 then x0 :: xs else x1 :: insord(xs2, x0)
)
//
(* ****** ****** *)
//
extern
fun
insort : intlist -> intlist
//
(*
implement
insort(xs) =
(
case xs of
| intlist_nil() => intlist_nil()
| intlist_cons(x, xs) => insord(insort(xs), x)
)
*)
//
implement
insort(xs) = let
  fun loop(xs: intlist, ys: intlist): intlist =
    case xs of
    | intlist_nil() => ys
    | intlist_cons(x, xs) => loop(xs, insord(ys, x))
in
  loop(xs, intlist_nil())
end // end of [insort]
//
(* ****** ****** *)

val xs = 3 :: 2 :: 1 :: 4 :: 9 :: 9 :: 3 :: 1 :: 0 :: nil()

(* ****** ****** *)

val () = intlist_print(xs)
val () = print_newline()
val () = intlist_print(insort(xs))
val () = print_newline()

(* ****** ****** *)

implement main0 () = ()

(* ****** ****** *)

(* end of [insort.dats] *)

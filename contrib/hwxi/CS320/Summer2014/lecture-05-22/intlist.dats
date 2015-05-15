(* ****** ****** *)
//
// HX: intro to datatypes
//
(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
//
(* ****** ****** *)

(*
recursively defined
*)
datatype intlist =
  | intlist_nil // of ()
  | intlist_cons of (int, intlist)

(* ****** ****** *)

#define nil intlist_nil
#define cons intlist_cons
#define :: intlist_cons // infix

(* ****** ****** *)

val xs = nil () // []
val xs = cons (1, xs) // [1]
val xs = cons (2, xs) // [2, 1]
val xs = cons (3, xs) // [3, 2, 1]

(* ****** ****** *)

extern
fun fromto (m: int, n: int): intlist

(* ****** ****** *)
//
(*
implement
fromto (m, n) =
  if m < n then cons (m, fromto (m+1, n)) else nil ()
*)
//
(* ****** ****** *)

implement
fromto (m, n) = let
//
fun loop
(
  m: int, n: int, res: intlist
) : intlist =
  if m < n then loop (m, n-1, cons (n-1, res)) else res
//
in
  loop (m, n, nil ())
end // end of [fromto]

(* ****** ****** *)

val xs = fromto (0, 1000000)

(* ****** ****** *)

implement
main0 () = println! ("Testing for [intlist] is done!")

(* ****** ****** *)

(* end of [intlist.dats] *)

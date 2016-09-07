(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
//
(* ****** ****** *)
//
extern
fun{}
do_something(i: int): void
//
(* ****** ****** *)
//
extern
fun{}
int_foreach(n: int): void
//
implement{}
int_foreach(n) = let
//
fun loop(i: int): void =
  if i < n then (do_something(i+1); loop(i+1)) else ()
//
in
  loop(0)
end // end of [int_foreach]
//
(* ****** ****** *)

val () = let
//
implement{}
do_something(i) = println! ("Hello, world!")
//
in
  int_foreach(10)
end // end of [val]

(* ****** ****** *)
//
#include
"./../mylib/basics.dats"
//
(* ****** ****** *)

val () = let
//
implement{}
myint_foreach$fwork(i) = println! (i, ": Hello, world!")
//
in
  myint_foreach(10)
end // end of [val]

(* ****** ****** *)

implement main0() = ()

(* ****** ****** *)

(* end of [loops.dats] *)

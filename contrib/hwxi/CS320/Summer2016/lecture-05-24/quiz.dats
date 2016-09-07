(* ****** ****** *)
//
// Code used during lecture-05-24
//
(* ****** ****** *)

#include
"share/atspre_staload.hats"

(* ****** ****** *)

fun
foo(n: int): int =
  if n >= 0 then foo(n+1) else n

(* ****** ****** *)

fun
foo2(n: int): int =
  if n >= 0 then foo2(2*n+1) else n

(* ****** ****** *)

(*
val () = println! ("foo(0) = ", foo(0)) // the smallest int
*)
(*
val () = println! ("foo2(0) = ", foo2(0)) // ~1 is returned
*)

(* ****** ****** *)

implement main0 () = ()

(* ****** ****** *)

(* end of [quiz.dats] *)

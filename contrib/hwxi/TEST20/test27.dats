(*
//
// HX-2015-11-01
// Template or function?
//
*)

(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
//
(* ****** ****** *)
//
extern
fun{}
foo(x: int): int
implement
{}(*tmp*)
foo(x) = x * x
//
(* ****** ****** *)
//
extern
fun
foo_ : $d2ctype(foo<>)
implement
foo_ = lam(x) => foo(x)
//
(* ****** ****** *)
//
#ifdef
FOO_FUNCTION
macdef foo(x) = foo_ (,(x))
#endif
//
(* ****** ****** *)

val () = println! ("foo(10) = ", foo(10))
val () = println! ("foo(11) = ", foo(11))

(* ****** ****** *)

implement main0 () = ()

(* ****** ****** *)

(* end of [test27.dats] *)

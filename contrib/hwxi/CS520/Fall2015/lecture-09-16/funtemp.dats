(* ****** ****** *)
//
// Code for lecture-09-16
//
(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
//
(* ****** ****** *)
//
extern
fun{} foo1 (): int
//
implement{} foo1 () = 0
//
(* ****** ****** *)
//
extern
fun{} foo2 (): int
//
implement{} foo2 () = foo1() + 1
//
(* ****** ****** *)

implement main0 () =
{
//
val () = assertloc(foo2() = 1)
//
local
implement foo1<> () = 100
in
val () = assertloc(foo2() = 101)
end // end of [local]
//
val () = assertloc(foo2() = 1)
//
} (* end of [main0] *)

(* ****** ****** *)

(* end of [funtemp.dats] *)

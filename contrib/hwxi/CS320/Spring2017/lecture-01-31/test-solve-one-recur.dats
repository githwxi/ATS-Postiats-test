(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
//
(* ****** ****** *)
//
#staload "./solve-one-recur.dats"
//
(* ****** ****** *)
//
implement
main0((*void*)) =
{
//
val () =
println! ("intsqrt(1000) = ", intsqrt(1000))
val () =
println! ("intsqrt(1023) = ", intsqrt(1023))
val () =
println! ("intsqrt(1024) = ", intsqrt(1024))
//
} (* end of [main0] *)
//
(* ****** ****** *)

(* end of [test-while-loop.dats] *)

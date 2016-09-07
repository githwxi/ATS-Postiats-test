(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
//
(* ****** ****** *)

extern
fun factref : int -> int

(* ****** ****** *)

implement
factref(n) = let
//
val i = ref<int>(1)
val res = ref<int>(1)
//
fun loop(): void =
  if !i <= n then (!res := !res * !i; !i := !i + 1; loop()) else ()
//
in
  loop(); !res
end // end of [factref]

(* ****** ****** *)
//
implement
main0((*void*)) =
  println! ("factref(10) = ", factref(10))
//
(* ****** ****** *)

(* end of [factref.dats] *)

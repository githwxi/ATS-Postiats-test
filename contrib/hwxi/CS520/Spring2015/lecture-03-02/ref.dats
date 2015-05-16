(*
** References
*)

(* ****** ****** *)

#include
"share/atspre_staload.hats"

(* ****** ****** *)

typedef T = int

(* ****** ****** *)

val r = ref<T> (0)
val-0 = !r // assertloc(0 = !r)
val () = !r := !r + 1

(* ****** ****** *)

(*
//
// HX:
// This is how to do it
// if you want to generate JS code:
//
val r = ref{T} (0)
val-0 = r[]
val () = r[] := r[] + 1
//
*)

(* ****** ****** *)

implement main0 () = ()

(* ****** ****** *)

(* end of [ref.dats] *)

(* ****** ****** *)

#include
"share/atspre_staload.hats"

(* ****** ****** *)
(*
//
staload
UN =
"prelude/SATS/unsafe.sats"
//
*)
(* ****** ****** *)
//
val x = $UNSAFE.cast{double}(1)
//
val y = $UNSAFE.cast{int}(3.14)
//
(* ****** ****** *)

(* end of [unsafe_test.sats] *)

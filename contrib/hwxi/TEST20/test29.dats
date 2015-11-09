(*
//
// HX-2015-11-08:
// http://rosettacode.org/wiki/A%2BB#C
//
*)

(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
//
staload UN = $UNSAFE
//
(* ****** ****** *)

staload "libc/SATS/stdio.sats"

(* ****** ****** *)

implement
main0() = let
  var A: int
  var B: int
  val () =
  $extfcall
    (void, "scanf", "%d%d", addr@A, addr@B)
  // end of [val]
in
   println! ($UN.cast2int(A) + $UN.cast2int(B))
end // end of [main0]

(* ****** ****** *)

(* end of [test29.dats] *)
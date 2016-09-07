(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
//
staload "libats/libc/SATS/unistd.sats"
//
(* ****** ****** *)

implement
main0 () = let
//
fun
loop(): void =
(
  println! "Hello!"; ignoret(sleep(1)); loop()
)
//
in
  loop()
end // end of [main0]

(* ****** ****** *)

(* end of [mysleep.dats] *)

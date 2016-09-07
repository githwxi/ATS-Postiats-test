
#include
"share/atspre_staload.hats"

staload "libats/libc/SATS/stdlib.sats"

implement
main(argc, argv) = let
  val arg0 = argv[0]
  val () = assertloc(argc >= 2)
  val arg1 = argv[1]
  val errcode = system(arg1)
in
  errcode
end // end of [main]

(* ****** ****** *)

(* end of [mysystem.dats] *)
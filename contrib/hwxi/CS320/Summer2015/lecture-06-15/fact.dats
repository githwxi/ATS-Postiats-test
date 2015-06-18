//
#include
"share/atspre_staload.hats"
//
(* ****** ****** *)

extern fun fact : int -> int = "ext#C_fact"

(* ****** ****** *)

implement
main0(argc, argv) = let
  val n = 10
  val n = (if argc >= 2 then g0string2int(argv[1]) else n): int
in
  println! ("C_fact(", n, ") = ", fact(n))
end // end of [main0]

(* ****** ****** *)

(* end of [fact.dats] *)

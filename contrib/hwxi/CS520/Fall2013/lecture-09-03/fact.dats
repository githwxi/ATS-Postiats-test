//
// implementing and testing factorial
//

(* ****** ****** *)
//
// How to test: ./fact <integer>
// How to compile: patscc -o fact fact.dats
//
(* ****** ****** *)
//
#include "share/atspre_staload.hats"
//
(* ****** ****** *)

extern
fun fact (n: int): int
implement
fact (n) = if n > 0 then n * fact (n-1) else 1

(* ****** ****** *)

implement
main0 (argc, argv) = let
//
val n =
(
  if argc >= 2
    then g0string2int(argv[1]) else 10(*default*)
  // end of [if]
) : int // end of [val]
//
in
  println! ("fact(", n, ") = ", fact (n))
end // end of [main0]

(* ****** ****** *)

(* end of [fact.dats] *)

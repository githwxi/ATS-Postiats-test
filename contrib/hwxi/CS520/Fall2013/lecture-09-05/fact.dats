//
// implementing and testing factorial
//

(* ****** ****** *)
//
// How to test: ./fact <integer>
// How to compile: patscc -o fact fact.dats myatoi.c
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

%{^
//
// HX: this code is pasted
// into the generated C code
//
extern int myatoi (char *str) ;
//
%}
extern fun myatoi (string): int = "mac#"

(* ****** ****** *)

implement
main0 (argc, argv) = let
//
val n =
(
  if argc >= 2
    then myatoi(argv[1]) else 10(*default*)
  // end of [if]
) : int // end of [val]
//
in
  println! ("fact(", n, ") = ", fact (n))
end // end of [main0]

(* ****** ****** *)

(* end of [fact.dats] *)

(* ****** ****** *)
(*
// Boilerplate stuff
*)
(* ****** ****** *)

#include
"share/atspre_staload.hats"
#include
"share/HATS/atspre_staload_libats_ML.hats"

(* ****** ****** *)

extern
fun
fact : (int) -> int

implement
fact(n) = if n > 0 then n * fact(n-1) else 1

implement
main0(argc, argv) =
if argc >= 2
  then println!(fact(g0string2int(argv[1])))
  else println!(fact(0))
// end of [main]

(* ****** ****** *)

(* end of [fact.dats] *)

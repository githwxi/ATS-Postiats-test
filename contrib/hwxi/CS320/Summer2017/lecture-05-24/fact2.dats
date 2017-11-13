(* ****** ****** *)
(*
// Boilerplate stuff
*)
//
#include
"share/atspre_staload.hats"
#include
"share/HATS/atspre_staload_libats_ML.hats"
//
(* ****** ****** *)

extern
fun
fact : (int) -> int
extern
fun
fact2 : (int, int) -> int

(* ****** ****** *)

implement
fact(n) = fact2(n, 1)

implement
fact2(n, res) =
  if n > 0 then fact2(n-1, n*res) else res

implement
main0(argc, argv) =
if argc >= 2
  then println!(fact(g0string2int(argv[1])))
  else println!(fact(0))
// end of [main]

(* ****** ****** *)

(* end of [fact2.dats] *)

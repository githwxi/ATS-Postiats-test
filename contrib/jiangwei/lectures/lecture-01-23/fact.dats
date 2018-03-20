(* ****** ****** *)

#include
"share/atspre_staload.hats" // targeting C
#include
"share/atspre_staload_libats_ML.hats" // targeting C // convenience

(* ****** ****** *)

(*
extern
fun
fact : (int) -> int
*)
extern
fun fact(n: int): int

(* ****** ****** *)

(*
implement
fact(n) = let
if n > 0 then n * fact(n-1) else 1
*)

(* ****** ****** *)
//
// HX:
// this is a tail-recursive
// implementation of [fact]:
//
implement
fact(n) = let
//
  val () =
  assertloc(n >= 0)
//
  fun
  loop(n: int, res: int): int =
    if n > 0 then loop(n-1, n*res) else res
  // end of [loop]
//
in
  loop(n, 1)
end // end of [fact]

(* ****** ****** *)

implement
main0(argc, argv) = let
//
val inp =
(
if
(argc >= 2)
then
g0string2int_int(argv[1])
else 10
) : int
//
in
  println!("fact(", inp, ") = ", fact(inp))
end

(* ****** ****** *)

(* end of [fact.dats] *)

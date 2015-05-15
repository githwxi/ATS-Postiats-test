(* ****** ****** *)
//
// For illustrating
// some use of templates
//
(* ****** ****** *)

#include
"share/atspre_staload.hats"

(* ****** ****** *)

(*
extern
fun fact (x: int): int
(*
implement
fact (x) = if x > 0 then x * fact (x-1) else 1
*)
(*
implement
fact (x) = let
//
fun loop (x: int, res: int): int =
  if x > 0 then loop (x-1, x * res) else res
//
in
  loop (x, 1)
end // end of [fact]
*)
*)

(* ****** ****** *)

(*
extern
fun fact2 (x: double): double
implement
fact2 (x) = if x > 0.0 then x * fact2 (x-1.0) else 1.0
*)

(* ****** ****** *)
//
extern
fun{
t:t@ype
} fact (x: t): t
implement
{t}(*tmp*)
fact (x) =
if gisgtz_val<t> (x)
  then gmul_val_val<t> (x, fact (gpred_val<t> (x))) else gnumber_int<t> (1)
//
(* ****** ****** *)

val fact_int = fact<int>
val fact_double = fact<double>

(* ****** ****** *)

implement
main0 () =
{
//
val N = 12
val N2 = g0int2float_int_double(N)
//
val () = println! ("fact_int(", N, ") = ", fact_int(N))
val () = println! ("fact_double(", N2, ") = ", fact_double(N2))
} (* end of [main0] *)

(* ****** ****** *)

(* end of [fact.dats] *)

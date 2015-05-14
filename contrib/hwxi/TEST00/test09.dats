(*
** fix-expressions
*)

(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
//
(* ****** ****** *)

val () =
println!
(
  "fact(10) = "
, (fix f(n:int):int => if n > 0 then n*f(n-1) else 1)(10)
) (* end of [val] *)

(* ****** ****** *)

val () =
println!
(
  "fact2(10, 1) = "
, (fix f(n:int, res:int):int => if n > 0 then f(n-1, n*res) else res)(10, 1)
) (* end of [val] *)

(* ****** ****** *)

implement main0 () = ()

(* ****** ****** *)

(* end of [test09.dats] *)

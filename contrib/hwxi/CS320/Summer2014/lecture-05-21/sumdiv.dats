#include
"share/atspre_staload.hats"

(* ****** ****** *)

extern
fun sumdiv : int -> int

(*
extern
fun f_mod (n: int, i: int): int
*)
extern
fun f_mod : (int, int(*divisor*)) -> int = "ext#f_mod_in_c"

(* ****** ****** *)

(*
implement
f_mod (n, i) = n mod i // it can also be implemented in C
*)

(* ****** ****** *)

implement
sumdiv (n) = let
//
fun loop
(
  i: int, res: int
) : int =
  if i <= n then
  (
    if f_mod (n, i) = 0
      then loop (i+1, res+i) else loop (i+1, res)
    // end of [if]
  ) else res // end of [if]
//
in
  loop (1, 0)
end // end of [sumdiv]

(* ****** ****** *)

implement
main0 () =
{
val N = 28
val res = sumdiv (N)
val () = println! ("sumdiv(", N, ") = ", res)
val N = 100
val res = sumdiv (N)
val () = println! ("sumdiv(", N, ") = ", res)
}

(* ****** ****** *)

(* end of [sumdiv.dats] *)

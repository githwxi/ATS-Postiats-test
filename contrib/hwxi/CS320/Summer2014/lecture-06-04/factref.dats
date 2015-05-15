(* ****** ****** *)

#include
"share/atspre_staload.hats"

(* ****** ****** *)
//
// Some poor style
// of programming with references
//
(* ****** ****** *)

extern
fun fact (x: int): int

(* ****** ****** *)

(*

int fact (int x)
{
  int res = 1 ;
  while (x > 0) { res = x * res; x -= 1 ; }
  return res ;
}

*)

(*
//
// HX: this the right functional style
//
implement
fact (x) = let
//
fun loop (x: int, res: int): int =
  if x > 0 then loop (x-1, x*res) else res
//
in
  loop (x, 1)
end // end of [fact]
*)

(* ****** ****** *)

(*
** HX: this poor style should be avoided!
*)

implement
fact (x) = let
//
val xr = ref<int> (x)
val res = ref<int> (1)
//
fun loop (): void =
  if !xr > 0 then
    (!res := !xr * !res; !xr := !xr - 1; loop ())
  else ((*exit*)) // end of [if]
//
val () = loop ()
//
in
  !res
end // end of [fact]

(* ****** ****** *)

implement
main0 () = () where
{
//
val N = 12
//
val () = println! ("fact(", N, ") = ", fact(N))
//
} (* end of [main0] *)

(* ****** ****** *)

(* end of [factref.dats] *)

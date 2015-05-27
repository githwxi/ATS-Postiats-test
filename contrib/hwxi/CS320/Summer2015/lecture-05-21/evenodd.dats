#include
"share/atspre_staload.hats"

(* ****** ****** *)

(*
//
extern fun isevn(n: int): bool
extern fun isodd(n: int): bool
//
implement isevn(n) = if n = 0 then true else isodd(n-1)
implement isodd(n) = if n = 0 then false else isevn(n-1)
//
*)

(* ****** ****** *)
//
// mutual tail-recursion
//
fnx isevn(n: int): bool =
  if n = 0 then true else isodd(n-1)
and isodd(n: int): bool =
  if n = 0 then false else isevn(n-1)
//
(* ****** ****** *)

implement
main0 () =
{
  val N = 1000000
  val () = println! ("isevn(", N, ") = ", isevn(N))
}

(* ****** ****** *)

(* end of [evenodd.dats] *)

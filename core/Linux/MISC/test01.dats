(*
** Hello, world!
*)

(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
//
(* ****** ****** *)

fun fact(n:int):int=if n>0 then n*fact(n-1) else 1

(* ****** ****** *)

implement
main0() = assertloc(fact(10)=1*2*3*4*5*6*7*8*9*10)

(* ****** ****** *)

(* end of [test01.dats] *)

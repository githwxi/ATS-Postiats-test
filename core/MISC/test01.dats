(*
** Factorials
*)

(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
//
(* ****** ****** *)
//
fun
fact(n:int):int=if n>0 then n*fact(n-1) else 1
//
val () = assertloc(fact(10)=1*2*3*4*5*6*7*8*9*10)
//
(* ****** ****** *)
//
fun
fact
(
  n: int
) : int = res where
{
  var n: int = n
  var res: int = 1
  val () = while (n > 0) (res := res * n; n := n - 1)
}
//
val () = assertloc(fact(10)=1*2*3*4*5*6*7*8*9*10)
//
(* ****** ****** *)
//
fun
fact
(
  n: int
) : int= res where
{
  var i: int
  var res: int = 1
  val () = for(i := 1; i <= n; i := i+1) (res := res * i)
}
//
val () = assertloc(fact(10)=1*2*3*4*5*6*7*8*9*10)
//
(* ****** ****** *)

implement main0() = ()

(* ****** ****** *)

(* end of [test01.dats] *)

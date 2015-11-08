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
//
val res =
(
fix
fact2(i: int, res: int): int =<cloref1>
  if i < n then fact2(i+1, (i+1)*res) else res
) (0, 1)
//
} (* end of [fact] *)
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
  val () =
  while (n > 0) (res := res * n; n := n - 1)
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
) : int = res where
{
  var i: int
  var res: int = 1
  val () =
  for(i := 1; i <= n; i := i+1)(res := res * i)
}
//
val () = assertloc(fact(10)=1*2*3*4*5*6*7*8*9*10)
//
(* ****** ****** *)
//
fun
fact{n:nat}
(
  n: int(n)
) : int= res where
{
  var n: int = n
  var res: int = 1
  val () =
  while*
  {n:nat} .<n>. (n:int(n)) =>
    (n > 0) (res := res * n; n := n - 1)
  // end of [val]
}
//
val () = assertloc(fact(10)=1*2*3*4*5*6*7*8*9*10)
//
(* ****** ****** *)
//
fun
fact{n:nat}
(
  n: int(n)
) : int= res where
{
  var i: int
  var res: int = 1
  val () =
  for*
  {i:nat | i <= n} .<n-i>. (i: int(i)) =>
    (i := 0; i < n; i := i+1) (res := res * (i+1))
  // end of [val]
}
//
val () = assertloc(fact(10)=1*2*3*4*5*6*7*8*9*10)
//
(* ****** ****** *)
//
val
fact =
fix f(n:int): int => if n > 0 then n*f(n-1) else 1
//
val () = assertloc(fact(10)=1*2*3*4*5*6*7*8*9*10)
//
(* ****** ****** *)
//
val
fact =
fix f: int -> int =>
  lam (x) => if x >= 1 then x * f(x-1) else 1
//
val () = assertloc(fact(10)=1*2*3*4*5*6*7*8*9*10)
//
(* ****** ****** *)

implement main0() = ((*void*))

(* ****** ****** *)

(* end of [test01.dats] *)

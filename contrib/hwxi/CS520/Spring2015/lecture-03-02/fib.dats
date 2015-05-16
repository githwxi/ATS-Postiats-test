(*
** Combining
** programming with
** theorem-proving
*)

(* ****** ****** *)

#include
"share/atspre_staload.hats"

(* ****** ****** *)

dataprop
FIB(int, int) =
| FIBbas0(0, 0)
| FIBbas1(1, 1)
| {n:int | n >= 2}{r0,r1:int}
  FIBind2(n, r0+r1) of (FIB(n-2, r0), FIB(n-1, r1))

(* ****** ****** *)

extern
fun fib : {n:nat} (int(n)) -> [r:int] (FIB(n, r) | int(r))

(* ****** ****** *)

fun
loop
  {n:int}
  {i:int | 2 <= i; i <= n}
  {r0,r1:int}
(
  pf0: FIB(i-2, r0)
, pf1: FIB(i-1, r1)
| n: int(n), i:int(i), r0: int(r0), r1: int(r1)
) : [r:int] (FIB(n, r) | int(r)) =
(
if
i < n
then loop (pf1, FIBind2(pf0, pf1) | n, i+1, r1, r0+r1)
else (FIBind2(pf0, pf1) | r0+r1)
)

(* ****** ****** *)

implement
fib(n) =
if
n >= 2
then loop (FIBbas0(), FIBbas1() | n, 2, 0, 1)
else (if n = 0 then (FIBbas0() | 0) else (FIBbas1() | 1))

(* ****** ****** *)

implement
main0 () = println! ("fib(10) = ", (fib(10)).1)

(* ****** ****** *)

(* end of [fib.dats] *)

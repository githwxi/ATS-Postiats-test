(* ****** ****** *)
//
// Code for lecture-09-28
//
(* ****** ****** *)
//
dataprop
FIB(int(*n*), int(*r*)) =
| FIBbas0 (0, 0)
| FIBbas1 (1, 1)
| {n:nat}{r0,r1:int}
  FIBind2 (n+2, r0+r1) of (FIB(n, r0), FIB(n+1, r1))
//
(* ****** ****** *)

extern
fun
fibats{n:nat}(n: int(n)): [r:int] (FIB(n, r) | int(r))

(* ****** ****** *)

implement
fibats(n) =
(
case+ n of
| 0 => (FIBbas0 | 0)
| 1 => (FIBbas1 | 1)
| _ =>> let
    val (pf0 | r0) = fibats(n-2)
    val (pf1 | r1) = fibats(n-1)
  in
    (FIBind2(pf0, pf1) | r0 + r1)
  end // end of [_]
)

(* ****** ****** *)

(* end of [fib.dats] *)

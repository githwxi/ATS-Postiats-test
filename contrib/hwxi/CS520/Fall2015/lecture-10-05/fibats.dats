(*
** Code for lecture-10-05
*)

(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
//
(* ****** ****** *)
//
dataprop
FIB(int(*n*), int(*r*)) =
| FIBbas0 (0, 0) of ()
| FIBbas1 (1, 1) of ()
| {n:nat}{r0,r1:int}
  FIBind2 (n+2, r0+r1) of (FIB(n, r0), FIB(n+1, r1))
//
(* ****** ****** *)
//
extern
fun
fibats : {n:nat} (int(n)) -> [r:int] (FIB(n, r) | int(r))
//
(* ****** ****** *)
(*
//
implement
fibats(n) =
(
case+ n of
| 0 => (FIBbas0() | 0)
| 1 => (FIBbas1() | 1)
| _ =>> let
    val (pf0 | r0) = fibats(n-2)
    val (pf1 | r1) = fibats(n-1)
  in
    (FIBind2(pf0, pf1) | r0 + r1)
  end // end of [let]
)
//
*)
(* ****** ****** *)
//
implement
fibats{n}(n) = let
//
fun
loop{i:nat | i <= n}{r0,r1:int}
(
  pf0: FIB(i, r0), pf1: FIB(i+1, r1) | i: int(i), r0: int(r0), r1: int(r1)
) : [r:int] (FIB(n, r) | int(r)) =
  if i < n then loop (pf1, FIBind2(pf0, pf1) | i+1, r1, r0+r1) else (pf0 | r0)
//
in
  loop(FIBbas0(), FIBbas1() | 0, 0, 1)
end // end of [fibats]

(* ****** ****** *)

implement main0 () = ()

(* ****** ****** *)

(* end of [fibats.dats] *)

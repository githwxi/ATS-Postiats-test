(* ****** ****** *)
//
// HX-2105-12-28:
// For answering the following question
// https://groups.google.com/forum/#!topic/ats-lang-users/zht_Kex7y-0
//
(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
//
(* ****** ****** *)

fun ifold2
(
  n: int, f: (int, int) -<cloref1> int, ini: int
) : int =
  if n > 0 then f (ifold2 (n-1, f, ini), n) else ini
// end of [ifold2]
    
(* ****** ****** *)

fun{}
sqrmodsum
  (n: int, d: int): int =
(
ifold2
( n
, lam (res, x) =>
    if x mod d = 0 then res + x * x else res
  // end of [lam]
, 0
) (* ifold2 *)
) (* end of [sqrmodsum] *)

(* ****** ****** *)

fun{}
sqrmodsum2
  (n: int, d: int): int = let
//
var
fopr =
lam@(res: int, x: int): int =<clo1>
  if x mod d = 0 then res + x * x else res
//
in
  ifold2(10, $UNSAFE.cast(addr@fopr), 0)
end // end of [sqrmodsum2]

(* ****** ****** *)

(*
//
// This one calls 'malloc':
//
val () = println! ("sqrmodsum(10, 2) = ", sqrmodsum(10, 2))
*)
val () = println! ("sqrmodsum2(10, 2) = ", sqrmodsum2(10, 2))

(* ****** ****** *)

implement main0 () = ()

(* ****** ****** *)

(* end of [test31.dats] *)

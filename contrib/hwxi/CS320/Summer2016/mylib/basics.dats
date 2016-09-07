(* ****** ****** *)
//
// Basic functions in mylib
//
(* ****** ****** *)
//
extern
fun{}
myint_foreach$fwork(i: int): void
//
(* ****** ****** *)
//
extern
fun{}
myint_foreach(n: int): void
//
implement{}
myint_foreach(n) = let
//
fun loop(i: int): void =
  if i < n then (myint_foreach$fwork(i+1); loop(i+1)) else ()
//
in
  loop(0)
end // end of [myint_foreach]
//
(* ****** ****** *)

(* end of [basics.dats] *)

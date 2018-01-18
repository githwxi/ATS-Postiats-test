(* ****** ****** *)

#include
"share/atspre_staload.hats"

(* ****** ****** *)

fnx isevn(n: int): bool =
  if n > 0 then isodd(n-1) else true

and isodd(n: int): bool =
  if n > 0 then isevn(n-1) else false
  
(* ****** ****** *)

implement
main0 () = println! (isevn(1000001))

(* ****** ****** *)

(* end of [evenodd.dats] *)

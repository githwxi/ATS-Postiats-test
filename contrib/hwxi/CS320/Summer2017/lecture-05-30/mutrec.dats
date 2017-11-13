(* ****** ****** *)

#include
"share/atspre_staload.hats"

(* ****** ****** *)

fnx isevn(x: int): bool =
  if x = 0 then true else isodd(x-1)

and isodd(x: int): bool =
  if x = 0 then false else isevn(x-1)

(* ****** ****** *)

implement main0 () = println! (isevn(1000000))

(* ****** ****** *)

(* end of [mutrec.dats] *)

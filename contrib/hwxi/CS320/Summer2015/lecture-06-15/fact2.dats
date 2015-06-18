//
#include
"share/atspre_staload.hats"
//
(* ****** ****** *)

#define ATS_DYNLOADFLAG 0

(* ****** ****** *)

extern fun fact : int -> int = "ext#ATS_fact"

(* ****** ****** *)
//
implement fact =
  fix f(n:int):int => if n > 0 then n*f(n-1) else 1
//
(* ****** ****** *)

(* end of [fact.dats] *)

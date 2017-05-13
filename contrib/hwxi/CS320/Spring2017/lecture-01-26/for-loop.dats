(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
//
#define ATS_DYNLOADFLAG 0
//
(* ****** ****** *)

extern
fun
for_loop
(
  n: int, do_sth: int -<cloref1> void
) : void

implement
for_loop
  (n, do_sth) =
  loop(0) where
{
fun
loop(i: int): void =
  if i < n then (do_sth(i); loop(i+1)) else ()
// end of [loop]
}

(* ****** ****** *)

(* end of [for-loop.dats] *)

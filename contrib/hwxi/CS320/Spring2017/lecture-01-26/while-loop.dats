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
while_loop
(
  test: int -<cloref1> bool
) : int

implement
while_loop
  (test) =
  loop(0) where
{
fun
loop(i: int): int =
  if test(i) then loop(i+1) else i
// end of [loop]
}

(* ****** ****** *)

(* end of [while-loop.dats] *)

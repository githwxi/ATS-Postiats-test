(* ****** ****** *)
//
#include "share/atspre_staload.hats"
//
(* ****** ****** *)

#define ATS_PACKNAME "HanoiTowers"

(* ****** ****** *)

typedef pole = string

extern
fun move (src: pole, dst: pole): void

implement
move (src, dst) = println! (src, " -> ", dst)

(* ****** ****** *)

extern
fun nmove (src: pole, dst: pole, spare: pole, n: int): void

implement
nmove (src, dst, spare, n) =
if n > 0 then
{
  val () = nmove (src, spare, dst, n-1)
  val () = move (src, dst)
  val () = nmove (spare, dst, src, n-1)
} // end of [if]

(* ****** ****** *)

implement
main0 (argc, argv) =
{
  val n =
  (
    if argc >= 2 then g0string2int(argv[1]) else 3
  ) : int // end of [val]
  val () = nmove ("A", "B", "C", n)
}

(* ****** ****** *)

(* end of [hanoi.dats] *)

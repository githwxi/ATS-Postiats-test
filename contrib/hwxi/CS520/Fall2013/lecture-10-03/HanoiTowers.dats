(*
** An example for
** illustrating linear types
*)
(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
//
(* ****** ****** *)
//
abstype tower = ptr
//
absvt@ype disk = int // linear type
//
(* ****** ****** *)

extern
fun tower_get_name (tower): string

extern
fun tower_pop (tower): disk
extern
fun tower_push (tower, disk): void

(* ****** ****** *)

extern
fun tower_make (name: string, n: int): tower

(* ****** ****** *)

extern
fun move (src: tower, dst: tower): void
extern
fun nmove (src: tower, dst: tower, tmp: tower, n: int): void

(* ****** ****** *)

implement
move (src, dst) =
{
  val x = tower_pop (src)
  val () = tower_push (dst, x)
  val () = println! (tower_get_name(src), " -> ", tower_get_name(dst))
}

(* ****** ****** *)

implement
nmove
(
  src, dst, tmp, n
) = (
if n > 0 then
{
  val () = nmove (src, tmp, dst, n-1)
  val () = move (src, dst)
  val () = nmove (tmp, dst, src, n-1)
} else ((*void*)) // end of [if]
) (* end of [nmove] *)

(* ****** ****** *)

staload "libats/ML/SATS/basis.sats"
staload "libats/ML/SATS/list0.sats"
staload _ = "libats/ML/DATS/list0.dats"

(* ****** ****** *)

local

assume disk = int
assume tower = '{
  name= string, disks = ref (list0(int))
} // end of [tower]

in (* in of [local] *)

implement
tower_get_name (tow) = tow.name

implement
tower_pop
  (tow) = x where
{
  val rf = tow.disks
  val xs = !rf
  val-cons0(x, xs) = xs
  val () = !rf := xs
} (* end of [pop] *)

implement
tower_push
  (tow, x) = let
//
val rf = tow.disks in !rf := cons0{int}(x, !rf)
//
end // end of [tower_push]

implement
tower_make (name, n) = let
//
val disks = ref<list0(int)> (list0_make_intrange (0, n))
//
in '{
  name= name, disks= disks
} end // end of [tower_make]

end // end of [local]

(* ****** ****** *)

implement
main0 () =
{
//
val A = tower_make ("A", 8)
val B = tower_make ("B", 0)
val C = tower_make ("C", 0)
//
val () = nmove (A, B, C, 8)
//
} (* end of [main0] *)

(* ****** ****** *)

(* end of [HanoiTowers.dats] *)

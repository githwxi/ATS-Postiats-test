(*
//
// HX-2015-11-03
//
// For answering this question:
// https://groups.google.com/forum/#!topic/ats-lang-users/mkv_IeEJ4Tg
//
*)

(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
//
(* ****** ****** *)

fun{}
clamp
  {l,u:int | l <= u}
(
  l: int(l), x: int, u: int(u)
) : intBtwe(l,u) =
  let val x = g1ofg0(x) in min(max(l, x), u) end

(* ****** ****** *)

macdef u8(x) = clamp(0, ,(x), 255)
macdef i8(x) = clamp(~128, ,(x), 127)

(* ****** ****** *)

implement
main0 () =
{
//
val () = assertloc(u8(123) = 123)
val () = assertloc(u8(256) = 255)
val () = assertloc(i8(128) = 127)
val () = assertloc(i8(~128) = ~128)
//
} (* end of [main0] *)

(* ****** ****** *)

(* end of [test28.dats] *)

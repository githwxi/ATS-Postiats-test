(* ****** ****** *)
//
// HX-2016-01-30:
//
// "unconventional" style
//
(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
//
(* ****** ****** *)

extern
fun
show_triangle(int): void
extern
fun
show_triangle_aux(int, int): void

(* ****** ****** *)

implement
show_triangle_aux
  (level, maxLevel) =
if
level > 0
then (
//
show_triangle_aux
  (level-1, maxLevel);
//
let fun loop (i: int): void =
(
if i <= maxLevel - level
then (print! (" "); loop (i + 1))
else ()
)
in
loop (1)
end;
//
let fun loop (i: int): void =
(
if i <= 2*level-1
then (print! ("*"); loop (i + 1))
else ()
)
in
loop (1)
end;
//
let fun loop (i: int): void =
(
if i <= maxLevel - level
then (print! (" "); loop (i + 1))
else ()
)
in
loop (1)
end;
//
println!();
) (* end of [else] *)

(* ****** ****** *)
//
implement
show_triangle(level) =
  show_triangle_aux(level, level)
//
(* ****** ****** *)

implement
main0() =
{
  val () = show_triangle(3)
  val () = show_triangle(5)
}

(* ****** ****** *)

(* end of [test36.dats] *)

(* ****** ****** *)

abstype point = ptr
abstype color = ptr

(* ****** ****** *)

extern
fun draw_triangle
  (point, point, point, color): void

extern
fun midpoint (point, point): point

extern
fun draw_Sierpinksi
  (point, point, point, color, color, n: int): void

(* ****** ****** *)

implement
draw_Sierpinksi
(
  p1, p2, p3, c1, c2, n
) = let
//
(*
val () =
println! ("draw_Sierpinksi: enter")
*)
//
in
//
if (
n > 0
) then {
  val p12 = midpoint (p1, p2)
  val p23 = midpoint (p2, p3)
  val p31 = midpoint (p3, p1)
  val () = draw_triangle (p12, p23, p31, c2)
  val () = draw_Sierpinksi (p1, p12, p31, c1, c2, n-1)
  val () = draw_Sierpinksi (p12, p2, p23, c1, c2, n-1)
  val () = draw_Sierpinksi (p31, p23, p3, c1, c2, n-1)
} else {
  val () = draw_triangle (p1, p2, p3, c1)
} (* end of [if] *)
//
end // end of [draw_Sierpinksi]

(* ****** ****** *)

(* end of [Sierpinski.dats] *)

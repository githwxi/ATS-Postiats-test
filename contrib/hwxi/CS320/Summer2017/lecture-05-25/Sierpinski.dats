(* ****** ****** *)

abstype point
abstype color

(* ****** ****** *)

extern
fun
midpoint : (point, point) -> point

(* ****** ****** *)

extern
fun
draw_triangle
(
p1: point, p2: point, p3: point, c0: color
) : void


extern
fun
draw_Sierpinski
(
p1: point, p2: point, p3: point, c1: color, c2: color, n0: int(*depth*)
) : void

implement
draw_Sierpinski
(p1, p2, p3, c1, c2, n0) =
if
(n0 > 0)
then let
//
  val p12 = midpoint(p1, p2)
  val p23 = midpoint(p2, p3)
  val p31 = midpoint(p3, p1)
//
  val () = draw_triangle(p12, p23, p31, c1)
  val () = draw_Sierpinski(p1, p12, p31, c1, c2, n0-1)
  val () = draw_Sierpinski(p12, p2, p23, c1, c2, n0-1)
  val () = draw_Sierpinski(p31, p23, p3, c1, c2, n0-1)
//
in
  // nothing
end // end of [then]
else ((*done*))

(* ****** ****** *)

(* end of [Sierpinski.dats] *)

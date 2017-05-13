(* ****** ****** *)
//
// HX-2017-02-02
// For drawing Sierpinski triangles
//
(* ****** ****** *)

abstype point
abstype color

(* ****** ****** *)

extern
fun
midpoint: (point, point) -> point

extern
fun
drawTriangle
(p1: point, p2: point, p3: point, clr: color): void

extern
fun
drawSierpinski
(n0: int, p1: point, p2: point, p3: point, clr: color): void

implement
drawSierpinski
(n0, p1, p2, p3, clr) =
if
(n0 > 0)
then let
  val p12 = midpoint(p1, p2)
  val p23 = midpoint(p2, p3)
  val p31 = midpoint(p3, p1)
  val () = drawTriangle(p12, p23, p31, clr)
  val () = drawSierpinski(n0-1, p1, p12, p31, clr)
  val () = drawSierpinski(n0-1, p12, p2, p23, clr)
  val () = drawSierpinski(n0-1, p31, p23, p3, clr)
in
  // nothing
end // end of [then]
else ((*done*))
// end of [drawSierpinski]

(* ****** ****** *)

(* end of [drawSierpinski.dats] *)

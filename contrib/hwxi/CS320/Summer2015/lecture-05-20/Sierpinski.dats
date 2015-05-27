//
#include
"share/atspre_staload.hats"
//
(* ****** ****** *)

(*
staload "./DrawingAPI.sats"
*)

(* ****** ****** *)

abstype point
abstype color
abstype vector

(* ****** ****** *)
//
extern
fun
sub_point_point(point, point): vector
//
extern
fun
add_point_vector(point, vector): point
//
extern
fun
div_vector_scalar(vector, double): vector
//
overload - with sub_point_point
overload + with add_point_vector
overload / with div_vector_scalar
//
(* ****** ****** *)
//
extern
fun
draw_triangle
  (point, point, point, color): void
//
(* ****** ****** *)

extern
fun draw_Sierpinski
(
  p1: point, p2: point, p3: point, c: color, n: int
) : void // end of [draw_Sierpinski]

(* ****** ****** *)

implement
draw_Sierpinski
  (p1, p2, p3, c, n) = let
//
macdef draw = draw_Sierpinski
//
in
//
if n >= 1 then let
  val p12 = p1 + (p2 - p1) / 2.0
  val p23 = p2 + (p3 - p2) / 2.0
  val p31 = p3 + (p1 - p3) / 2.0
  val () = draw (p1, p12, p31, c, n-1)
  val () = draw (p12, p2, p23, c, n-1)
  val () = draw (p31, p23, p3, c, n-1)
  val () = draw_triangle (p12, p23, p31, c)
in
  // nothing
end // end of [if]
//
end // end of [draw_Sierpinski]

(* ****** ****** *)

(* end of [Sierpinski.dats] *)

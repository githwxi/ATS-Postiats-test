(*
** Demoing refinement-based programming
*)

abstype point

extern
fun midpoint(point, point): point

extern
fun
drawTriangle(point, point, point): void

extern
fun
drawSierpinski
  (point, point, point, n:int): void

implement
drawSierpinski
  (p1, p2, p3, n) =
(
if
n = 0
then drawTriangle(p1, p2, p3)
else let
  val p12 = midpoint(p1, p2)
  val p23 = midpoint(p2, p3)
  val p31 = midpoint(p3, p1)
  val () = drawSierpinski(p1, p12, p31, n-1)
  val () = drawSierpinski(p12, p2, p23, n-1)
  val () = drawSierpinski(p31, p23, p3, n-1)
in
  // nothing
end // end of [else]
)

(* ****** ****** *)

(* end of [Sierpinski2.dats] *)

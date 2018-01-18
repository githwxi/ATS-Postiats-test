(* ****** ****** *)

abstype point

(* ****** ****** *)

extern
fun
midpoint(p1: point, p2: point): point

(* ****** ****** *)
//
extern
fun
TriangleRemove
  (p1: point, p2: point, p3: point): void
//
(* ****** ****** *)

extern
fun
SierpinskiDraw(A: point, B: point, C: point): void

(* ****** ****** *)

implement
SierpinskiDraw
  (A0, B0, C0) = let
  val AB = midpoint(A0, B0)
  val BC = midpoint(B0, C0)
  val CA = midpoint(C0, A0)
  val () = TriangleRemove(AB, BC, CA)
  val () = SierpinskiDraw(A0, AB, CA)
  val () = SierpinskiDraw(B0, BC, AB)
  val () = SierpinskiDraw(C0, CA, BC)
in
  // nothing
end // end of [SierpinskiDraw]

(* ****** ****** *)

(* end of [Sierpinski.dats] *)

#include
"share/atspre_staload.hats"

staload "./Sierpinski2.dats"

(*
assume
point = $tup(int, int)

implement
midpoint (p1, p2) =
  $tup((p1.0 + p2.0) / 2, (p1.1 + p2.1) / 2)

*)

assume
point = $rec{ x= int, y= int }

implement
midpoint (p1, p2) =
  $rec{x=(p1.x + p2.x) / 2, y=(p1.y + p2.y) / 2}

(* ****** ****** *)

(* end of [Sierpinski2_point.dats] *)

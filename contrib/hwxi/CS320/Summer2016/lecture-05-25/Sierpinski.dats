(* ****** ****** *)
(*
//
abstype mycolor
abstype mypoint
//
*)
(* ****** ****** *)

extern
fun
point_x : mypoint -> int
extern
fun
point_y : mypoint -> int
extern
fun
point_make : (int, int) -> mypoint

(* ****** ****** *)
//
extern
fun
midpoint : (mypoint, mypoint) -> mypoint
//
implement
midpoint(p1, p2) =
  point_make
    ( (point_x(p1) + point_x(p2))/2
    , (point_y(p1) + point_y(p2))/2 )
  // point_make
//
(* ****** ****** *)
//
extern
fun{}
mydraw_triangle
  : (mycolor, mypoint, mypoint, mypoint) -> void
//
(* ****** ****** *)
//
extern
fun{}
mydraw_sierpinski:
(
  mycolor, mycolor
, mypoint, mypoint, mypoint, int(*level*)
) -> void // end of [mydraw_sierpinski]
//
(* ****** ****** *)

implement
{}(*tmp*)
mydraw_sierpinski
  (c1, c2, p1, p2, p3, n) =
{
//
fun
aux
(
  p1: mypoint, p2: mypoint, p3: mypoint, n: int
) : void =
if
n > 0
then {
//
  val p12 = midpoint(p1, p2)
  val p23 = midpoint(p2, p3)
  val p31 = midpoint(p3, p1)
  val () = mydraw_triangle(c2, p12, p23, p31)
  val () = aux(p1, p12, p31, n-1)
  val () = aux(p12, p2, p23, n-1)
  val () = aux(p31, p23, p3, n-1)
//
} (* end of [then] *)
else () // end of [else]
//
val () = mydraw_triangle(c1, p1, p2, p3)
val () = aux(p1, p2, p3, n)
//
} (* end of [mydraw_sierpinski] *)

(* ****** ****** *)

(* end of [Sierpinski.dats] *)

(* ****** ****** *)

typedef int2 = $tup(int, int)

(* ****** ****** *)

typedef point = $tup(double, double)
typedef triangle = $tup(point, point, point)

(* ****** ****** *)

val p1 = $tup(1.0, 1.0)

val p1_x = p1.0 and p1_y = p1.1

(* ****** ****** *)

implement main0() = ((*void*))

(* ****** ****** *)

(* end of [tuple.dats] *)

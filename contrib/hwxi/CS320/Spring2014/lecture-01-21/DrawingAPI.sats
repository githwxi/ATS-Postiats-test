(*
** Simple API for drawing
*)

(* ****** ****** *)

abstype point
abstype vector

(* ****** ****** *)

fun point_make
  (x: double, y: double): point

(* ****** ****** *)

fun add_pvp (p: point, v: vector): point; overload + with add_pvp
fun sub_ppv (p1: point, p2: point): vector; overload - with sub_ppv

(* ****** ****** *)

fun add_vvv (v2: vector, v2: vector): vector; overload + with add_vvv
fun mul_kvv (k1: double, v2: vector): vector; overload * with mul_kvv
fun div_vkv (v1: vector, k2: double): vector; overload / with div_vkv

(* ****** ****** *)

fun vrotate (v0: vector, radian: double): vector

(* ****** ****** *)

fun dotprod (v1: vector, v2: vector): double // inner product

(* ****** ****** *)

abstype color

(* ****** ****** *)

fun color_make_rgb (r: double, g: double, b: double): color

(* ****** ****** *)

fun draw_triangle (p1: point, p2: point, p3: point, color): void

(* ****** ****** *)

(* end of [DrawingAPI.sats] *)

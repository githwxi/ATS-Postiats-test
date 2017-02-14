(*
** Mergesort animation
*)

(* ****** ****** *)

#define ATS_MAINATSFLAG 1
#define ATS_DYNLOADNAME "my_dynload"

(* ****** ****** *)
//
#define
LIBATSCC2JS_targetloc
"$PATSHOME\
/contrib/libatscc2js/ATS2-0.3.2"
//
(* ****** ****** *)
//
#staload
UN = "prelude/SATS/unsafe.sats"
//
(* ****** ****** *)
//
#include
"{$LIBATSCC2JS}/staloadall.hats"
//
(* ****** ****** *)
//
#staload
"{$LIBATSCC2JS}/SATS/HTML/canvas-2d/canvas2d.sats"
//
(* ****** ****** *)

#define N 128

(* ****** ****** *)
//
val
theArray = A where
{
//
val A =
arrayref_make_elt{double}(N, 0.0)
val () =
arrayref_foreach_cloref(A, N, lam(i) => A[i] := JSmath_random())
//
} (* end of [val] *)
//
(* ****** ****** *)
//
// mydraw:
// A simple drawing API
//
(* ****** ****** *)
//
(*
#ifndef JSMYDRAW_MYDRAW_DATS
#define JSMYDRAW_MYDRAW_DATS 1
*)
//
(* ****** ****** *)

abstype point_type = ptr
typedef point = point_type
abstype vector_type = ptr
typedef vector = vector_type

(* ****** ****** *)
//
extern
fun
point_make_xy
  (x: double, y: double) : point
//
(* ****** ****** *)
//
extern
fun
point_get_x (point): double
and
point_get_y (point): double
//
overload .x with point_get_x
overload .y with point_get_y
//
(* ****** ****** *)

local
//
assume
point_type =
  $tup(double, double)
//
in (*in-of-local*)
//
implement
point_make_xy (x, y) = $tup(x, y)
//
implement point_get_x (p) = p.0
implement point_get_y (p) = p.1
//
end // end of [local]

(* ****** ****** *)
//
extern
fun
vector_make_xy
  (vx: double, vy: double): vector
//
(* ****** ****** *)
//
extern
fun
vector_get_x (vector): double
and
vector_get_y (vector): double
//
overload .x with vector_get_x
overload .y with vector_get_y
//
(* ****** ****** *)

local
//
assume
vector_type =
  $tup(double, double)
//
in (*in-of-local*)
//
implement
vector_make_xy (x, y) = $tup(x, y)
//
implement vector_get_x (v) = v.0
implement vector_get_y (v) = v.1
//
end // end of [local]

(* ****** ****** *)
//
extern
fun
add_pvp (point, vector): point
extern
fun
sub_ppv (p1: point, p2: point): vector
//
overload + with add_pvp
overload - with sub_ppv
//
(* ****** ****** *)
//
implement
add_pvp (p, v) =
  point_make_xy (p.x() + v.x(), p.y() + v.y())
implement
sub_ppv (p1, p2) =
  vector_make_xy (p1.x() - p2.x(), p1.y() - p2.y())
//
(* ****** ****** *)
//
extern
fun
add_vvv (v1: vector, v2: vector): vector
and
sub_vvv (v1: vector, v2: vector): vector
//
(* ****** ****** *)
//
implement
add_vvv (v1, v2) =
  vector_make_xy (v1.x() + v2.x(), v1.y() + v2.y())
implement
sub_vvv (v1, v2) =
  vector_make_xy (v1.x() - v2.x(), v1.y() - v2.y())
//
(* ****** ****** *)
//
extern
fun
mul_kvv (k: double, v: vector): vector
and
div_vkv (v: vector, k: double): vector
//
overload + with add_vvv
overload - with sub_vvv
overload * with mul_kvv
overload / with div_vkv
//
(* ****** ****** *)
//
implement
mul_kvv (k, v) = vector_make_xy (k * v.x(), k * v.y())
implement
div_vkv (v, k) = vector_make_xy (v.x() / k, v.y() / k)
//
(* ****** ****** *)

abstype color_type = ptr
typedef color = color_type

(* ****** ****** *)
//
extern
fun
color_make_rgb
(
  r: double, g: double, b: double
) : color // end-of-function
//
(* ****** ****** *)
//
extern
fun color_get_r : color -> double
and color_get_g : color -> double
and color_get_b : color -> double
//
overload .r with color_get_r
overload .g with color_get_g
overload .b with color_get_b
//
(* ****** ****** *)

local
//
assume
color_type =
  $tup(double, double, double)
//
in (*in-of-local*)
//
implement
color_make_rgb (r, g, b) = $tup(r, g, b)
//
implement color_get_r (c) = c.0
implement color_get_g (c) = c.1
implement color_get_b (c) = c.2
//
end // end of [local]

(* ****** ****** *)

extern
fun{}
draw3p
  (p1: point, p2: point, p3: point): void
// end of [draw3p]

(* ****** ****** *)

extern
fun{}
draw4p
  (p1: point, p2: point, p3: point, p4: point): void
// end of [draw4p]

(* ****** ****** *)
//
// HX:
// p1, p2, p3 and p4 are positioned CCW
//
extern
fun{
} mydraw_bargraph
(
  n: intGte(1)
, p1: point, p2: point, p3: point, p4: point
) : void // end of [mydraw_bargraph]
//
extern
fun{}
mydraw_bargraph$fcell
(
  i: intGte(0)
, p1: point, p2: point, p3: point, p4: point
) : void // end-of-function
//
implement
{}(*tmp*)
mydraw_bargraph
  (n, p1, p2, p3, p4) = let
//
val a = 1.0 / n
val v12 = a * (p2 - p1)
val v43 = a * (p3 - p4)
//
prval
[n:int]
EQINT() = eqint_make_gint (n)
//
fun loop
  {i:nat | i < n}
(
  i: int (i), p1: point, p4: point
) : void = let
//
val p1_new = p1 + v12
val p4_new = p4 + v43
//
val () =
mydraw_bargraph$fcell (i, p1, p1_new, p4_new, p4)
//
val i1 = i + 1
//
in
  if i1 < n then loop (i1, p1_new, p4_new) else ()
end // end of [loop]
//
in
  loop (0, p1, p4)
end // end of [mydraw_bargraph]

(* ****** ****** *)
//
extern
fun
draw_update((*void*)): void = "mac#"
extern
fun
draw_theArray (ctx: canvas2d): void = "mac#"
//
(* ****** ****** *)

local
//
val theP1 = ref{point}($UN.cast{point}(0))
val theP2 = ref{point}($UN.cast{point}(0))
val theP3 = ref{point}($UN.cast{point}(0))
val theP4 = ref{point}($UN.cast{point}(0))
//
in (* in-of-local *)
//
extern
fun theP1_get (): point
extern
fun theP2_get (): point
extern
fun theP3_get (): point
extern
fun theP4_get (): point
//
extern
fun theP1_set (x: double, y: double): void = "mac#"
extern
fun theP2_set (x: double, y: double): void = "mac#"
extern
fun theP3_set (x: double, y: double): void = "mac#"
extern
fun theP4_set (x: double, y: double): void = "mac#"
//
implement
theP1_get () = theP1[]
implement
theP2_get () = theP2[]
implement
theP3_get () = theP3[]
implement
theP4_get () = theP4[]
//
implement
theP1_set (x, y) = theP1[] := point_make_xy (x, y)
implement
theP2_set (x, y) = theP2[] := point_make_xy (x, y)
implement
theP3_set (x, y) = theP3[] := point_make_xy (x, y)
implement
theP4_set (x, y) = theP4[] := point_make_xy (x, y)
//
end // end of [local]

(* ****** ****** *)
//
implement
draw_theArray
  (ctx) = let
//
val p1 = theP1_get()
val p2 = theP2_get()
val p3 = theP3_get()
val p4 = theP4_get()
//
implement
mydraw_bargraph$fcell<>
(
  i, p1, p2, p3, p4
) = let
//
val i =
$UN.cast{natLt(N)}(i)
val a = theArray[i]
//
macdef
floor = JSmath_floor
//
val c = String(floor(a * 192))
//
val rgb = "rgb("+c+","+c+","+c+")"
val ((*void*)) = ctx.fillStyle(rgb)
//
val p3 = p2+a*(p3-p2)
val p4 = p1+a*(p4-p1)
//
val () = ctx.beginPath()
val () = ctx.moveTo(p1.x(), p1.y())
val () = ctx.lineTo(p2.x(), p2.y())
val () = ctx.lineTo(p3.x(), p3.y())
val () = ctx.lineTo(p4.x(), p4.y())
val () = ctx.closePath()
//
val ((*void*)) = ctx.fill((*void*))
//
in
  // nothing
end // end of [mydraw_bargraph$fcell]
//
val () = $extfcall(void, "theCtx2d_clear")
val () = mydraw_bargraph<> (N, p1, p2, p3, p4)
//
in
  // nothing
end // end of [draw_theArray]
//
(* ****** ****** *)

fun
rotate_right
{i,j:int |
 0 <= i; i < j; j < N}
(
 i: int(i), j: int(j)
) : void = let
//
val A = theArray
//
fun
loop
(
  v0: double
, i1: intBtwe(i, j)
) : void =
(
if
i1 < j
then let
  val v1 = A[i1]
in
  A[i1] := v0; loop (v1, i1+1)
end // end of [then]
else (A[j] := v0) // end of [else]
// end of [if]
) (* end of [loop] *)
//
in
  loop (A[j], i)
end // end of [rotate_right]

(* ****** ****** *)
//
extern
fun
theContinuation_save
  (fwork: () -<cloref1> void): void = "mac#"
//
extern
fun
theContinuation_exec((*void*)): void = "mac#"
//
(* ****** ****** *)

extern
fun
kmsort2
{i,j:nat |
 i <= j; j <= N}
(
  i: int(i), j: int(j), kont: () -<cloref1> void
) : void // end of [kmsort2]
extern
fun
kmerge2
{i,i2,j:nat |
 i <= i2; i2 <= j; j <= N}
(
  i: int(i), i2: int(i2), j: int(j), kont: () -<cloref1> void
) : void // end of [kmerge2]

(* ****** ****** *)
//
fun
incr(flag: ref(int)): void = flag[] := flag[] + 1
//
(* ****** ****** *)

local

val
theContinuation =
ref{List0(()-<cloref1>void)}(list_nil)

in (* in-of-local *)
//
implement
theContinuation_save
  (k) = let
  val ks = theContinuation[]
in
  theContinuation[] := list_cons(k, ks)
end // end of [theContinuation_save]
//
implement
theContinuation_exec
(
) = let
//
val ks = theContinuation[]
val () = theContinuation[] := list_nil
//
fun
loop
(
  ks: List(()-<cloref1>void)
) : void =
(
case+ ks of
| list_nil () => ()
| list_cons (k, ks) => (k(); loop(ks))
) (* end of [loop] *)
//
in
  loop(ks)
end // end of [theContinuation_exec]

end // end of [local]

(* ****** ****** *)

implement
kmsort2(i, j, kont) = let
//
val d = j - i
//
in
//
if
d >= 2
then let
  val d2 = half(d)
  val i2 = i + d2
  val flag2 = ref{int}(0)
  val () = kmsort2(i, i2, lam () => (incr(flag2); if flag2[] >= 2 then kmerge2(i, i2, j, kont)))
  val () = kmsort2(i2, j, lam () => (incr(flag2); if flag2[] >= 2 then kmerge2(i, i2, j, kont)))
in
  // nothing
end // end of [then]
else kont() // end of [else]
//
end // end of [kmsort2]

(* ****** ****** *)

implement
kmerge2(i, i2, j, kont) = (
//
if
i = i2
then kont()
else (
//
if
i2 = j
then kont()
else let
//
val x1 = theArray[i]
val x2 = theArray[i2]
//
in
  if x1 <= x2
    then
      kmerge2(i + 1, i2, j, kont)
    else let
      val () =
      rotate_right(i, i2)
      val () =
      draw_update((*void*))
    in
      theContinuation_save
        (lam () => kmerge2(i + 1, i2 + 1, j, kont))
      // end of [theContinuation_save]
    end // end of [else]
end // end of [else]
//
) (* end of [else] *)
//
) (* end of [kmerge2] *)

(* ****** ****** *)
//
extern
fun
mergesort(): void = "mac#"
//
implement
mergesort() =
theContinuation_save
(
  lam () => kmsort2(0, N, lam () => alert("Sorting is done!"))
) (* end of [theContinuation_save] *)
//
(* ****** ****** *)

staload
"{$LIBATSCC2JS}/SATS/Bacon.js/baconjs.sats"

(* ****** ****** *)

%{^
//
var
thePlays = $("#play").asEventStream("click")
var
theNexts = $("#next").asEventStream("click")
var
thePauses = $("#pause").asEventStream("click")
//
var
thePulses = Bacon.interval(200, 0)
//
var thePrimes = 0
//
%} // end of [%{^]

(* ****** ****** *)

val thePlays = $extval(EStream(void), "thePlays")
val theNexts = $extval(EStream(void), "theNexts")
val thePauses = $extval(EStream(void), "thePauses")
val thePulses = $extval(EStream(void), "thePulses")

(* ****** ****** *)
//
val thePlays =
EStream_map{void}{bool}(thePlays, lam (x) =<cloref1> true)
val thePauses =
EStream_map{void}{bool}(thePauses, lam (x) =<cloref1> false)
//
val thePlayPauses = merge(thePlays, thePauses)
val thePlayPauses = thePlayPauses.toProperty(false)
//
val thePulses = EStream_filter_property(thePulses, thePlayPauses)
//
(* ****** ****** *)

val theActions = merge(theNexts, thePulses)

(* ****** ****** *)
//
val () =
EStream_subscribe
(
  theActions, lam(_) =<cloref1> theContinuation_exec()
) (* EStream_subscribe *)
//
(* ****** ****** *)
//
// What is given below is external JS code
//
(* ****** ****** *)
//
%{$
//
my_dynload();
//
var
canvas =
document.getElementById
(
  "Patsoptaas-Evaluate-canvas"
);
//
var
ctx2d = canvas.getContext('2d');
//
function
theCtx2d_get() { return ctx2d; }
//
function
theCtx2d_clear ()
{
  return ctx2d.clearRect(0, 0, canvas.width, canvas.height);
}
//
function
initize()
{
//
var w = canvas.width
var h = canvas.height
var w2 = 0.88 * w
var h2 = 0.88 * h
//
theP1_set(0, h2); theP2_set(w2, h2); theP3_set(w2, 0); theP4_set(0, 0);
//
return;
}
//
function
draw_main()
{
//
initize();
draw_update(ctx2d);
//
} // end of [draw_main]
//
function
draw_update()
{
//
var w =
  canvas.width
var h =
  canvas.height
var w2 = 0.88 * w
var h2 = 0.88 * h
//
ctx2d.save();
ctx2d.translate
(
  (w-w2)/2, (h-h2)/2
) ; // translate
draw_theArray(ctx2d);
ctx2d.restore();
//
}
//
jQuery(document).ready(function(){draw_main();mergesort();return;});
//
%} // end of [%{$]
//
(* ****** ****** *)

(* end of [mergesort.dats] *)

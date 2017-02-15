(*
** lintype-intro
*)

(* ****** ****** *)
//
// HX-2015-02-19
//
(* ****** ****** *)
//
#define
LIBATSCC2JS_targetloc
"$PATSHOME\
/contrib/libatscc2js/ATS2-0.3.2"
//
(* ****** ****** *)
//
#include
"{$LIBATSCC2JS}/staloadall.hats"
//
(* ****** ****** *)

#include "light.dats"

(* ****** ****** *)

extern
fun
theLight_take(): light = "mac#"
extern
fun
theLight_return(light): void = "mac#"

(* ****** ****** *)

extern
fun
drawCircle0(bool): void = "mac#"

(* ****** ****** *)
//
extern
fun
theLight_show(): void = "mac#"
//
implement
theLight_show() =
{
  val x0 = theLight_take()
  val () = drawCircle0(light_test(x0))
  val () = theLight_return(x0)
}
//
(* ****** ****** *)

(*
extern
fun
Create_onclick((*void*)): void = "mac#"
extern
fun
Destroy_onclick((*void*)): void = "mac#"
*)

(* ****** ****** *)

(*
implement
Create_onclick() = let
in
  alert("Create:clicked")
end // end of [Create_onclick]

implement
Destroy_onclick() = let
in
  alert("Destroy:clicked")
end // end of [Destroy_onclick]
*)

(* ****** ****** *)

extern
fun
Light_on_onclick((*void*)): void = "mac#"
extern
fun
Light_off_onclick((*void*)): void = "mac#"

(* ****** ****** *)

extern
fun
Light_flash_onclick((*void*)): void = "mac#"

(* ****** ****** *)

implement
Light_on_onclick() = let
//
val x0 = theLight_take()
//
val () =
case+
light_test(x0)
of
| true => (
    alert("Light is already on!")
  ) (* true *)
| false => (
    light_on(x0); drawCircle0(true);
  ) (* false *)
//
val () = theLight_return(x0)
//
in
  // nothing
end // end of [Light_on_onclick]

(* ****** ****** *)

implement
Light_off_onclick() = let
//
val x0 = theLight_take()
//
val () =
case+
light_test(x0)
of
| true => (
    light_off(x0);
    drawCircle0(false);
  ) (* true *)
| false => (
    alert("Light is already off!")
  ) (* false *)
//
val () = theLight_return(x0)
//
in
  // nothing
end // end of [Light_off_onclick]

(* ****** ****** *)

(*
implement
Light_flash_onclick() = alert("Light_flash:clicked")
*)

(* ****** ****** *)

%{$
//
var
canvas =
document.getElementById
  ("Patsoptaas-Evaluate-canvas");
var
ctx2d = canvas.getContext( '2d' );
//
function
theCx_get() { return canvas.width/2; }
function
theCy_get() { return canvas.height/2; }
function
theRadius_get() { return Math.min(canvas.width, canvas.height)/2; }
//
function
drawCircle
(
  color, Cx, Cy, rad
)
{
//
ctx2d.beginPath();
//
ctx2d.arc
  (Cx, Cy, rad, 0, 2*Math.PI, true);
//
ctx2d.closePath();
//
ctx2d.fillStyle = color; ctx2d.fill();
//
return;
//
} // end of [drawCircle]
//
function
drawCircle0(x)
{
  var Cx = theCx_get();
  var Cy = theCy_get();
  var rad = 0.88*theRadius_get();
  var color =
    (x ? "#ffff00" : "#000000");
  drawCircle(color, Cx, Cy, rad);
  return;
}
//
var
theLight = { state: false }
//
function
theLight_take() { return theLight; }
function
theLight_return() { return /*void*/; }
//
function light_test(x) { return x.state; }
//
function light_on(x) { x.state = true; }
function light_off(x) { x.state = false; }
//
var
isFlushing = false;
//
function
Light_flash_onclick()
{
  isFlushing = !isFlushing; Light_flash_onclick2();
}
function
Light_flash_onclick2()
{
  var b;
  if(!isFlushing) return;
  b = theLight.state;
  theLight.state = !b;
  drawCircle0(!b); setTimeout(Light_flash_onclick2, 250/*ms*/);
}
//
jQuery(document).ready(function(){theLight_show();});
//
%} // end of [%{$]

(* ****** ****** *)

(* end of [light-demo.dats] *)

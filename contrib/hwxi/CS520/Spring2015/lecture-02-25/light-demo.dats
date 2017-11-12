(*
** lintype-intro
*)

(* ****** ****** *)
//
// HX-2015-02-19
//
(* ****** ****** *)

#include "./light.dats"

(* ****** ****** *)
//
datavtype
Option_vt(a:vt@ype) =
  None_vt of () | Some_vt of (a)
//
(* ****** ****** *)
//
extern
fun option_vt_some{a:vtype}(x:a): Option_vt(a) = "mac#"
extern
fun option_vt_none{a:vtype}((*void*)): Option_vt(a) = "mac#"
//
implement
option_vt_some(x) = Some_vt(x)
implement
option_vt_none((*void*)) = None_vt()
//
(* ****** ****** *)

vtypedef
lightopt = Option_vt(light)

(* ****** ****** *)

extern
fun
theLight_take(): lightopt = "mac#"
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
light_show{b:bool}(!light(b)): void = "mac#"
//
implement
light_show(x0) = drawCircle0(light_test(x0))
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

fun
Light_on_onclick2
  {b:bool}
(
  x0: !light(b) >> light(true)
) : void =
(
//
case+
light_test(x0)
of
| true => (
    alert("Light is already on!")
  ) (* true *)
| false => (light_on(x0); light_show(x0))
//
) // end of [Light_on_onclick2]

fun
Light_off_onclick2
  {b:bool}
(
  x0: !light(b) >> light(false)
) : void =
(
//
case+
light_test(x0)
of
| true =>
  (light_off(x0); light_show(x0))
| false => (
    alert("Light is already off!")
  ) (* false *)
//
) // end of [Light_off_onclick2]

(* ****** ****** *)

implement
Light_on_onclick
  ((*void*)) = let
//
val opt = theLight_take()
//
in
  case+ opt of
  | ~Some_vt x0 =>
    (Light_on_onclick2(x0); theLight_return(x0))
  | ~None_vt () => ()
end // end of [Light_on_onclick]

implement
Light_off_onclick
  ((*void*)) = let
//
val opt = theLight_take()
//
in
  case+ opt of
  | ~Some_vt x0 =>
    (Light_off_onclick2(x0); theLight_return(x0))
  | ~None_vt () => ()
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
var
theLightRef = [ theLight ] ;
//
function
theLight_take()
{ 
  var x0;
  x0 = theLightRef[0];
  if (x0 === 0) return option_vt_none();
  theLightRef[0] = 0; return option_vt_some(x0);
}
function
theLight_return(x0) { theLightRef[0] = x0; return /*void*/; }
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
  var x0 = theLight_take();
  isFlushing = !isFlushing;
  if (x0 !== 0) Light_flash_onclick2(x0);
  return;
}
function
Light_flash_onclick2(x0)
{
  var b;
  if(!isFlushing) { theLight_return(x0); return; }
  b = x0.state;
  x0.state = !b;
  light_show(x0);
  setTimeout(function(){Light_flash_onclick2(x0);}, 250/*ms*/);
}
//
jQuery(document).ready(function(){light_show(theLight);});
//
%} // end of [%{$]

(* ****** ****** *)

(* end of [light-demo.dats] *)

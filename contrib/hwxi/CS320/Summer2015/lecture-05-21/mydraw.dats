(* ****** ****** *)

#include
"share/atspre_staload.hats"

(* ****** ****** *)

extern
fun theCanvas_show(): void
extern
fun theCanvas_clear(): void

(* ****** ****** *)

extern
fun
drawPoint(x: int, y: int): void

(* ****** ****** *)

extern
fun
drawHLineSeg
  (x0: int, y0: int, n: int): void
extern
fun
drawVLineSeg
  (x0: int, y0: int, n: int): void

(* ****** ****** *)

implement
drawHLineSeg
  (x0, y0, n) = (
//
if
n > 0
then
{
  val () = drawPoint(x0, y0)
  val () = drawHLineSeg(x0+1, y0, n-1)
} (* end of [then] *)
else () // end of [else]
//
) (* end of [drawHLineSeg] *)

(* ****** ****** *)

implement
drawVLineSeg
  (x0, y0, n) = (
//
if
n > 0
then
{
  val () = drawPoint(x0, y0)
  val () = drawVLineSeg(x0, y0+1, n-1)
} (* end of [then] *)
else () // end of [else]
//
) (* end of [drawVLineSeg] *)

(* ****** ****** *)
//
extern
fun
drawRectangle
  (x0: int, y0: int, nrow: int, ncol: int): void
//
(* ****** ****** *)

implement
drawRectangle
  (x0, y0, nrow, ncol) = (
//
if
nrow > 0
then
{
  val () = drawHLineSeg(x0, y0, ncol)
  val () = drawRectangle(x0, y0+1, nrow-1, ncol)
} (* end of [then] *)
else () // end of [else]
//
) (* end of [drawRectangle] *)

(* ****** ****** *)
//
extern
fun
drawRTrapezoid
  (x0: int, y0: int, nrow: int, ncol: int, d: int): void
//
(* ****** ****** *)

implement
drawRTrapezoid
  (x0, y0, nrow, ncol, d) = (
//
if
nrow > 0
then
{
  val () = drawHLineSeg(x0, y0, ncol)
  val () = drawRTrapezoid(x0, y0+1, nrow-1, ncol+d, d)
} (* end of [then] *)
else () // end of [else]
//
) (* end of [drawRTrapezoid] *)

(* ****** ****** *)

typedef
canvas = mtrxszref(int)

(* ****** ****** *)

#define NROW 24
#define NCOL 16
val theCanvas = mtrxszref_make_elt(i2sz(NROW), i2sz(NCOL), 0)

(* ****** ****** *)
//
(*
implement
drawPoint(x, y) = theCanvas[x, y] := 1
*)
//
implement
drawPoint(x, y) =
  if x < 0 then ()
  else if y < 0 then ()
  else if x >= NROW then ()
  else if y >= NCOL then ()
  else (theCanvas[x, y] := 1)
//
(* ****** ****** *)

implement
theCanvas_show() = let
//
fun
show(c: int): void =
  print_char(if c = 0 then ' ' else '*')
//
fun loop(i: int): void =
  if i < NCOL
    then (loop2 (i, 0); loop(i+1)) else ()
and loop2 (i: int, j: int): void =
  if j < NROW
    then (show(theCanvas[j, i]); loop2(i, j+1))
    else print_newline()
//
in
  loop (0)
end // end of [theCanvas_show]

(* ****** ****** *)

implement
theCanvas_clear() = let
//
fun loop(i: int): void =
  if i < NCOL
    then (loop2 (i, 0); loop(i+1)) else ()
and loop2 (i: int, j: int): void =
  if j < NROW
    then (theCanvas[j, i] := 0; loop2(i, j+1)) else ()
//
in
  loop (0)
end // end of [theCanvas_clear]

(* ****** ****** *)
//
val () = theCanvas_clear()
//
val () =
  drawRTrapezoid(4, 4, 8, 1, 1)
//
val () = theCanvas_show((*void*))
//
(* ****** ****** *)
//
val () = theCanvas_clear()
//
val () =
  drawRTrapezoid(4, 4, 8, 8, ~1)
//
val () = theCanvas_show((*void*))
//
(* ****** ****** *)

implement main0((*void*)) = ((*void*))

(* ****** ****** *)

(* end of [mydraw.dats] *)

(* ****** ****** *)

(*
** A worm-like game!
*)

(* ****** ****** *)
//
#include
"share/atspre_define.hats"
//
staload
UN = "prelude/SATS/unsafe.sats"
//
(* ****** ****** *)
//
#define
ATS_MAINATSFLAG 1
//
#define
ATS_DYNLOADNAME
"Wormlike__dynload"
//
#define
ATS_STATIC_PREFIX "Wormlike__"
//
(* ****** ****** *)
//
#include
"{$LIBATSCC2PY3}/staloadall.hats"
//
(* ****** ****** *)
//
staload "./Wormlike.sats"
//
(* ****** ****** *)
//
staload
Random =
"{$LIBATSCC2PY3}/SATS/PYLIBC/random.sats"
//
(* ****** ****** *)

implement
succ_row(i) = let
  val i1 = i+1
in
//
if i1 < NROW then i1 else 0
//
end // end of [succ_row]
implement
pred_row(i) =
(
if i > 0 then i-1 else NROW-1
)

(* ****** ****** *)

implement
succ_col(j) = let
  val j1 = j+1
in
//
if j1 < NCOL then j1 else 0
//
end // end of [succ_col]
implement
pred_col(j) =
(
if j > 0 then j-1 else NCOL-1
)

(* ****** ****** *)

local
//
staload "./myqueue.dats"
//
assume worm = queue(wnode)
//
val
theWorm = queue_make_nil()
//
in
//
implement
theWorm_get() = theWorm
//
implement
theWorm_length() = queue_size(theWorm)
//
implement
theWorm_decby1() = queue_dequeue_opt(theWorm)
implement
theWorm_incby1(x0) = queue_enqueue(theWorm, x0)
//
implement
theWorm_insert
  ((*void*)) = let
//
val Q = theWorm_get()
val $tup(r0, r1) = queue2list2(Q)
//
val G = theGamebd_get()
//
fun
aux
(
  xs: list0(wnode)
) : void =
(
case+ xs of
| list0_nil() => ()
| list0_cons
    (x, xs) => let
    val+WN(i, j) = x
    val () = G[i,j] := XN1(0)
  in
    aux(xs)
  end // end of [aux]
)
//
in
  aux(r0); aux(r1)
end // end of [theWorm_insert]
//
implement
theWorm_remove
  ((*void*)) = let
//
val Q = theWorm_get()
val $tup(r0, r1) = queue2list2(Q)
//
val G = theGamebd_get()
//
fun
aux
(
  xs: list0(wnode)
) : void =
(
case+ xs of
| list0_nil() => ()
| list0_cons
    (x, xs) => let
    val+WN(i, j) = x
    val () = G[i,j] := XN0()
  in
    aux(xs)
  end // end of [aux]
)
//
in
  aux(r0); aux(r1)
end // end of [theWorm_remove]
//
implement
theWorm_last_opt
  () = queue_last_opt(theWorm_get())
//
//
extern
fun
theWorm_next
(
  d0: int, di: int, dj: int
) : Option(wnode)
extern
fun
theWorm_move_with
  (opt: Option(wnode)): int
//
//
implement
theWorm_next
  (d0, di, dj) = let
//
val G0 = theGamebd_get()
//
val opt = theWorm_last_opt()
//
in
//
case+ opt of
| None() => Some(WN(0, 0))
  // list0_nil
| Some(x0) => let
    val WN(i, j) = x0
    val i1 =
    (
    if di > 0
      then (if d0 > 0 then succ_row(i) else pred_row(i)) else i
    // end of [if]
    ) : int // end of [val]
    val j1 =
    (
    if dj > 0
      then (if d0 > 0 then succ_col(j) else pred_col(j)) else j
    // end of [if]
    ) : int // end of [val]
    val xn = G0[i1, j1]
  in
    case+ xn of
    | XN0() => Some(WN(i1, j1))
    | XN1(knd) => (if knd <= 0 then None() else Some(WN(i1, j1)))
  end // list0_cons
//
end // end of [theWorm_next]
//
implement
theWorm_move_with
  (opt) = let
//
val () = theWorm_remove()
//
in
//
case+ opt of
| None() => let
    val () =
      ignoret(theWorm_decby1())
    // end of [val]
  in
    theWorm_insert(); 0(*stay*)
  end // end of [None]
| Some(x0) => let
    val n0 = theWorm_length()
    val () = theWorm_incby1(x0)
    val () =
      if n0 > NWORM
        then ignoret(theWorm_decby1())
      // end of [if]
  in
    theWorm_insert(); 1(*move*)
  end // end of [Some]
//
end // end of [theWorm_move_with]
//
end // end of [local]

(* ****** ****** *)

extern
fun
theWorm_next_random
  (): Option(wnode)
//
implement
theWorm_next_random() = let
//
fun dirget(): int =
  if $Random.random() >= 0.5 then 1 else 0
//
val d0 = dirget()
val di = dirget()
val dj = (1 - di)
//
in
  theWorm_next(d0, di, dj)
end // end of [Worm_next_random]

(* ****** ****** *)
//
implement
theWorm_move_up() = theWorm_move_with(theWorm_next(0, 0, 1))
implement
theWorm_move_down() = theWorm_move_with(theWorm_next(1, 0, 1))
//
implement
theWorm_move_left() = theWorm_move_with(theWorm_next(0, 1, 0))
implement
theWorm_move_right() = theWorm_move_with(theWorm_next(1, 1, 0))
//
implement
theWorm_move_random() = theWorm_move_with(theWorm_next_random())
//
(* ****** ****** *)

local
//
val
theGamebd =
mtrxszref_make_elt(NROW, NCOL, XN0)
//
in (* in-of-local *)

implement theGamebd_get() = theGamebd

end // end of [local]

(* ****** ****** *)

local
//
val
theVisitbd =
  mtrxszref_make_elt(NROW, NCOL, 0)
//
in (* in-of-local *)

implement theVisitbd_get() = theVisitbd

end // end of [local]

implement
theVisitbd_reset() = let
  val V = theVisitbd_get()
in
  V.foreach()(lam(i, j) => V[i,j] := 0)
end // end of [theVisitbd_reset]

(* ****** ****** *)
//
extern
fun{} x0_get(): int
extern
fun{} y0_get(): int
extern
fun{} xunit_get(): int
extern
fun{} yunit_get(): int
//
implement x0_get<>() = 10
implement y0_get<>() = 10
implement xunit_get<>() = 20
implement yunit_get<>() = 20
//
extern
fun{}
mydraw_square
(
  xn: xnode
, x: int, y: int, xu: int, yu: int
) : void // end of [mydraw_square]
//
extern
fun{}
theGamebd_display_end((*void*)): void
//
implement
{}(*tmp*)
theGamebd_display
  ((*void*)) = let
//
val x0 = x0_get()
val y0 = y0_get()
val xu = xunit_get()
val yu = yunit_get()
//
val M0 = theGamebd_get()
//
fun
loop1
(
  i: int
) : void =
  if i < NROW then loop2(i, 0) else ()
and
loop2
(
  i: int, j: int
) : void =
(
if j < NCOL
then let
  val () =
  mydraw_square
  (
    M0[i,j], x0+i*xu, y0+j*yu, xu, yu
  ) (* mydraw_square *)
in
  loop2(i, j+1)
end // end of [then]
else loop1(i+1)
)
//
val ((*void*)) = loop1(0)
//
in
  theGamebd_display_end()
end // end of [theGamebd_display]
//
(* ****** ****** *)
//
staload
"{$LIBATSCC2PY3}/SATS/PYGAME/pygame.sats"
//
(* ****** ****** *)
//
extern
fun
Wormlike__main(): void = "mac#"
//
(* ****** ****** *)
//
val
RED = Color(255, 0, 0)
val
BGRAY = Color(200, 200, 200)
val
BLACK = Color(0, 0, 0)
val
WHITE = Color(255, 255, 255)
//
val
YELLOW = Color(255, 255, 0)
//
(* ****** ****** *)

fun
xnode2color
  (xn: xnode): Color =
(
//
case+ xn of
//
| XN0() => WHITE
//
| XN1(knd) =>
 (
    ifcase
      | knd = 0 => BGRAY
      | knd = 1 => YELLOW
      | _(*else*) => BLACK
    // end of [ifcase]
  ) (* end of [XN1] *)
//
) (* end of [xnode2color] *)

(* ****** ****** *)
//
implement
Wormlike__main() =
{
//
val () =
println!
  ("Hello from [Wormlike]!")
//
val
npnf = pygame_init_ret()
(*
val () = println!("np = ", npnf.0)
val () = println!("nf = ", npnf.1)
*)
//
val res = $tup(660,660)
val screen = display_set_mode(res)
val _(*Rect*) = screen.fill(BGRAY)
//
val screen2 =
  Surface(screen.get_size(), SRCALPHA, 32)
//
implement
mydraw_square<>
  (xn, x, y, xu, yu) = let
//
val color = xnode2color(xn)
//
in
  ignoret(draw_rect(screen2, color, Rect(x, y, xu, yu)))
end // end of [mydraw_square]
//
implement
theGamebd_display_end<>
  ((*void*)) = let
//
val x0 = x0_get()
val y0 = y0_get()
val xu = xunit_get()
val yu = yunit_get()
//
val opt = theWorm_last_opt()
//
val ((*void*)) =
(
case+ opt of
| None() => ()
| Some(wn) => let
    val+WN(i, j) = wn
  in
    ignoret(draw_rect(screen2, RED, Rect(x0+i*xu, y0+j*yu, xu, yu)))
  end // end of [Some]
)
//
val _rect_ =
  screen.blit(screen2, $tup(0, 0))
//
in
  display_flip((*void*))
end // end of [theGamebd_display_end]
//
val () = theWormlike_scene2()
val () = theWormlike_bonus_rand(50)
//
val () =
loop(ka0, kas) where
{
//
fun
loop
(
  ka0: kaction
, kas: kstream
) = let
//
  val-
  stream_cons
    (ka, kas) = !kas
  // end of [val]
//
  val ka0 =
  (
    case+ ka of KACTnone() => ka0 | _ => ka
  ) : kaction
  val ret =
  (
    case+ ka0 of
//
    | KACTnone() => 0
    | KACTquit() => ~1
//
    | KACTup() => theWorm_move_up()
    | KACTdown() => theWorm_move_down()
    | KACTleft() => theWorm_move_left()
    | KACTright() => theWorm_move_right()
//
    | KACTrand() => theWorm_move_random()
//
  ) : int // end of [val]

  val () = theGamebd_display()
in
  if ret >= 0 then loop(ka0, kas)
end // end of [loop]
//
val ka0 = KACTright()
val kas = kstream_make(100)
//
} (* end of [loop] *)
//
val ((*void*)) = pygame_quit((*void*))
//
} (* end of [Wormlike__main] *)

(* ****** ****** *)

%{^
######
from libatscc2py_all import *
######
from ats2pylibc_random_cats import *
######
from ats2py_pygame_pyame_cats import *
######
sys.setrecursionlimit(1000000)
######
%} // end of [%{^]

(* ****** ****** *)

%{$
if __name__ == '__main__':
  Wormlike__dynload(); Wormlike__main()
%} // end of [%{$]

(* ****** ****** *)

#include "./Wormlike_setup.dats"
#include "./Wormlike_kstream.dats"

(* ****** ****** *)

(* end of [Wormlike_main.dats] *)

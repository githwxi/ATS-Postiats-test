(* ****** ****** *)
//
// Trying libatscc2py/PYGAME
//
(* ****** ****** *)
//
#include
"share/atspre_define.hats"
#include
"{$LIBATSCC2PY3}/staloadall.hats"
//
(* ****** ****** *)
//
staload
"{$LIBATSCC2PY3}/SATS/PYGAME/pygame.sats"
//
(* ****** ****** *)
//
#define
ATS_MAINATSFLAG 1
#define
ATS_DYNLOADNAME
"pygame_sierpinski_init"
//
(* ****** ****** *)

staload
"./../mylib/mypygame.dats"

(* ****** ****** *)
//
#include "./Presentation.dats"
//
macdef K_UP = $extval(int, "pygame.K_UP")
macdef K_DOWN = $extval(int, "pygame.K_DOWN")
macdef K_LEFT = $extval(int, "pygame.K_LEFT")
macdef K_RIGHT = $extval(int, "pygame.K_RIGHT")
//
implement
{}(*tmp*)
signal_get() = let
  val opt = keydown_wait()
in
//
case+ opt of
| KEYDOWNsome(key) =>
  (
    ifcase
      | key = K_UP => ~1
      | key = K_DOWN => 1
      | key = K_LEFT => ~1
      | key = K_RIGHT => 1
      | _ (* else *) => signal_get()
    // end of [ifcase]
  )
| KEYDOWNnone(event) =>
    if event.type() = QUIT then 0 else signal_get()
//
end // end of [signal_get]
//
(* ****** ****** *)
//
val BLACK = Color(0, 0, 0)
val WHITE = Color(255, 255, 255)
//
val RED   = Color(255, 0, 0)
val GREEN = Color(0, 255, 0)
val BLUE  = Color(0, 0, 255)
//
val YELLOW = Color(255, 255, 0)
//
#define GRAY(x) Color(x, x, x)

(* ****** ****** *)
//
typedef mypoint = int2
typedef mycolor = Color
//
#include "./Sierpinski.dats"
//
implement point_x(p) = p.0
implement point_y(p) = p.1
implement point_make(x, y) = $tup(x, y)
//
(* ****** ****** *)

extern
fun
pygame_sierpinski_main
(
// argless
) : void = "mac#"
//
implement
pygame_sierpinski_main() =
{
//
val npnf = pygame_init_ret()
val ((*void*)) = println! ("np = ", npnf.0)
val ((*void*)) = println! ("nf = ", npnf.1)
//
val res = $tup(500,500)
val screen = display_set_mode(res)
val _(*Rect*) = screen.fill(BLACK)
//
val screen2 = Surface(screen.get_size(), SRCALPHA, 32)
//
(*
val () = println! ("screen2_width = ", screen2.get_width())
val () = println! ("screen2_height = ", screen2.get_height())
*)
//
val r0 = Rect(100, 100, 300, 300)
//
val _rect_ = screen2.fill(GRAY(255), r0, 0)
//
(*
val _rect_ =
  draw_circle(screen2, BLUE, $tup(250,250), 125)
*)
//
#define :: list_cons
//
implement
mydraw_triangle<>
  (c, p1, p2, p3) = let
  val ps = p1::p2::p3::nil()
in
  ignoret(draw_polygon(screen2, c, PYlist_oflist(ps)))
end // end of [mydraw_triangle]
//
val p1 = $tup(250, 100)
val p2 = $tup(100, 400)
val p3 = $tup(400, 400)
//
implement
slide_present<>(i) =
{
//
val _rect_ =
mydraw_sierpinski
  (BLUE, YELLOW, p1, p2, p3, i)
//
val _rect_ =
  screen.blit(screen2, $tup(0, 0))
//
val () = display_flip()
//
} (* end of [slide_present] *)
//
val () = nslide_present(6)
//
val ((*void*)) = pygame_quit((*void*))
//
} (* end of [pygame_sierpinski_main] *)
//
(* ****** ****** *)

%{^
######
from libatscc2py_all import *
######
from ats2py_pygame_pyame_cats import *
######
sys.setrecursionlimit(1000000)
######
%} // end of [%{^]

(* ****** ****** *)

%{$
if __name__ == '__main__':
  pygame_sierpinski_init()
  pygame_sierpinski_main()
%} // end of [%{$]

(* ****** ****** *)

(* end of [pygame_sierpinski.dats] *)

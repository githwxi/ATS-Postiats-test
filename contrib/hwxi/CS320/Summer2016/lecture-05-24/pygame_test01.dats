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
staload"{$LIBATSCC2PY3}/SATS/PYGAME/pygame.sats"
//
(* ****** ****** *)
//
#define
ATS_MAINATSFLAG 1
#define
ATS_DYNLOADNAME
"pygame_test01_init"
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
#define GRAY(x) Color(x, x, x)
//
extern
fun
pygame_test01_main
(
// argless
) : void = "mac#"
//
implement
pygame_test01_main() =
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
val _rect_ = screen2.fill(GRAY(200), r0, 0)
//
val _rect_ =
  draw_circle(screen2, BLUE, $tup(250,250), 125)
//
val _rect_ =
  screen.blit(screen2, $tup(0, 0))
//
val ((*void*)) = display_flip((*void*))
//
val () = loop() where
{
  fun
  loop(): void = let
    val e = event_wait()
    val t = e.type()
  in
    if (t = QUIT)
      then ()
      else (
        if (t = KEYDOWN) then () else loop()
      ) (* end of [else] *)
  end // end of [loop]
}
//
val ((*void*)) = pygame_quit((*void*))
//
} (* end of [pygame_test01_main] *)
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
  pygame_test01_init()
  pygame_test01_main()
%} // end of [%{$]

(* ****** ****** *)

(* end of [pygame_test01.dats] *)

(* ****** ****** *)
//
// A simple game structure...
//
(* ****** ****** *)
//
#define
ATS_MAINATSFLAG 1
#define
ATS_DYNLOADNAME "theGameInit"
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

staload "./../mylib/mystream.dats"
staload "./../mylib/mypygame.dats"

(* ****** ****** *)
//
datatype
myevent =
MYEVENTquit of () | MYEVENTaction of ()
//
(* ****** ****** *)
//
extern
fun
theMyEvents_make((*void*)): stream(myevent)
//
(* ****** ****** *)

implement
theMyEvents_make() = let
  val xs = event_wait_stream()
  val xs =
  mystream_filter_cloref<Event>
  ( xs
  , lam(x) => let
      val t = x.type()
    in
      if t = QUIT then true
(*
      else if t = KEYUP then true
*)
      else if t = KEYDOWN then true
      else false
    end // end of [lam]
  ) (* mystream_filter_cloref *)
in
  mystream_map_cloref(xs, lam(x) => if x.type() = QUIT then MYEVENTquit() else MYEVENTaction())
end // end of [theMyEvents_make]

(* ****** ****** *)
//
extern
fun
theGameLoop
(
  n: int, xs: stream(myevent)
) : void // theGameLoop
//
implement
theGameLoop(n, xs) = let
  val-stream_cons(x, xs) = !xs
in
  case+ x of
  | MYEVENTquit() => ()
  | MYEVENTaction() => let
      val () = println! ("square(", n, ") = ", n * n)
    in
      theGameLoop(n+1, xs)
    end // end of [MYEVENTaction]
end (* end of [theGameLoop] *)
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
//
extern
fun
theGameMain(): void = "mac#"
//
val WHITE = Color(255, 255, 255)
//
implement
theGameMain() = let
//
val _ = pygame_init_ret()
//
val res = $tup(600,600)
val screen = display_set_mode(res)
val _(*Rect*) = screen.fill(WHITE)
//
in
  theGameLoop(0, theMyEvents_make())
end // end of [theGameMain]
//
(* ****** ****** *)

%{$
if __name__ == '__main__':
  theGameInit(); theGameMain()
%} // end of [%{$]

(* ****** ****** *)

(* end of [estream.dats] *)

(* ****** ****** *)
//
// Solving the eight-queen puzzle
//
(* ****** ****** *)
//
#define
ATS_MAINATSFLAG 1
#define
ATS_DYNLOADNAME "queens_init"
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
staload "./myqueue.dats"
//
(* ****** ****** *)

#define N 8

(* ****** ****** *)

typedef node = list0(int)

(* ****** ****** *)

extern
fun{}
print_node(node): void
extern
fun{}
print_node_end(): void

(* ****** ****** *)

extern
fun{}
process_node(node): bool

(* ****** ****** *)

extern
fun
node_get_children(node): list0(node)

(* ****** ****** *)

local

fun
node_test
(
  nx: node, i: int
) : bool = let
//
fun
aux
(
  nx: node, df: int
) : bool =
(
  case+ nx of
  | nil0() => true
  | cons0(x, nx) =>
    if x != i then
    (
      if abs(x-i) != df
        then aux(nx, df+1) else false
      // end of [if]
    ) else false // end of [if]
)
//
in
  aux(nx, 1)
end // end of [node_test]

in (* in-of-local *)

implement
node_get_children(nx) = let
//
fun
aux(i: int): list0(node) =
if
i < N
then let
  val test = node_test(nx, i)
in
  if test then list0_cons(cons0(i, nx), aux(i+1)) else aux(i+1)
end
else list0_nil()
//
in
  if length(nx) < N then aux(0) else nil0()
end // end of [node_get_children]

end // end of [local]

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
extern
fun{}
mydraw_circle
  (x: int, y: int, xu: int, yu: int): void
extern
fun{}
mydraw_square
  (knd: int, x: int, y: int, xu: int, yu: int): void
//
implement
{}(*tmp*)
print_node(nx) = let
//
val x0 = x0_get()
val y0 = y0_get()
val xu = xunit_get()
val yu = yunit_get()
//
fun
auxbd
(
  i: int
) : void = let
fun
loop
(
  j: int, knd: int, x: int, y: int
) : void =
(
  if j < N
    then (mydraw_square(knd, x, y, xu, yu); loop(j+1, 1-knd, x+xu, y))
  // end of [if]
)
//
in
//
if
i < N
then
(
  loop(0, i mod 2, x0, y0 + i*yu); auxbd(i+1)
)
else () // end of [else]
//
end (* end of [auxbd] *)
//
fun
auxlst
(
  ns: list0(int), y: int
) : int =
(
case+ ns of
| list0_nil() => y
| list0_cons(n, ns) => let
    val y = auxlst(ns, y)
  in
    mydraw_circle (x0 + n*xu, y, xu, yu); y+yu
  end // end of [list0_cons]
)
//
in
  auxbd(0); ignoret(auxlst(nx, y0)); print_node_end()
end // end of [print_node]
//
(* ****** ****** *)
//
extern
fun{}
dfirst_search(nx: node): void
//
extern
fun{}
bfirst_search(nx: node): void
//
(* ****** ****** *)

implement
{}(*tmp*)
dfirst_search(nx) = let
//
val
stk =
slistref_make_nil{node}()
//
val () = slistref_push(stk, nx)
//
fun loop(): void = let
//
val opt = slistref_pop_opt(stk)
//
in
  case+ opt of
  | ~None_vt() => ()
  | ~Some_vt(nx) => let
      val cont = process_node(nx)
    in
      if cont
        then let
          val nxs = node_get_children(nx)
          val _(*void*) =
          list0_foldright(nxs, lam(nx, _) => (slistref_push(stk, nx); 0), 0)
        in
          loop((*void*))
        end // end of [then]
      // end of [if]
    end // end of [Some]
end
//
in
  loop()
end // end of [dfirst_search]

(* ****** ****** *)

implement
{}(*tmp*)
bfirst_search(nx) = let
//
val
que = queue_make_nil()
//
val () = queue_enqueue(que, nx)
//
fun loop(): void = let
//
val opt = queue_dequeue_opt<node>(que)
//
in
  case+ opt of
  | None() => ()
  | Some(nx) => let
      val cont = process_node(nx)
    in
      if cont
        then let
          val nxs = node_get_children(nx)
          val _(*void*) = queue_enqueue_list(que, nxs)
        in
          loop((*void*))
        end // end of [then]
      // end of [if]
    end // end of [Some]
end
//
in
  loop()
end // end of [bfirst_search]

(* ****** ****** *)
//
staload
"{$LIBATSCC2PY3}/SATS/PYGAME/pygame.sats"
//
val BLACK = Color(0, 0, 0)
val BGRAY = Color(127, 127, 127)
val WHITE = Color(255, 255, 255)
//
extern
fun
queens_main
(
// argless
) : void = "mac#"
//
implement
queens_main() = let
//
val _ = pygame_init_ret()
//
val res = $tup(600,600)
val screen = display_set_mode(res)
val _(*Rect*) = screen.fill(BGRAY)
//
val screen2 = Surface(screen.get_size(), SRCALPHA, 32)
//
implement
x0_get<>() = 60
implement
y0_get<>() = 60
implement
xunit_get<>() = 60
implement
yunit_get<>() = 60
//
implement
mydraw_circle<>
  (x, y, xu, yu) = (
//
ignoret
(
draw_circle
(
  screen2, BGRAY, $tup(x+xu/2, y+yu/2), min(xu,yu)/2
)
) (* ignoret *)
//
) (* end of [mydraw_circle] *)
//
implement
mydraw_square<>
  (knd, x, y, xu, yu) = let
//
val
color =
(
if knd = 0 then BLACK else WHITE
) : Color
//
in
  ignoret(draw_rect(screen2, color, Rect(x, y, xu, yu)))
end // end of [mydraw_square]
//
implement
process_node<>(nx) = let
  val () = print_node(nx)
  val n0 = list0_length(nx)
  val tm = time_wait(50)
//
  fun reply(): bool = let
    val e = event_wait()
    val t = e.type((*void*))
  in
    ifcase
      | t = QUIT => false
      | t = KEYDOWN => true
      | _(* else *) => reply()
  end
//
in
//
if
n0 >= N
then let
  val _ = time_wait(1000)
in
  reply()
end // end of [then]
else true // end of [else]
//
end // end of [process_node]
//
implement
{}(*tmp*)
print_node_end() =
{
//
val _rect_ =
  screen.blit(screen2, $tup(0, 0))
//
val ((*void*)) = display_flip((*void*))
//
} (* end of [print_node_end] *)
//
val () = dfirst_search(list0_nil())
//
(*
val () = bfirst_search(list0_nil())
*)
//
val ((*void*)) = pygame_quit((*void*))
//
in
  // nothing
end // end of [queens_main]

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
  queens_init()
  queens_main()
%} // end of [%{$]

(* ****** ****** *)

(* end of [queens.dats] *)

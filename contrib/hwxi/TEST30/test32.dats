(*
// HX-2105-12-29:
** For answering the following question:
** https://groups.google.com/forum/?fromgroups#!topic/ats-lang-users/k7qXXrCvmsA
*)

(* ****** ****** *)

typedef address = int
typedef data = int
typedef delay = int
typedef speed = int

(* ****** ****** *)

datatype
command =
| Run of command_run
| Wait of command_wait
| Composite of command_composite

and
command_run =
| RunFast of (address, data)
| RunSlow of (address, data, speed)
    
and
command_wait = WaitDelay of delay

and
command_composite = CompositeList of List0(command)
    
(* ****** ****** *)

fun
execute(cs: List0(command)): void =
(
case+ cs of
| nil() => ()
| cons(c, cs) => let
    val () =
    (
      case+ c of
      | Run(RunFast _) => ()
      | Run(RunSlow _) => ()
      | Wait(WaitDelay _) => ()
      | Composite(CompositeList _) => ()
    )
  in
    execute(cs)
  end
)
                                     
(* ****** ****** *)

val c =
Composite
(
  CompositeList
  (
    $list{command}(Run(RunFast(0x90, 0x7765)), Wait(WaitDelay(50)))
  )
)

val cs = $list{command}(c, c, c)

(* ****** ****** *)

val () = execute(cs)

(* ****** ****** *)

implement main0() = ()

(* ****** ****** *)

(* end of [test32.dats] *)

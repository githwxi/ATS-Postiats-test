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

datasort cmdst = run | wait | composite

(* ****** ****** *)

datatype
command(cmdst) =
| RunFast(run) of (address, data)
| RunSlow(run) of (address, data, speed)
| WaitDelay(wait) of delay
| Composite(composite) of List0(command0)

where command0 = [k:cmdst] command(k)

(* ****** ****** *)

fun
execute_run : command(run) -> void = lam _ => ()
fun
execute_wait : command(wait) -> void = lam _ => ()
fun
execute_composite : command(composite) -> void = lam _ => ()

(* ****** ****** *)

fun
execute(cs: List0(command0)): void =
(
case+ cs of
| nil() => ()
| cons(c, cs) => let
    val () =
    (
      case+ c of
      | RunFast _ => execute_run(c)
      | RunSlow _ => execute_run(c)
      | WaitDelay _ => execute_wait(c)
      | Composite _ => execute_composite(c)
    )
  in
    execute(cs)
  end
)
                                     
(* ****** ****** *)

val c =
Composite
(
  $list{command0}(RunFast(0x90, 0x7765), WaitDelay(50))
)

val cs = $list{command0}(c, c, c)

(* ****** ****** *)

val () = execute(cs)

(* ****** ****** *)

implement main0() = ()

(* ****** ****** *)

(* end of [test33.dats] *)

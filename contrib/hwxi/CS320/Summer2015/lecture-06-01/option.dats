(*
** Optional values
*)

(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
//
(* ****** ****** *)

datatype intopt =
  | intopt_none of ()
  | intopt_some of (int)

(* ****** ****** *)

(*
datatype
option(a:t@ype) =
  | option_none of ()
  | option_some of (a)
*)

(* ****** ****** *)

extern
fun
intdiv (x: int, y: int): intopt

//
implement
intdiv(x, y) =
if y != 0
  then intopt_some(x/y) else intopt_none()
//

extern
fun
intaddopt (x: int, y: intopt): intopt

implement
intaddopt (x, y) =
(
case+ y of
| intopt_none() => intopt_none()
| intopt_some(y2) => intopt_some(x+y2)
)

(* ****** ****** *)

implement main0 () = ()

(* ****** ****** *)

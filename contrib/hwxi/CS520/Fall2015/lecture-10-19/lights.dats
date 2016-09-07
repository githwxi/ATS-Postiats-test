(*
** Code used during lecture-10-19
** for introducing linear types (viewtypes):
*)

(* ****** ****** *)

absvtype token

(* ****** ****** *)
//
#define red false
#define green true
//
absvtype light(bool)
//
(* ****** ****** *)
//
extern
fun
light_red(x: !light(green) >> light(red)): token
and
light_green(token, x: !light(red) >> light(green)): void
//
(* ****** ****** *)

implement main0 () = ()

(* ****** ****** *)

(* end of [lights.dats] *)

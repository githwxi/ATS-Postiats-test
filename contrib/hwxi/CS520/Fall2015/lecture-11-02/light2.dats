(*
** lintype-intro
*)

(* ****** ****** *)
//
// HX-2015-02-19
//
(* ****** ****** *)
//
#include
"share/atspre_define.hats"
//
#include
"{$LIBATSCC2JS}/staloadall.hats"
//
(* ****** ****** *)

absvtype
light(bool) = ptr // on/off: true/false

(* ****** ****** *)

vtypedef light = [b:bool] light(b)

(* ****** ****** *)

extern
fun light_create(): light(false) = "mac#"
extern
fun light_destroy(x: light(false)): void = "mac#"

(* ****** ****** *)

extern
fun light_test{b:bool}(!light(b)): bool(b) = "mac#"

(* ****** ****** *)

extern
fun light_on(!light(false) >> light(true)): void = "mac#"
extern
fun light_off(!light(true) >> light(false)): void = "mac#"

(* ****** ****** *)
//
extern
fun
light_off2{b:bool}
  (!light(b) >> light(false)): void = "mac#"
//
implement
light_off2(x0) = let
  val b = light_test(x0) in if b then light_off(x0) else ()
end // end of [light_off2]
//
(* ****** ****** *)

fun test(): void =
{
  val x0 = light_create()
  val () = light_on(x0)
  val () = light_off(x0)
  val () = light_destroy(x0)
}

(* ****** ****** *)

(* end of [light2.dats] *)

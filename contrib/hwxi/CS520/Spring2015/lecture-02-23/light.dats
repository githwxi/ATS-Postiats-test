(*
** lintype-intro
*)

(* ****** ****** *)
//
// HX-2015-02-19
//
(* ****** ****** *)
//
#define
LIBATSCC2JS_targetloc
"$PATSHOME\
/contrib/libatscc2js/ATS2-0.3.2"
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

(* end of [light.dats] *)

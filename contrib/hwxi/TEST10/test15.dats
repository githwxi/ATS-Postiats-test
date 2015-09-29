(* ****** ****** *)
//
// HX-2015-09-27
// For answering the question:
// https://groups.google.com/forum/#!topic/ats-lang-users/S36pxm7XntI
//
(* ****** ****** *)
//
#include
"share/atspre_define.hats"
#include
"{$ARDUINO}/staloadall.hats"
//
(* ****** ****** *)
//
staload
UN = "prelude/SATS/unsafe.sats"
//
(* ****** ****** *)

absview setup
absview light_on
absview light_off

(* ****** ****** *)
//
extern
fun
setup(): (setup | void)
//
implement
setup() = (pf | ()) where
{
  val () = pinMode(13, OUTPUT)
  val pf = $UN.castview0{setup}(()) // fake it!
} (* end of [setup] *)
//
(* ****** ****** *)

extern
fun
light_on1 (pf: !setup >> light_on | (*void*)): void
extern
fun
light_on2 (pf: !light_off >> light_on | (*void*)): void
extern
fun
light_off (pf: !light_on >> light_off | (*void*)): void

(* ****** ****** *)

implement
light_on1
  (pf | (*void*)) = let
  val () = digitalWrite (13, HIGH)
  val () = delay (1000)
  val () = $UN.castview2void{light_on}(pf) // fake it!
in
  // nothing
end // end of [light_on1]

implement
light_on2
  (pf | (*void*)) = let
  val () = digitalWrite (13, HIGH)
  val () = delay (1000)
  val () = $UN.castview2void{light_on}(pf) // fake it!
in
  // nothing
end // end of [light_on2]

implement
light_off
  (pf | (*void*)) = let
  val () = digitalWrite (13, LOW )
  val () = delay (1000)
  val () = $UN.castview2void{light_off}(pf) // fake it!
in
  // nothing
end // end of [light_off]

(* ****** ****** *)
//
extern
fun
blink(): void
//
implement
blink() = let
//
fun
loop
(
  pf: light_on | (*void*)
) : void = let
  val () = light_off (pf | (*void*))
  val () = light_on2 (pf | (*void*))
in
  loop(pf | (*void*))
end // end of [loop]
//
val (pf | ()) = setup ()
val ((*void*)) = light_on1 (pf | (*void*))
//
in
  loop(pf | (*void*))
end // end of [blink]
//
(* ****** ****** *)

(* end of [test15.dats] *)

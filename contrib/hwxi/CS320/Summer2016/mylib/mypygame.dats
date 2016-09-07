(* ****** ****** *)
//
// Functions based on pygame
// for teaching and for convenience
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
typedef Key = int
//
datatype
keyupopt =
  | KEYUPsome of (Key)
  | KEYUPnone of (Event)
//
(* ****** ****** *)
//
extern
fun{}
keyup_wait((*void*)): keyupopt
extern
fun{}
keyup_wait_with(Event): keyupopt
//
implement
{}(*tmp*)
keyup_wait() =
  keyup_wait_with(event_wait())
//
implement
{}(*tmp*)
keyup_wait_with
  (event) = let
  val t = event.type()
in
  if t = KEYUP 
    then KEYUPsome(event.keyup_key())
    else KEYUPnone(event)
  // end of [if]
end // end of [keyup_wait_with]
//
(* ****** ****** *)
//
datatype
keydownopt =
  | KEYDOWNsome of (int)
  | KEYDOWNnone of (Event)
//
(* ****** ****** *)
//
extern
fun{}
keydown_wait((*void*)): keydownopt
extern
fun{}
keydown_wait_with(Event): keydownopt
//
implement
{}(*tmp*)
keydown_wait() =
  keydown_wait_with(event_wait())
//
implement
{}(*tmp*)
keydown_wait_with
  (event) = let
  val t = event.type()
in
  if t = KEYDOWN 
    then KEYDOWNsome(event.keydown_key())
    else KEYDOWNnone(event)
  // end of [if]
end // end of [keydown_wait_with]
//
(* ****** ****** *)
//
extern
fun{}
event_wait_stream
  ((*void*)): stream(Event)
//
(* ****** ****** *)

implement
{}(*tmp*)
event_wait_stream
  () = let
//
fun
aux
(
// argless
) : stream(Event) =
  $delay(stream_cons(event_wait(), aux()))
//
in
  aux()
end // end of [event_wait_stream]

(* ****** ****** *)
//
extern
fun{}
event_poll_stream
  (ms: intGte(0)): stream(Event)
//
implement
{}(*tmp*)
event_poll_stream
  (ms) = let
//
fun
aux
(
// argless
) : stream(Event) = $delay(
//
let
  val _leftover_ = time_wait(ms)
in
  stream_cons(event_poll(), aux())
end // end of [let]
//
) // end of [$delay] // end of [aux]
//
in
  aux()
end // end of [event_poll_stream]
//
(* ****** ****** *)

(* end of [mypygame.dats] *)

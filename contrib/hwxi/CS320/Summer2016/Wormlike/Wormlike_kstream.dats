(* ****** ****** *)

implement
kstream_make
(
  ms
) = aux() where
//
{
fun
aux
(
// argless
) : kstream = $delay(
//
let
  val _ =
    time_wait(ms)
  // end of [val]
  val e = event_poll()
  val t = e.type((*void*))
in
  ifcase
    | t = QUIT =>
        stream_cons(KACTquit, aux())
    | t = NOEVENT =>
        stream_cons(KACTnone, aux())
    | t = KEYDOWN => let
        val k = e.keydown_key((*void*))
      in
        ifcase
//
          | k = K_UP => stream_cons(KACTup, aux())
          | k = K_DOWN => stream_cons(KACTdown, aux())
//
          | k = K_LEFT => stream_cons(KACTleft, aux())
          | k = K_RIGHT => stream_cons(KACTright, aux())
//
          | k = K_SPACE => stream_cons(KACTrand, aux())
//
          | _(* else *) => stream_cons(KACTnone, aux())
      end // end of [KEYDOWN]
    | _(* else *) => stream_cons(KACTnone, aux())
  // end of [ifcase]
end // end of [let]
//
) (* end of [aux] *)
//
} (* end of [kstream_make] *)

(* ****** ****** *)

(* end of [Wormlist_kstream.dats] *)

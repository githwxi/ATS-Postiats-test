(* ****** ****** *)
//
// Code for lecture-10-26
//
(* ****** ****** *)

abstype channel = ptr

(* ****** ****** *)
//
extern
fun{}
channel_recv{a:t@ype}(channel): a
extern
fun{}
channel_send{a:t@ype}(channel, x: a): void
//
(* ****** ****** *)

fun{}
rpc
(
  ch: channel
, f: (int, int) -> int
) : void = let
  val x = channel_recv{int}(ch)
  val y = channel_recv{int}(ch)
  val () = channel_send(ch, f(x, y))
in
  rpc(ch, f)
end // end of [rpc]

(* ****** ****** *)

implement main0 () = ()

(* ****** ****** *)

(* end of [rpc_server.dats] *)

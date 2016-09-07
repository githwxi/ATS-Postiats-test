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
  ch: channel, x: int, y: int
) : int = let
(*
//
// Code for rpc server:
//
  val x = channel_recv{int}(ch)
  val y = channel_recv{int}(ch)
  val () = channel_send(ch, f(x, y))
*)
  val () = channel_send{int}(ch, x)
  val () = channel_send{int}(ch, y)
in
  channel_recv(ch)
end // end of [rpc]

(* ****** ****** *)

implement main0 () = ()

(* ****** ****** *)

(* end of [rpc_client.dats] *)

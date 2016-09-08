(* ****** ****** *)
//
// HX-2015-11-09:
//
// Untyped channels for
// illustrating distributed programming
//
(* ****** ****** *)

abstype channel

(* ****** ****** *)
//
extern
fun{}
{a:t@ype}
channel_send(channel, a): void
//
extern
fun{}
{a:t@ype}
channel_recv(chan: channel): (a)
//
extern
fun{}
channel_create
  (channel -<cloref1> void): channel
//
(* ****** ****** *)
//
extern
fun{}
channel_close(chan: channel): void
//
(* ****** ****** *)
//
(*  
extern
fun{}
from(n: int): stream(int)
implement
{}(*tmp*)
from(n) = $delay(stream_cons(n, from(n+1)))  
*)
//
(* ****** ****** *)

extern
fun{}
server_from(n:int): channel

(* ****** ****** *)

implement
{}(*tmp*)
server_from(n) = let
//
fun
fserve
(
  chpos: channel, n: int
) : void = let
  val tag = channel_recv(chpos)
in
  case+ tag of
  | 0 => channel_close(chpos)
  | _ (*1*) => let
      val () = channel_send(chpos, n)
    in
      fserve(chpos, n+1)
    end // end of [_]
end
//
in
  channel_create(lam(chpos) => fserve(chpos, 2))
end (* end of [server_from] *)

(* ****** ****** *)

extern
fun{}
client_from
  (chneg: channel): void
//
implement
{}(*tmp*)
client_from
  (chneg) = let
//
val () = channel_send(chneg, 1)
val x2 = channel_recv(chneg) // = 2
val () = channel_send(chneg, 1)
val x3 = channel_recv(chneg) // = 3
val () = channel_send(chneg, 1)
val x4 = channel_recv(chneg) // = 4
//
in
  channel_send(chneg, 0) // Telling the server to terminate
end // end of [client_from]

(* ****** ****** *)

implement main0() = ()

(* ****** ****** *)

(* end of [from_chan.dats] *)

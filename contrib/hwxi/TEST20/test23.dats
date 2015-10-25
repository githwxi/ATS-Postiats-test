(*
//
// HX-2015-10-24:
// For answering the following question:
//
// https://groups.google.com/forum/#!topic/ats-lang-users/dVRNZpbQm94
//
*)

(* ****** ****** *)

staload
UN = "prelude/SATS/unsafe.sats"

(* ****** ****** *)

macdef u8(x) = $UN.cast{uint8}(,(x))

(* ****** ****** *)

macdef packetIn =
  $extval(arrayref(uint8, 127),"packetIn")

macdef packetInCount =
  $extval(ref(uint8),"packetInCount")

macdef packetInHeader =
  $extval(ref(uint8),"packetInHeader")

(* ****** ****** *)

extern
fun{}
n7 (x: uint8): natLte(127)
implement{}
n7 (x)  = $UN.cast{natLte(127)}(x land u8(0x7F))

(* ****** ****** *)

extern
fun
pec_add: (uint8, uint8) -> uint8

extern
fun serial_poll_for_byte(): uint8

(* ****** ****** *)

fun
read_frame(): bool = let
  val count = serial_poll_for_byte()
in
  !packetInCount := count; read_frame_count(n7(count))
end // end of [read_frame]

and
read_frame_count
{n0:nat | n0 <= 127}
  (n0: int(n0)): bool = (
//
if
n0 >= 3
then let
//
fun
loop
  {n:nat | n0-2 >= n}
  (n: int(n), cksum: uint8): uint8 =
  if n > 0
    then let
      val byte = serial_poll_for_byte()
      val () = packetIn[n0-n-1] := byte
    in
      loop(n-1, pec_add(cksum, byte))
    end
    else cksum
//
val cksum =
  loop (n0-2, pec_add(u8(0), u8(n0)))
//
val packetInChecksum = serial_poll_for_byte()
val () = packetIn[n0-1] := packetInChecksum
//
in
  cksum = packetInChecksum
end // end of [then]
else false // [else]
//
) (* end of [read_fram_count] *)

(* ****** ****** *)

(* end of [test23.dats] *)

(* ****** ****** *)
//
// HX-2015-09-27
// For answering the question:
// https://groups.google.com/forum/#!topic/ats-lang-users/iMT__zki_RA
//
(* ****** ****** *)
//
staload
UN = "prelude/SATS/unsafe.sats"
//
(* ****** ****** *)

macdef i8(x) = $UN.cast{int8}(,(x))
macdef u8(x) = $UN.cast{uint8}(,(x))
macdef u16(x) = $UN.cast{uint16}(,(x))

(* ****** ****** *)

extern fun i2c_start(): int8
extern fun i2c_read(int8): uint8
extern fun i2c_write(uint8): int8

(* ****** ****** *)
//
extern
fun
i2c_read_word_data
  (address: uint8, command: uint8): (int8, uint16)
//
(* ****** ****** *)

implement
i2c_read_word_data
(
  address, command
) = let
//
var r: int8 = i8(0)
//
val () = r := i2c_start()
//
val () =
if iseqz(r) then
{
  val () = r := i2c_write((address * u8(2)) + u8(0))
} else (r := i8(1))
//
val () =
if iseqz(r) then
{
  val () = r := i2c_write(command)
} else (r := i8(2))
//
val () =
if iseqz(r) then
{
  val () = r := i2c_start()
} else (r := i8(3))
//
val () =
if iseqz(r) then
{
  val () = r := i2c_write((address * u8(2)) + u8(1))
} else (r := i8(4))
//
val () =
if iseqz(r) then
{
  val d0 = i2c_read(i8(0))
  val d1 = i2c_read(i8(1))
} else (r := i8(5))
//
in
  (r, u16(0))
end // end of [i2c_read_word_data]

(* ****** ****** *)

(* end of [test16.dats] *)

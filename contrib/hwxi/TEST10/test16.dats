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
//
fun wa (addr:uint8) : uint8 = addr << 1
fun ra (addr:uint8) : uint8 = (addr << 1) + u8(1)
//
(* ****** ****** *)
//
extern
fun
i2c_read_word_data
  (address: uint8, command: uint8): (int8, uint16)
//
(* ****** ****** *)
//
extern
fun
i2c_start(): int8
extern
fun
i2c_read(uint8): uint8
extern
fun
i2c_write(uint8): int8
//
extern
fun{}
i2c_get_err(): int
extern
fun{}
i2c_set_err(int): void
//
(* ****** ****** *)
//
fun{}
i2c_start_if
  (err: int): void =
if iseqz(i2c_get_err())
  then let
    val r = i2c_start()
  in
    if isneqz(r) then i2c_set_err(err)
  end // end of [then]
//
fun{}
i2c_write_if
(
  data: uint8, err: int
) : void =
if iseqz(i2c_get_err())
  then let
    val r = i2c_write(data)
  in
    if isneqz(r) then i2c_set_err(err)
  end // end of [then]
//
(* ****** ****** *)

implement
i2c_read_word_data
  (addr, command) = let
//
var r: int = 0
//
implement
i2c_get_err<> () = $UN.ptr0_get<int>(addr@r)
implement
i2c_set_err<> (err) = $UN.ptr0_set<int>(addr@r, err)
//
val () = i2c_start_if(1)
val () = i2c_write_if(wa addr, 2)
val () = i2c_write_if(command, 3)
val () = i2c_start_if(4)
val () = i2c_write_if(ra addr, 5)
//
in
  (i8(r), u16(0))
end // end of [i2c_read_word_data]

(* ****** ****** *)

(* end of [test16.dats] *)

(* ****** ****** *)
//
// HX-2015-09-27
// For answering the question:
// https://groups.google.com/forum/#!topic/ats-lang-users/iMT__zki_RA
//
(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
//
(* ****** ****** *)
//
staload
UN = "prelude/SATS/unsafe.sats"
//
(* ****** ****** *)

staload "libc/SATS/time.sats"
staload "libc/SATS/stdlib.sats"

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
fun i2c_start(err: &int >> _): void
extern
fun i2c_write(uint8, err: &int >> _): void
//
(* ****** ****** *)
//
implement
i2c_start(err) =
  println! ("i2c_start: err = ", err)
implement
i2c_write
  (data, err) = let
  val n = $UN.cast{int}(random())
  val ec = (if n % 9 != 5 then 0 else 1): int
in
  err := ec; println! ("i2c_write: err = ", err)
end // end of [i2c_write]
//
(* ****** ****** *)
//
extern
fun
i2c_read_word_data
  (uint8, uint8, err: &int >> _) : uint16
//
(* ****** ****** *)
//
(*
implement
i2c_read_word_data
  (addr, command, err) = let
//
val () = err := 0
//
val () =
if iseqz(err) then i2c_start(err)
val () = if err != 0 then err := 1
//
val () =
if iseqz(err) then i2c_write(wa addr, err)
val () = if err != 0 then err := 2
//
val () =
if iseqz(err) then i2c_write(command, err)
val () = if err != 0 then err := 3
//
val () =
if iseqz(err) then i2c_start(err)
val () = if err != 0 then err := 4
//
val () =
if iseqz(err) then i2c_write(ra addr, err)
val () = if err != 0 then err := 5
//
in
  u16(0)
end // end of [i2c_read_word_data]
*)
//
(* ****** ****** *)
//
macdef
ifnerr(x, err, ec) =
(
if
(,(err)=0)
then let
  val () = ,(x)
in
  if ,(err) != 0 then ,(err) := ,(ec)
end // end of [then]
)
//
(* ****** ****** *)
//
implement
i2c_read_word_data
  (addr, command, err) = let
//
val () = err := 0
//
val () = ifnerr(i2c_start(err), err, 1)
val () = ifnerr(i2c_write(wa addr, err), err, 2)
val () = ifnerr(i2c_write(command, err), err, 3)
val () = ifnerr(i2c_start(err), err, 4)
val () = ifnerr(i2c_write(ra addr, err), err, 5)
//
in
  u16(0)
end // end of [i2c_read_word_data]

(* ****** ****** *)

implement
main0 () =
{
//
val () = srandom($UN.cast(time()))
//
var err: int = 0
//
val _ = i2c_read_word_data(u8(0), u8(0), err)
//
val () = println! ("i2c_read_word_data: err = ", err) 
//
} (* end of [main0] *)
  
(* ****** ****** *)

(* end of [test17.dats] *)

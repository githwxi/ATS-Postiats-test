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

(*
fun
to_digit
(
  i: uint8
) : char = let
  val i = $UN.cast2int(i)
in
  case+ i of ...
end // end of [to_digit]
*)

(* ****** ****** *)
//
fun
u8{i:uint8}
  (i: int(i)): uint8(i) = $UN.cast{uint8(i)}(i)
//
fun
u8_to_int
  {i:uint8}(i: uint8(i)): int(i) = $UN.cast{int(i)}(i)
//
(* ****** ****** *)

fun
to_digit
{i:nat|i < 16}
(
  i: uint8 (i)
) : char = let
  val i = u8_to_int(i)
in
  case+ i of
  | 0 => '0'
  | 1 => '1'
  | 2 => '2'
  | 3 => '3'
  | 4 => '4'
  | 5 => '5'
  | 6 => '6'
  | 7 => '7'
  | 8 => '8'
  | 9 => '9'
  | 10 => 'A'
  | 11 => 'B'
  | 12 => 'C'
  | 13 => 'D'
  | 14 => 'E'
  | 15 => 'F'
end // end of [to_digit]

(* ****** ****** *)

implement
main0 () =
{
//
val () = assertloc(to_digit(u8(0)) = '0')
val () = assertloc(to_digit(u8(1)) = '1')
val () = assertloc(to_digit(u8(10)) = 'A')
val () = assertloc(to_digit(u8(11)) = 'B')
//
} (* end of [main0] *)
  
(* ****** ****** *)

(* end of [test18.dats] *)

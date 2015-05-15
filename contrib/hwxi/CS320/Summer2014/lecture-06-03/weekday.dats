(* ****** ****** *)
//
// An enumerative datatype
//
(* ****** ****** *)

#include
"share/atspre_staload.hats"

(* ****** ****** *)

staload
UN = "prelude/SATS/unsafe.sats"

(* ****** ****** *)
//
datatype
weekday =
  | Monday of ()
  | Tuesday of ()
  | Wednesday of ()
  | Thursday of ()
  | Friday of ()
//
(* ****** ****** *)

extern
fun weekday2int (day: weekday): int

(* ****** ****** *)

(*
implement
weekday2int (day) =
(
case+ day of
| Monday () => 1
| Tuesday () => 2
| Wednesday () => 3
| Thursday () => 4
| Friday () => 5
)
*)

(* ****** ****** *)

implement
weekday2int (day) = $UN.cast2int($UN.cast2intptr(day)) + 1

(* ****** ****** *)

val () = println! ("weekday2int(Monday) = ", weekday2int(Monday))
val () = println! ("weekday2int(Tuesday) = ", weekday2int(Tuesday))
val () = println! ("weekday2int(Wednesday) = ", weekday2int(Wednesday))
val () = println! ("weekday2int(Thursday) = ", weekday2int(Thursday))
val () = println! ("weekday2int(Friday) = ", weekday2int(Friday))

(* ****** ****** *)

implement main0 () = ()

(* ****** ****** *)

(* end of [weekday] *)

(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
//
(* ****** ****** *)

datatype weekday =
  | Monday of ((*void*))
  | Tuesday of ((*void*))
  | Wednesday of ((*void*))
  | Thursday of ((*void*))
  | Friday of ((*void*))
  
(* ****** ****** *)

val x1 = Monday ()
val x2 = Tuesday ()

(* ****** ****** *)

extern fun weekday2int (weekday): int

implement
weekday2int (wd) =
(
case+ wd of
| Monday () => 1
| Tuesday () => 2
| Wednesday () => 3
| Thursday () => 4
| Friday () => 5
)

(* ****** ****** *)

val () = assertloc (weekday2int(x1) = 1)
val () = assertloc (weekday2int(x2) = 2)

(* ****** ****** *)

implement main0 () = ()  
  
(* ****** ****** *)

(* end of [datatype.dats] *)

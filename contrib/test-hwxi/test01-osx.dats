(*
** OSX:
** mach_absolute_time
*)

(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
//
(* ****** ****** *)

staload UN = $UNSAFE

(* ****** ****** *)

%{^
#include "mach/mach_time.h"
%} // end of [%{^]

(* ****** ****** *)

fun
theConversionFactor_get
(
// argumentless
) = let
//
typedef
timebase_t =
$extype_struct
"mach_timebase_info_data_t" of
{ numer= uint32, denom= uint32 }
//
var timebase: timebase_t
//
val () =
$extfcall
(
  void, "mach_timebase_info", addr@timebase
) (* end of [val] *)
//
val numer = $UN.cast{double}(timebase.numer)
val denom = $UN.cast{double}(timebase.denom)
in
  numer / denom
end // end of [theConversionFactor_get]

(* ****** ****** *)
//
#define N 100000000
//
(* ****** ****** *)

implement
main0() =
{
//
val
factor =
  theConversionFactor_get()
//
val start =
  $extfcall(uint64, "mach_absolute_time")
//
val () =
(
fix
loop
(
  i:int
) : void => if i < N then loop(i+1)
)(0)
//
val finish =
  $extfcall(uint64, "mach_absolute_time")
//
val tdiff =
  factor * $UN.cast{double}(finish - start)
//
val () = println! ("test01-osx: tdiff = ", tdiff)
//
} (* end of [main0] *)

(* ****** ****** *)

(* end of [test01-osx.dats] *)

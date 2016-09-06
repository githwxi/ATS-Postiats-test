(*
** clock_gettime
*)

(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
//
(* ****** ****** *)

staload
"libats/libc/SATS/time.sats"

(* ****** ****** *)
//
#define N 100000000
//
(* ****** ****** *)

implement
main0() =
{
//
var tsp0: timespec?
var tsp1: timespec?
val err0 = clock_gettime(CLOCK_REALTIME, tsp0)
val ((*void*)) = assertloc(err0=0)
prval ((*void*)) = opt_unsome(tsp0)
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
val err1 = clock_gettime(CLOCK_REALTIME, tsp1)
val ((*void*)) = assertloc(err1=0)
prval ((*void*)) = opt_unsome(tsp1)
//
val tdiff1 =
  difftime (tsp1.tv_sec, tsp0.tv_sec)
//
val tdiff2 = tsp1.tv_nsec - tsp0.tv_nsec
//
(*
val () = println! ("test01: tdiff1 = ", tdiff)
val () = println! ("test01: tdiff2 = ", tdiff2)
*)
val () = println! ("test01: tdiff = ", tdiff1 + g0i2f(tdiff2)/1000000000.0)
//
} (* end of [main0] *)

(* ****** ****** *)

(* end of [test01.dats] *)

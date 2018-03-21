#include "share/atspre_define.hats"
#include "share/atspre_staload.hats"

// fun count_ones (n: int, sum: int): int =
//   if (n = 0) then
//     sum
//   else
//     if( (n%2) = 1) then
//       count_ones(n>>1, sum+1)
//     else
//       count_ones(n>>1, sum)

fun count_ones (n: int): int = 
  if (n > 0) then 
    (n%2) + count_ones(n >> 1)
  else
    0

implement
main0 () = {
  // val () = println! ("count_ones(0) = ", count_ones (0, 0))
  // val () = println! ("count_ones(1) = ", count_ones (1, 0))
  // val () = println! ("count_ones(2) = ", count_ones (2, 0))
  // val () = println! ("count_ones(3) = ", count_ones (3, 0))
  // val () = println! ("count_ones(10) = ", count_ones (10, 0))
  val () = println! ("count_ones(0) = ", count_ones (0))
  val () = println! ("count_ones(1) = ", count_ones (1))
  val () = println! ("count_ones(2) = ", count_ones (2))
  val () = println! ("count_ones(3) = ", count_ones (3))
  val () = println! ("count_ones(10) = ", count_ones (10))
}

// following code can be run online:

// (*
// ** Count ones
// *)

// (* ****** ****** *)

// #define
// LIBATSCC2JS_targetloc
// "contrib/libatscc2js/ATS2-0.3.2"

// (* ****** ****** *)

// #include
// "{$LIBATSCC2JS}/staloadall.hats"

// (* ****** ****** *)

// staload
// "{$LIBATSCC2JS}/SATS/print.sats"

// (* ****** ****** *)

// #define ATS_MAINATSFLAG 1
// #define ATS_DYNLOADNAME "my_dynload"

// (* ****** ****** *)
// //
// fun count_ones (n: int): int = 
//   if (n > 0) then 
//     (n%2) + count_ones(n >> 1)
//   else
//     0
// //
// (* ****** ****** *)
// //
// //
// val () = println! ("count_ones(0) = ", count_ones (0))
// val () = println! ("count_ones(1) = ", count_ones (1))
// val () = println! ("count_ones(2) = ", count_ones (2))
// val () = println! ("count_ones(3) = ", count_ones (3))
// val () = println! ("count_ones(10) = ", count_ones (10))
// //
// (* ****** ****** *)

// %{$
// //
// ats2jspre_the_print_store_clear();
// my_dynload();
// alert(ats2jspre_the_print_store_join());
// //
// %} // end of [%{$]
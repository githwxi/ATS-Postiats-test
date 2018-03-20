#include "share/atspre_define.hats"
#include "share/atspre_staload.hats"

fun weight (n: int): int =
  if (n > 1) then 
    2 * weight(n>>1) 
  else
    1

fun binrev (n: int): int =
  if (n>0) then (n%2) * weight(n) + binrev(n>>1) else 0


implement
main0 () = {
  val () = println! ("binrev(0) = ", binrev (0))
  val () = println! ("binrev(1) = ", binrev (1))
  val () = println! ("binrev(2) = ", binrev (2))
  val () = println! ("binrev(3) = ", binrev (3))
  val () = println! ("binrev(10) = ", binrev (10))
}

// following code can be run online:

// (*
// ** Reverse binary
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
// fun weight (n: int): int =
//   if (n > 1) then 
//     2 * weight(n>>1) 
//   else
//     1

// fun binrev (n: int): int =
//   if (n>0) then (n%2) * weight(n) + binrev(n>>1) else 0
// //
// (* ****** ****** *)
// //
// //
// val () = println! ("binrev(0) = ", binrev (0))
// val () = println! ("binrev(1) = ", binrev (1))
// val () = println! ("binrev(2) = ", binrev (2))
// val () = println! ("binrev(3) = ", binrev (3))
// val () = println! ("binrev(10) = ", binrev (10))
// //
// (* ****** ****** *)

// %{$
// //
// ats2jspre_the_print_store_clear();
// my_dynload();
// alert(ats2jspre_the_print_store_join());
// //
// %} // end of [%{$]
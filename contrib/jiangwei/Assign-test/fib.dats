#include "share/atspre_staload.hats"

fun fib (n: int): int =
  if n >=2 then fib(n-1) + fib(n-2) else n

implement
main0 () = {
  val () = println! ("fib(20) = ", fib (20))
}

// following code can be run online:

// (*
// ** Fibonacci
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
// fun fib (n: int): int =
//   if n >=2 then fib(n-1) + fib(n-2) else n
// //
// (* ****** ****** *)
// //
// val N = 20
// //
// val () = println! ("fib(", N, ") = ", fib(N))
// //
// (* ****** ****** *)

// %{$
// //
// ats2jspre_the_print_store_clear();
// my_dynload();
// alert(ats2jspre_the_print_store_join());
// //
// %} // end of [%{$]
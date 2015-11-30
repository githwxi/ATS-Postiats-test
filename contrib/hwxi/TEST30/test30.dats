(*
//
// HX-2015-11-30:
// For answering:
// https://groups.google.com/forum/#!topic/ats-lang-users/vD2rsLVhAdk
//
*)

(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
//
(* ****** ****** *)

typedef int2 = @(int, int)

(* ****** ****** *)
//
fun foo(x: &int): void = x := x + 1
//
fun foo2 (x2: &int2): void = (foo(x2.0); foo(x2.1))
//
(* ****** ****** *)
//
fun
fprint_int2
  : fprint_type(int2) =
  lam(out, x) => fprint_val<int2>(out, x)
//
overload fprint with fprint_int2
//
(* ****** ****** *)

implement
main0 () = () where
{
//
var x2: int2 = @(0, 0)
//
val ((*void*)) = fprintln! (stdout_ref, "x2 = ", x2)
//
val ((*1,1*)) = foo2(x2)
//
val ((*void*)) = fprintln! (stdout_ref, "x2 = ", x2)
//
} (* end of [main0] *)

(* ****** ****** *)

(* end of [test30.dats] *)
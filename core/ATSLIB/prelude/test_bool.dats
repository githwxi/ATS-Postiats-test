(* ****** ****** *)

(*
** For testing
** ATSLIB/prelude/bool
*)

(* ****** ****** *)
//
// Author: Hongwei Xi
// Authoremail: gmhwxiATgmailDOTedu
// Start time: the 18th of July, 2016
//
(* ****** ****** *)
//
#if
undefined(TEST_INCLUDE)
#then
//
#include
"share/atspre_define.hats"
//
#include
"share/atspre_staload.hats"
#include
"share/HATS/atspre_staload_libats_ML.hats"
//
#endif // end of [TEST_INCLUDE]
//
(* ****** ****** *)
//
val () =
{
//
val N = 10
//
val () =
assertloc(N.forall()(lam(x) => int2bool0(x) = (x != 0)))
//
val () =
assertloc
(
N.forall()
  (lam(x) => let val x = g1ofg0(x) in int2bool1(x) = (x != 0) end)
)
//
} (* end of [val] *)
//
(* ****** ****** *)
//
val () =
{
//
val N = 10
//
val () =
assertloc(bool2int0(true) = 1)
val () =
assertloc(bool2int0(false) = 0)
//
val () =
assertloc(bool2int1(true) = 1)
val () =
assertloc(bool2int1(false) = 0)
//
} (* end of [val] *)
//
(* ****** ****** *)

val () =
{
//
val t = true
val f = false
//
val () = assertloc((t || t) = t)
val () = assertloc((t || f) = t)
val () = assertloc((f || t) = t)
val () = assertloc((f || f) = f)
//
val () = assertloc((t && t) = t)
val () = assertloc((t && f) = f)
val () = assertloc((f && t) = f)
val () = assertloc((f && f) = f)
//
} (* end of [val] *)

(* ****** ****** *)

val () =
{
//
val t = true
val f = false
//
val () = assertloc(~(t) = f)
val () = assertloc(~(f) = t)
//
val () = assertloc((t + t) = t)
val () = assertloc((t + f) = t)
val () = assertloc((f + t) = t)
val () = assertloc((f + f) = f)
//
val () = assertloc((t * t) = t)
val () = assertloc((t * f) = f)
val () = assertloc((f * t) = f)
val () = assertloc((f * f) = f)
//
val () = assertloc((t = t) = t)
val () = assertloc((t = f) = f)
val () = assertloc((f = t) = f)
val () = assertloc((f = f) = t)
//
val () = assertloc((t != t) = f)
val () = assertloc((t != f) = t)
val () = assertloc((f != t) = t)
val () = assertloc((f != f) = f)
//
val () = assertloc((t xor t) = f)
val () = assertloc((t xor f) = t)
val () = assertloc((f xor t) = t)
val () = assertloc((f xor f) = f)
//
} (* end of [val] *)

(* ****** ****** *)

val () =
{
//
val t = true
val f = false
//
val () = assertloc((t < t) = f)
val () = assertloc((t < f) = f)
val () = assertloc((f < t) = t)
val () = assertloc((f < f) = f)
//
val () = assertloc((t <= t) = t)
val () = assertloc((t <= f) = f)
val () = assertloc((f <= t) = t)
val () = assertloc((f <= f) = t)
//
val () = assertloc((t > t) = f)
val () = assertloc((t > f) = t)
val () = assertloc((f > t) = f)
val () = assertloc((f > f) = f)
//
val () = assertloc((t >= t) = t)
val () = assertloc((t >= f) = t)
val () = assertloc((f >= t) = f)
val () = assertloc((f >= f) = t)
//
} (* end of [val] *)

(* ****** ****** *)

val () =
{
//
val t = true
val f = false
//
val () = assertloc(compare(t, t) = 0)
val () = assertloc(compare(t, f) = 1)
val () = assertloc(compare(f, t) = ~1)
val () = assertloc(compare(f, f) = 0)
//
} (* end of [val] *)

(* ****** ****** *)

(* end of [test_bool.dats] *)

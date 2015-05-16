(*
** testing UTFPL
*)

(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
//
(* ****** ****** *)

staload "./utfpl.sats"

(* ****** ****** *)

val x = var_make("x")
val f = var_make("f")

(* ****** ****** *)

val
tm_fact =
TMfix
(
f,
TMlam
(
x,
TMcond
(
  TMigt(TMvar(x), TMint(0)),
  TMmul(TMvar(x), TMapp(TMvar(f), TMsub(TMvar(x), TMint(1)))), TMint(1)
)
)
)

(* ****** ****** *)
//
val fact10 = TMapp(tm_fact, TMint(10))
//
val ((*void*)) =
  println! ("fact10 = ", eval0_cbval(comp0_fix(fact10)))
//
(* ****** ****** *)
//
val
digits =
  TMapp2(TMcst("intrange"), TMint(0), TMint(10))
//
val ((*void*)) = println! ("digits = ", eval0_cbval(digits))
//
val ((*void*)) =
  println! ("tally(digits) = ", eval0_cbval(TMapp(TMcst("list_tally"), digits)))
//
val ((*void*)) =
  println! ("length(digits) = ", eval0_cbval(TMapp(TMcst("list_length"), digits)))
//
(* ****** ****** *)

(* end of [utfpl_mytest.dats] *)

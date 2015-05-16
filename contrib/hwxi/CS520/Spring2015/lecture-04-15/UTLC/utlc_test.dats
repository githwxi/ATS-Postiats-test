(*
** Implementing UTLC
*)

(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
//
(* ****** ****** *)

staload "./utlc.sats"

(* ****** ****** *)

val x = var_make("x")
val f = var_make("f")

(* ****** ****** *)

val x0 = TMvar(x)
val f0 = TMvar(f)

(* ****** ****** *)

val f0x0 = TMapp (f0, x0)
val ((*void*)) = println! ("f0x0 = ", f0x0)

(* ****** ****** *)
//
val tm_succ =
TMlam(x, TMopr("+", $list{term}(TMvar(x), TMint(1))))
//
val tm_double =
TMlam(x, TMopr("+", $list{term}(TMvar(x), TMvar(x))))
//
val tm_square =
TMlam(x, TMopr("*", $list{term}(TMvar(x), TMvar(x))))
//
(* ****** ****** *)
//
val mytest1 = TMapp(tm_succ, TMint(10))
val ((*void*)) = println! ("mytest1 = ", eval_cbval(mytest1))
val mytest2 = TMapp(tm_double, TMint(10))
val ((*void*)) = println! ("mytest2 = ", eval_cbval(mytest2))
val mytest3 = TMapp(tm_square, TMint(10))
val ((*void*)) = println! ("mytest3 = ", eval_cbval(mytest3))
//
(* ****** ****** *)

macdef TMadd(a, b) = TMopr("+", $list{term}(,(a), ,(b)))
macdef TMsub(a, b) = TMopr("-", $list{term}(,(a), ,(b)))
macdef TMmul(a, b) = TMopr("*", $list{term}(,(a), ,(b)))

(* ****** ****** *)

macdef TMilt(a, b) = TMopr("<", $list{term}(,(a), ,(b)))
macdef TMilte(a, b) = TMopr("<=", $list{term}(,(a), ,(b)))
macdef TMigt(a, b) = TMopr(">", $list{term}(,(a), ,(b)))
macdef TMigte(a, b) = TMopr(">=", $list{term}(,(a), ,(b)))
macdef TMieq(a, b) = TMopr("=", $list{term}(,(a), ,(b)))
macdef TMineq(a, b) = TMopr("!=", $list{term}(,(a), ,(b)))

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

val mytest4 = TMapp(tm_fact, TMint(10))
val ((*void*)) = println! ("mytest4 = ", eval_cbval(mytest4))

(* ****** ****** *)

val
tm_fib =
TMfix
(
f,
TMlam
(
x,
TMcond
(
  TMigte(TMvar(x), TMint(2)),
  TMadd(TMapp(TMvar(f), TMsub(TMvar(x), TMint(1))), TMapp(TMvar(f), TMsub(TMvar(x), TMint(2)))), TMvar(x)
)
)
)

(* ****** ****** *)

val mytest5 = TMapp(tm_fib, TMint(10))
val ((*void*)) = println! ("mytest5 = ", eval_cbval(mytest5))

(* ****** ****** *)

(* end of [utlc_test.dats] *)

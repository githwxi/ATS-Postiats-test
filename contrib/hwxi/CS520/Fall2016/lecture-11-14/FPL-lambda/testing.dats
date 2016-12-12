(* ****** ****** *)

#include
"share/atspre_staload.hats"
#include
"share/HATS/atspre_staload_libats_ML.hats"

(* ****** ****** *)

staload "./lambda.sats"

(* ****** ****** *)

dynload "./lambda_term.dats"

(* ****** ****** *)
//
val x = TMvar "x"
val y = TMvar "y"
val z = TMvar "z"
//
val f = TMvar "f"
//
(* ****** ****** *)
//
fun
TMpair
(
  x: term, y: term
) : termlst = g0ofg1($list{term}(x, y))
//
macdef TMadd(x, y) = TMopr("+", TMpair(,(x), ,(y)))
macdef TMsub(x, y) = TMopr("-", TMpair(,(x), ,(y)))
macdef TMmul(x, y) = TMopr("*", TMpair(,(x), ,(y)))
//
macdef TMgt(x, y) = TMopr(">", TMpair(,(x), ,(y)))
macdef TMgte(x, y) = TMopr(">=", TMpair(,(x), ,(y)))
//
val
TMfact =
TMfix
(
  "f", "x"
, TMifnz
  ( TMgt(x, TMint(1))
  , TMmul(x, TMapp(f, TMsub(x, TMint(1)))), TMint(1)
  ) (* end of [TMifnz] *)
) (* TMfix *)
//
(* ****** ****** *)
//
val () =
println!
(
  "fact(5) = ", eval_cbv(TMapp(TMfact, TMint(5)))
)
val () =
println!
(
  "fact(10) = ", eval_cbv(TMapp(TMfact, TMint(10)))
)
//
(* ****** ****** *)

implement main0() = ((*void*))

(* ****** ****** *)

(* end of [testing.dats] *)

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
val n = TMvar "n"
val x = TMvar "x"
val y = TMvar "y"
val z = TMvar "z"
//
val f = TMvar "f"
//
(* ****** ****** *)
//
fun
TMsing
(
  x: term
) : termlst = g0ofg1($list{term}(x))
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
macdef TMlt(x, y) = TMopr("<", TMpair(,(x), ,(y)))
macdef TMlte(x, y) = TMopr("<=", TMpair(,(x), ,(y)))
macdef TMgt(x, y) = TMopr(">", TMpair(,(x), ,(y)))
macdef TMgte(x, y) = TMopr(">=", TMpair(,(x), ,(y)))
macdef TMeq(x, y) = TMopr("=", TMpair(,(x), ,(y)))
macdef TMneq(x, y) = TMopr("!=", TMpair(,(x), ,(y)))
//
val
TMfact =
TMfix
(
  "f", "x"
, TMifnz
  ( TMgt(x, TMint(0))
  , TMmul(x, TMapp(f, TMsub(x, TMint(1)))), TMint(1)
  ) (* end of [TMifnz] *)
) (* TMfix *)
//
(* ****** ****** *)
(*
val fib =
fix f(n:int): int => if n >= 2 then f(n-2)+f(n-1) else n
*)
val
TMfib =
TMfix
(
  "f", "n"
, TMifnz
  ( TMgte(n, TMint(2))
  , TMadd(TMapp(f, TMsub(n, TMint(1))), TMapp(f, TMsub(n, TMint(2)))), n
  ) (* end of [TMifnz] *)
) (* TMfix *)
//
(* ****** ****** *)

macdef TMprint(x) = TMopr("print", TMsing(,(x)))

(*
val
print_dots =
fix f(n:int): int => if n > 0 then (print "." + f(n-1)) else 0
*)
val
TMprint_dots =
TMfix
( 
  "f", "n"
, TMifnz
  ( TMgt(n, TMint(0))
  , TMadd(TMprint(TMstr(".")), TMapp(f, TMsub(n, TMint(1))))
  , TMint(0)
  )
)

(* ****** ****** *)
//
val () =
println!
(
  "fact(5) = "
, eval_cbv(TMapp(TMfact, TMint(5)))
)
val () =
println!
(
  "fact(10) = "
, eval_cbv(TMapp(TMfact, TMint(10)))
)
//
val () =
println!
(
  "fib(10) = "
, eval_cbv(TMapp(TMfib, TMint(10)))
)
//
(* ****** ****** *)
//
val-
VALint(0) =
eval_cbv(TMapp(TMprint_dots, TMint(10)))
//
val ((*void*)) = println!()
//
(* ****** ****** *)

implement main0() = ((*void*))

(* ****** ****** *)

(* end of [testing.dats] *)

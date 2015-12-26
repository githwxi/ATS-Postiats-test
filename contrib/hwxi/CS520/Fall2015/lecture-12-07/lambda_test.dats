(* ****** ****** *)
//
// Implement some tests
//
(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
//
(* ****** ****** *)

staload "./lambda.sats"

(* ****** ****** *)

val x = vnam_string"x"
val f = vnam_string"f"

(* ****** ****** *)

val x_tm = TMvar(x)
val f_tm = TMvar(f)

(* ****** ****** *)

macdef TMapp2(t_f, t_1, t_2) = TMapp(TMapp(,(t_f), ,(t_1)), ,(t_2))

(* ****** ****** *)
//
macdef
TMprint(t) =
  TMopr("print", $list{term}(,(t)))
macdef
TMprintln(t) =
  TMopr("println", $list{term}(,(t)))
//
(* ****** ****** *)
//
macdef TMadd(t1, t2) =
  TMopr("+", $list{term}(,(t1), ,(t2)))
macdef TMsub(t1, t2) =
  TMopr("-", $list{term}(,(t1), ,(t2)))
macdef TMmul(t1, t2) =
  TMopr("*", $list{term}(,(t1), ,(t2)))
macdef TMdiv(t1, t2) =
  TMopr("/", $list{term}(,(t1), ,(t2)))
macdef TMmod(t1, t2) =
  TMopr("%", $list{term}(,(t1), ,(t2)))
//
(* ****** ****** *)

macdef TMsucc(t) = TMadd(,(t), TMint(1))
macdef TMpred(t) = TMsub(,(t), TMint(1))

(* ****** ****** *)
//
macdef TMilt(t1, t2) = TMopr("<", $list{term}(,(t1), ,(t2)))
macdef TMilte(t1, t2) = TMopr("<=", $list{term}(,(t1), ,(t2)))
//
macdef TMigt(t1, t2) = TMopr(">", $list{term}(,(t1), ,(t2)))
macdef TMigte(t1, t2) = TMopr(">=", $list{term}(,(t1), ,(t2)))
//
macdef TMieq(t1, t2) = TMopr("=", $list{term}(,(t1), ,(t2)))
macdef TMineq(t1, t2) = TMopr("!=", $list{term}(,(t1), ,(t2)))
//
(* ****** ****** *)

macdef
TMopr_bin(opr, t1, t2) = TMopr(,(opr), $list{term}(,(t1), ,(t2)))

(* ****** ****** *)
//
val double_tm = TMlam(x, TMadd(x_tm, x_tm))
val square_tm = TMlam(x, TMmul(x_tm, x_tm))
//
val-VALint(20) = lambda_eval0 (TMapp(double_tm, TMint(10)))
val-VALint(100) = lambda_eval0 (TMapp(square_tm, TMint(10)))
//
(* ****** ****** *)

val
fib_tm =
TMfix(
  f
, TMlam(
    x
  , TMcond(TMigte(x_tm, TMint(2)), TMadd(TMapp(f_tm, TMsub(x_tm, TMint(1))), TMapp(f_tm, TMsub(x_tm, TMint(2)))), x_tm)
  )
)

(* ****** ****** *)

val () = let
  val-VALint(fib10) = lambda_eval0(TMapp(fib_tm, TMint(10)))
in
  println! ("fib(10) = ", fib10);
end // end of [val]

(* ****** ****** *)

val
fact_tm =
TMfix(
  f
, TMlam(
    x
  , TMcond(TMigt(x_tm, TMint(0)), TMmul(x_tm, TMapp(f_tm, TMpred(x_tm))), TMint(1))
  )
)

(* ****** ****** *)

val () = let
  val-VALint(fact10) = lambda_eval0(TMapp(fact_tm, TMint(10)))
  val-VALint(fact12) = lambda_eval0(TMapp(fact_tm, TMint(12)))
in
  println! ("fact(10) = ", fact10);
  println! ("fact(12) = ", fact12);
end // end of [val]

(* ****** ****** *)
//
val
f_list_length = cnam_string"list_length"
//
val xs = TMlist_nil()
val xs = TMlist_cons(TMint(2), xs)
val xs = TMlist_cons(TMint(1), xs)
val xs = TMlist_cons(TMint(0), xs)
val (_) = lambda_eval0(TMprintln(xs))
val-VALint(3) = lambda_eval0(TMapp(TMcst(f_list_length), xs))
//
(* ****** ****** *)

(* end of [lambda_test.dats] *)

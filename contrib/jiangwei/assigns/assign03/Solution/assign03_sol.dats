(* ****** ****** *)

#include "./../assign03.dats"

(* ****** ****** *)

(*
fun
Fact(n: int): int = let
  fun
  loop(i: int, res: int): int =
  if i < n then loop(i+1, (i+1)*res) else res
in
  loop(0, 1)
end // end of [fact]
*)
extern
val Fact : term

(* ****** ****** *)

(*
Please do your implementation below:
*)

(* ****** ****** *)

extern
fun
subst // t0[x -> t1]
( t0: term
, x0: string, sub: term): term

implement
subst
(t0, x0, sub) = 
(
case t0 of
| TMint(i) => t0
| TMvar(x) =>
  if x = x0 then sub else t0
| TMlam(x, t) =>
  if x = x0
    then t0 else TMlam(x, subst(t, x0, sub))
  // end of [if]
| TMapp(t1, t2) =>
  TMapp(subst(t1, x0, sub),  subst(t2, x0, sub))
| TMopr(opr, ts) =>
  TMopr(opr, list0_map<term><term>(ts, lam(t) => subst(t, x0, sub)))
| TMifnz(t1, t2, t3) =>
  TMifnz(subst(t1, x0, sub), subst(t2, x0, sub), subst(t3, x0, sub))
| TMfix(f, x, t) =>
  if x0 = f then t0 else if x0 = x then t0 else TMfix(f, x, subst(t, x0, sub))
) (* end of [subst] *)

(* ****** ****** *)

implement
evaluate(t0) =
(
case+ t0 of
| TMint _ => t0
| TMvar _ => t0
| TMlam _ => t0
| TMapp(t1, t2) => let
    val t1 = evaluate(t1)
    val t2 = evaluate(t2) // call-by-value
  in
    case- t1 of
    | TMlam(x, t_body) => evaluate(subst(t_body, x, t2))
  end
| TMopr _ => eval_opr(t0)
| TMifnz _ => eval_ifnz(t0)
| TMfix(f, x, t_body) => TMlam(x, subst(t_body, f, t0))
) where
{
//
fun
eval_opr
(t0: term): term = let
//
#define :: list0_cons
#define nil list0_nil
//
val-TMopr(opr, ts) = t0
val ts =
list0_map<term><term>(ts, lam(t) => evaluate(t))
//
in
//
case- opr of
| "+" =>
  (
    case- ts of
    | TMint(i1)::TMint(i2)::nil() => TMint(i1+i2)
  )
| "-" =>
  (
    case- ts of
    | TMint(i1)::TMint(i2)::nil() => TMint(i1-i2)
  )
| "*" =>
  (
    case- ts of
    | TMint(i1)::TMint(i2)::nil() => TMint(i1*i2)
  )
| "/" =>
  (
    case- ts of
    | TMint(i1)::TMint(i2)::nil() => TMint(i1/i2)
  )
| "%" =>
  (
    case- ts of
    | TMint(i1)::TMint(i2)::nil() => TMint(i1%i2)
  )
| "~" =>
  (
    case- ts of TMint(i1)::nil() => TMint(~i1)
  )
| "abs" =>
  (
    case- ts of TMint(i1)::nil() => TMint(abs(i1))
  )
| "<" =>
  (
    case- ts of
    | TMint(i1)::TMint(i2)::nil() => TMint(bool2int(i1 < i2))
  )
| "<=" =>
  (
    case- ts of
    | TMint(i1)::TMint(i2)::nil() => TMint(bool2int(i1 <= i2))
  )
| ">" =>
  (
    case- ts of
    | TMint(i1)::TMint(i2)::nil() => TMint(bool2int(i1 > i2))
  )
| ">=" =>
  (
    case- ts of
    | TMint(i1)::TMint(i2)::nil() => TMint(bool2int(i1 >= i2))
  )
//
end // end of [eval_opr]

fun
eval_ifnz
(t0: term): term = let
//
val-
TMifnz
(t1, t2, t3) = t0
//
val t1 = evaluate(t1)
//
in
  case- t1 of
  | TMint(i) =>
    if i != 0
      then evaluate(t2) else evaluate(t3)
    // end of [if]
end // end of [eval_ifnz]

} (* end of [evaluate] *)

(* ****** ****** *)
//
(*
fun
IsPrime
(n: int) =
loop(2) where
{
//
fun
loop
(i: int): bool =
  if
  (i * i < n)
  then
  (if n % i > 0 then loop(i+1) else false)
  else true
//
}
*)
//
(* ****** ****** *)

(*
fun
NumberOfPrimes
(n: int) = loop(2, 0) where
{
  fun loop(i: int, res: int): int =
    if i < n then loop(i+1, res+IsPrime(i)) else res
}
*)

(* ****** ****** *)

local
//
val n = TMvar("n")
val i = TMvar("i")
val f = TMvar("f")
val res = TMvar("res")
val loop = TMvar("loop")
//
val TMtrue = TMint(1)
val TMfalse = TMint(0)
//
fun
gt_term_int
(t1: term, i2: int): term =
TMopr
( ">"
, list0_tuple(t1, TMint(i2)))

fun
lt_term_term
(t1: term, t2: term): term =
TMopr( "<", list0_tuple(t1, t2))
fun
lte_term_term
(t1: term, t2: term): term =
TMopr( "<=", list0_tuple(t1, t2))
//
fun
add_term_int
(t1: term, i2: int): term =
TMopr
( "+"
, list0_tuple(t1, TMint(i2)))
fun
add_term_term
(t1: term, t2: term): term =
TMopr("+", list0_tuple(t1, t2))
fun
mul_term_term
(t1: term, t2: term): term =
TMopr("*", list0_tuple(t1, t2))
fun
mod_term_term
(t1: term, t2: term): term =
TMopr("%", list0_tuple(t1, t2))
//
overload > with gt_term_int
overload < with lt_term_term
overload <= with lte_term_term
overload + with add_term_int
overload + with add_term_term
overload * with mul_term_term
overload % with mod_term_term
//
in

implement
Fact =
TMlam
( "n"
, TMapp(TMapp(loop, TMint(0)), TMint(1))
) where
{
val loop =
TMfix
( "f", "i",
  TMlam
  ( "res"
  , TMifnz(i < n, TMapp(TMapp(f, i + 1), (i+1) * res), res)
  )
)
}

implement
IsPrime =
TMlam
( "n",
  TMapp
  (
    TMfix
    ( "loop", "i",
      TMifnz
      ( i * i <= n
      , TMifnz(n % i > 0, TMapp(loop, i+1), TMfalse), TMtrue
      ) (* TMifnz *)
    )
  , TMint(2)
  )
) // end of [IsPrime]

macdef
TMapp2(f0, a1, a2) = TMapp(TMapp(,(f0), ,(a1)), ,(a2))

implement
NumberOfPrimes =
TMlam
( "n",
  TMapp2
  (
    TMfix
    ( "loop", "i",
      TMlam
      ( "res"
      , TMifnz(i < n, TMapp2(loop, i+1, res+TMapp(IsPrime, i)), res)
      ) (* TMlam *)
    )
  , TMint(2), TMint(0)
  )
) (* end of [NumberOfPrimes] *)

end // end of [local]

(* ****** ****** *)
//
// HX:
// The following testing code is provided:
//
implement
main0() =
{
//
  val () =
  println!
  ("Fact(5) = ", evaluate(TMapp(Fact, TMint(5))))
//
  val () =
  println!
  ("IsPrime(57) = ", evaluate(TMapp(IsPrime, TMint(57))))
  val () =
  println!
  ("IsPrime(73) = ", evaluate(TMapp(IsPrime, TMint(73))))
  val () =
  println!
  ("IsPrime(111) = ", evaluate(TMapp(IsPrime, TMint(111))))
//
  val () =
  println!
  ("NumberOfPrimes(10) = ", evaluate(TMapp(NumberOfPrimes, TMint(10))))
  val () =
  println!
  ("NumberOfPrimes(100) = ", evaluate(TMapp(NumberOfPrimes, TMint(100))))
//
} (* end of [main0] *)

(* ****** ****** *)

(* end of [assign03_sol.dats] *)

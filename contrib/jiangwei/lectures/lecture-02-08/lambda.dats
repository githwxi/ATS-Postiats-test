(* ****** ****** *)

#include
"share/atspre_staload.hats"
#include
"share/atspre_staload_libats_ML.hats"

(* ****** ****** *)

datatype term =
  | TMint of (int)
  | TMvar of string
  | TMlam of (string, term(*body*))
  | TMapp of (term(*fun*), term(*arg*))
  | TMopr of (string(*opr*), termlst)
  | TMifnz of (term(*test*), term(*then*), term(*else*))
  | TMfix of (string(*f*), string(*x*), term)
  
where termlst = list0(term)

(* ****** ****** *)

extern
fun
print_term(t0: term): void
extern
fun
fprint_term(out: FILEref, t0: term): void

overload print with print_term
overload fprint with fprint_term

(* ****** ****** *)

implement
fprint_val<term> = fprint_term

(* ****** ****** *)

implement
print_term(t0) = fprint_term(stdout_ref, t0)

implement
fprint_term(out, t0) =
(
case+ t0 of
| TMint(i) => fprint!(out, "TMint(", i, ")")
| TMvar(x) => fprint!(out, "TMvar(", x, ")")
| TMlam(x, t) => fprint!(out, "TMlam(", x, "; ", t, ")")
| TMapp(t1, t2) => fprint!(out, "TMapp(", t1, "; ", t2, ")")
| TMopr(opr, ts) => fprint!(out, "TMopr(", opr, "; ", ts)
| TMfix(f, x, t) => fprint!(out, "TMfix(", f, ", ", x, "; ", t, ")")
| TMifnz(t1, t2, t3) => fprint!(out, "TMifnz(", t1, "; ", t2, "; ", t3)
)

(* ****** ****** *)

extern
fun
subst // t0[x -> t1]
(t0: term, x0: string, sub: term): term

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

extern
fun
evaluate(t0: term): term

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
| TMfix(f, x, t_body) => evaluate(TMlam(x, subst(t_body, f, t0))) //TMlam(x, subst(t_body, f, t0))
) where
{

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
| "~" =>
  (
    case- ts of TMint(i1)::nil() => TMint(~i1)
  )
| "abs" =>
  (
    case- ts of TMint(i1)::nil() => TMint(abs(i1))
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

val f = TMvar("f")
val x = TMvar("x")
val y = TMvar("y")
val z = TMvar("z")

val I = TMlam("x", x)
val K = TMlam("x", TMlam("y", x))
val S = TMlam("x", TMlam("y", TMlam("z", TMapp(TMapp(x, z), TMapp(y, z)))))

(* ****** ****** *)

(*
val omega =
TMlam("x", TMapp(x, x))
val Omega = TMapp(omega, omega)
*)

(* ****** ****** *)

fun
f_omega(F: term): term = 
TMlam("x", TMapp(F, TMlam("y", TMapp(TMapp(x, x), y))))

fun
f_Omega(F: term): term =
let
val t = f_omega(F) in TMlam("x", TMapp(TMapp(t, t), x))
end

(* ****** ****** *)

fun
sub_term_int
(t1: term, i2: int): term =
TMopr
( "-"
, list0_tuple(t1, TMint(i2)))

fun
add_term_term
(t1: term, t2: term): term =
TMopr("+", list0_tuple(t1, t2))

fun
mul_term_term
(t1: term, t2: term): term =
TMopr("*", list0_tuple(t1, t2))

overload - with sub_term_int
overload + with add_term_term
overload * with mul_term_term

(* ****** ****** *)

(*
val fact =
f_Omega(F) where
{
  val n = TMvar("n")
  val F =
  TMlam("f", TMlam("n", TMifnz(n, n * TMapp(f, n-1), TMint(1))))
}
*)
val fact =
TMfix("f", "x", TMifnz(x, x * TMapp(f, x-1), TMint(1)))

val fact10 = TMapp(fact, TMint(10))

(* ****** ****** *)

(*
val fibo =
f_Omega(F) where
{
  val n = TMvar("n")
  val F =
  TMlam
  ( "f",
    TMlam("n", TMifnz(n, TMifnz(n-1, TMapp(f, n-1) + TMapp(f, n-2), TMint(1)), TMint(0)))
  )
}
*)

val fibo =
TMfix("f", "x", TMifnz(x, TMifnz(x-1, TMapp(f, x-1) + TMapp(f, x-2), TMint(1)), TMint(0)))

val fibo10 = TMapp(fibo, TMint(10))

(* ****** ****** *)

implement
main0() = let
(*
val () =
println!
("Hello from [lambda]!")
*)

val () = println!("I = ", I)
val () = println!("K = ", K)
val () = println!("S = ", S)

val () = println!("SKK(x) = ", evaluate(TMapp(TMapp(TMapp(S, K), K), x)))

val () = println!("fact10 = ", evaluate(fact10))
val () = println!("fibo10 = ", evaluate(fibo10))

in
  // nothing
end // end of [main0]

(* ****** ****** *)

(* end of [lambda.dats] *)

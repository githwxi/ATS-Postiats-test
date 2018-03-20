(* ****** ****** *)

#include
"share/atspre_staload.hats"
#include
"share/atspre_staload_libats_ML.hats"

(* ****** ****** *)

datatype term =
//
  | TMint of (int)
  | TMstr of string
//
  | TMvar of string
//
  | TMlam of (string, term(*body*))
  | TMapp of (term(*fun*), term(*arg*))
  | TMfix of (string(*f*), string(*x*), term)
//
  | TMopr of (string(*opr*), termlst)
  | TMifnz of (term(*test*), term(*then*), term(*else*))
  
where termlst = list0(term)

(* ****** ****** *)

datatype value =
  | VALint of int
  | VALstr of string
  | VALfix of (term, envir)
  | VALlam of (term, envir)

where envir = list0($tup(string, value))

(* ****** ****** *)

extern
fun
print_value(t0: value): void
extern
fun
fprint_value(out: FILEref, t0: value): void

overload print with print_value
overload fprint with fprint_value

(* ****** ****** *)

implement
fprint_val<value> = fprint_value

(* ****** ****** *)

implement
print_value
(t0) = fprint_value(stdout_ref, t0)

implement
fprint_value(out, t0) =
(
case+ t0 of
//
| VALint(i) => fprint!(out, "VALint(", i, ")")
| VALstr(s) => fprint!(out, "VALstr(", s, ")")
//
| VALlam(_, _) => fprint!(out, "VALlam(_, _)")
| VALfix(_, _) => fprint!(out, "VALfix(_, _)")
)

(* ****** ****** *)

extern
fun
evaluate : term -> value
extern
fun
evaluate2 : (term, envir) -> value

(* ****** ****** *)

implement
evaluate(src) =
evaluate2(src, list0_nil())

(* ****** ****** *)

extern
fun
envir_find :
(envir, string) -> value

implement
envir_find(env, x0) =
(
case- env of
| list0_cons(xv, env) =>
  if x0 = xv.0
    then xv.1 else envir_find(env, x0)
  // end of [if]
)

implement
evaluate2(t0, env) =
(
case t0 of
| TMint(i) => VALint(i)
| TMstr(s) => VALstr(s)
| TMvar(x) => envir_find(env, x)
//
| TMlam _ => VALlam(t0, env)
| TMfix _ => VALfix(t0, env)
//
| TMapp(t1, t2) => let
    val v1 = evaluate2(t1, env)
  in
    case- v1 of
    | VALlam
      (t_lam, env_lam) => let
        val v2 = evaluate2(t2, env)
        val-TMlam(x, t_body) = t_lam
        //insert tuple to env
        //name: x
        //value: v2
        val env_lam = list0_cons($tup(x, v2), env_lam)
      in
        evaluate2(t_body, env_lam)
      end
    | VALfix
      (t_fix, env_fix) => let
        val v2 = evaluate2(t2, env)
        //f refers to VALfix
        val-TMfix(f, x, t_body) = t_fix
        val env_fix = list0_cons($tup(x, v2), env_fix)
        val env_fix = list0_cons($tup(f, v1), env_fix)
      in
        evaluate2(t_body, env_fix)
      end
  end // end of [TMapp]
//
| TMopr _ => eval2_opr(t0, env)
//
| TMifnz(t1, t2, t3) => let
    val v1 = evaluate2(t1, env)
  in
    case- v1 of
    | VALint(i) =>
      if i != 0
        then evaluate2(t2, env) else evaluate2(t3, env)
      // end of [if]
  end
) where
{
//
fun
eval2_opr
( t0: term
, env: envir): value = let
//
#define :: list0_cons
#define nil list0_nil
//
val-TMopr(opr, ts) = t0
//
val vs =
list0_map<term><value>(ts, lam(t) => evaluate2(t, env))
//
in
case- opr of
| "+" =>
  (
    case- vs of
    | VALint(i1)::VALint(i2)::nil() => VALint(i1+i2)
  )
| "-" =>
  (
    case- vs of
    | VALint(i1)::VALint(i2)::nil() => VALint(i1-i2)
  )
| "*" =>
  (
    case- vs of
    | VALint(i1)::VALint(i2)::nil() => VALint(i1*i2)
  )
| "/" =>
  (
    case- vs of
    | VALint(i1)::VALint(i2)::nil() => VALint(i1/i2)
  )
| "~" =>
  (
    case- vs of VALint(i1)::nil() => VALint(~i1)
  )
| "abs" =>
  (
    case- vs of VALint(i1)::nil() => VALint(abs(i1))
  )
end // end of [eval2_opr]

} (* end of [evaluate2] *)

(* ****** ****** *)
//
val x = TMvar("x")
val f = TMvar("f")
//
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
//
val
fact =
TMfix
("f", "x", TMifnz(x, x * TMapp(f, x-1), TMint(1)))
//
val fact10 = TMapp(fact, TMint(10))
//
val
fibo =
TMfix
( "f", "x"
, TMifnz(x, TMifnz(x-1, TMapp(f, x-1) + TMapp(f, x-2), TMint(1)), TMint(0))
)
//
val fibo10 = TMapp(fibo, TMint(10))
//
(* ****** ****** *)

implement main0() = () where
{
val () = println!("fact10 = ", evaluate(fact10))
val () = println!("fibo10 = ", evaluate(fibo10))
}

(* ****** ****** *)

(* end of [lambda2.dats] *)

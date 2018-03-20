//usr/bin/env myatscc "$0"; exit
(*
##myatsccdef=\
patsopt --constraint-ignore --dynamic $1 | \
tcc -run -DATS_MEMALLOC_LIBC -I${PATSHOME} -I${PATSHOME}/ccomp/runtime -
*)
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
  | TMtup of termlst
  | TMproj of (term, int)
//
  | TMvar of string
//
  | TMlam of (string, term(*body*))
  | TMapp of (term(*fun*), term(*arg*))
  | TMfix of (string(*f*), string(*x*), term)
//
  | TMopr of (string(*opr*), termlst)
  | TMifnz of (term(*test*), term(*then*), term(*else*))
//
  | TMseq of (term, term)
  
where termlst = list0(term)

(* ****** ****** *)

datatype value =
  | VALint of int
  | VALstr of string
  | VALtup of valuelst
  | VALfix of (term, envir)
  | VALlam of (term, envir)
  | VALunit of ((*void*))

where
envir =
list0($tup(string, value))
and valuelst = list0(value)

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
| VALtup(vs) => fprint!(out, "VALtup(", vs, ")")
//
| VALlam(_, _) => fprint!(out, "VALlam(_, _)")
| VALfix(_, _) => fprint!(out, "VALfix(_, _)")
//
| VALunit() => fprint!(out, "VALunit()")
//
)

(* ****** ****** *)

extern
fun
interp1 : term -> value
extern
fun
interp2 : (term, envir) -> value

overload interp with interp1
overload interp with interp2

(* ****** ****** *)

implement
interp1(src) =
interp2(src, list0_nil())

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

fun
interp2_list
(ts: termlst, env: envir): valuelst =
list0_map<term><value>(ts, lam(t) => interp2(t, env))

implement
interp2(t0, env) =
(
case t0 of
//
| TMint(i) => VALint(i)
| TMstr(s) => VALstr(s)
//
| TMvar(x) => envir_find(env, x)
//
| TMlam _ => VALlam(t0, env)
| TMfix _ => VALfix(t0, env)
//
| TMtup(ts) =>
  VALtup(interp2_list(ts, env))
//
| TMproj
    (t_tup, i) => let
    val v_tup = interp2(t_tup, env)
  in
    case- v_tup of
    | VALtup(vs) => vs[i] // = list0_get_at_exn(vs, i)
  end
//
| TMapp(t1, t2) => let
    val v1 = interp2(t1, env)
  in
    case- v1 of
    | VALlam
      (t_lam, env_lam) => let
        val v2 = interp2(t2, env)
        val-TMlam(x, t_body) = t_lam
        val env_lam = list0_cons($tup(x, v2), env_lam)
      in
        interp2(t_body, env_lam)
      end
    | VALfix
      (t_fix, env_fix) => let
        val v2 = interp2(t2, env)
        val-TMfix(f, x, t_body) = t_fix
        val env_fix = list0_cons($tup(x, v2), env_fix)
        val env_fix = list0_cons($tup(f, v1), env_fix)
      in
        interp2(t_body, env_fix)
      end
  end // end of [TMapp]
//
| TMopr _ => interp2_opr(t0, env)
//
| TMifnz
    (t1, t2, t3) => let
    val v1 = interp2(t1, env)
  in
    case- v1 of
    | VALint(i) =>
      interp2(if i != 0 then t2 else t3, env)
  end
//
| TMseq(t1, t2) =>
  let val _ = interp2(t1, env) in interp2(t2, env) end
//
) where
{
//
fun
interp2_opr
( t0: term
, env: envir): value = let
//
#define :: list0_cons
#define nil list0_nil
//
val-TMopr(opr, ts) = t0
//
val vs =
list0_map<term><value>(ts, lam(t) => interp2(t, env))
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
| "print" =>
  (
    case- vs of v0::nil() =>
    (
    let val () =
      case+ v0 of
      | VALint(i) => print(i)
      | VALstr(s) => print(s)
      | VALtup(vs) => print("VALtup(...)")
      | VALlam(_, _) => print("VALlam(...)")
      | VALfix(_, _) => print("VALfix(...)")
      | VALunit() => print("VALunit()")
    in
      VALunit()
    end
    )
  )
| "println" =>
  (
    case- vs of v0::nil() =>
    (
    let val () =
      case+ v0 of
      | VALint(i) => println!(i)
      | VALstr(s) => println!(s)
      | VALtup(vs) => print("VALtup(...)")
      | VALlam(_, _) => println!("VALlam(...)")
      | VALfix(_, _) => println!("VALfix(...)")
      | VALunit() => print("VALunit()")
    in
      VALunit()
    end
    )
  )
end // end of [interp2_opr]

} (* end of [interp2] *)

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
("f", "x", TMseq(TMopr("println", list0_tuple(x)), TMifnz(x, x * TMapp(f, x-1), TMint(1))))
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
//
fun fst(t0: term): term = TMproj(t0, 0)
fun snd(t0: term): term = TMproj(t0, 1)
fun pair(t0: term, t1: term): term = TMtup(cons0(t0, cons0(t1, nil0())))
//
val f = TMvar("f")
val xy = TMvar("xy")
val
fact2 =
TMfix
("f", "xy", TMifnz(fst(xy), TMapp(f, pair(fst(xy)-1, fst(xy)*snd(xy))), snd(xy)))
//

(* ****** ****** *)

implement main0() = () where
{
val () = println!("fact10 = ", interp(fact10))
val () = println!("fibo10 = ", interp(fibo10))
val () = println!("fact2(10, 1) = ", interp(TMapp(fact2, pair(TMint(10), TMint(1)))))
}

(* ****** ****** *)

(* end of [lambda2.dats] *)

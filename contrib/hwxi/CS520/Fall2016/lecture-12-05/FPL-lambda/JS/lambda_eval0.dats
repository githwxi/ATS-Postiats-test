(* ****** ****** *)
//
datatype
value =
  | VALint of int
(*
  | VALstr of string
*)
  | VALclo of (term, venv)
//
where venv = list0($tup(tvar, value))
//
(* ****** ****** *)
//
extern
fun
tostring_value : value -> string
overload tostring with tostring_value
//
(* ****** ****** *)

implement
tostring_value
  (v0) =
(
case+ v0 of
| VALint(i0) => "VALint(" + String(i0) + ")"
(*
| VALstr(s0) => "VALstr(" + String(s0) + ")"
*)
| VALclo(t_fun, env) => "VALclo(" + tostring(t_fun) + "; ...)"
) (* end of [tostring_value] *)

(* ****** ****** *)

extern
fun
eval_cbv : term -> value
extern
fun
eval2_cbv : (term, venv) -> value

(* ****** ****** *)
//
implement
eval_cbv(t0) =
(
  eval2_cbv(t0, list0_nil())
)
//
(* ****** ****** *)

extern
fun
eval2_cbv_opr
(
  opr: string, ts: termlst, env: venv
) : value // end of [eval2_cbv_opr]

(* ****** ****** *)

implement
eval2_cbv(t0, env) =
(
case+ t0 of
//
| TMint(i0) => VALint(i0)
(*
| TMstr(s0) => VALstr(s0)
*)
//
| TMvar(x0) => xv.1 where
  {
    val-
    ~Some_vt(xv) =
      list0_find_opt(env, lam xv => x0 = xv.0)
    // end of [val]
  }
//
| TMlam(x, t) => VALclo (t0, env)
| TMapp(t1, t2) => let
    val v1 = eval2_cbv(t1, env)
    val v2 = eval2_cbv(t2, env)
  in
    case- v1 of
    | VALclo(t_fun, env2) =>
      (
        case- t_fun of
        | TMlam(x, t_body) =>
          eval2_cbv(t_body, list0_cons($tup(x, v2), env2))
        | TMfix(f, x, t_body) =>
          eval2_cbv(t_body, list0_cons($tup(x, v2), list0_cons($tup(f, v1), env2)))
      )
  end // end of [TMapp]
//
| TMfix _ => VALclo(t0, env)
//
| TMifnz(t1, t2, t3) => let
    val v1 = eval2_cbv(t1, env)
  in
    case- v1 of
    | VALint(i0) => if i0 != 0 then eval2_cbv(t2, env) else eval2_cbv(t3, env)
  end // end of [TMifnz]
//
| TMopr(opr, ts) => eval2_cbv_opr(opr, ts, env)
//
)

(* ****** ****** *)

implement
eval2_cbv_opr
(
  opr: string, ts: termlst, env: venv
) : value = let
  val vs = ts.map(TYPE{value})(lam t => eval2_cbv(t, env))
in
//
case- opr of
| "+" => (
    case- vs of
    | cons0(VALint(i1), cons0(VALint(i2), nil0())) => VALint(i1+i2)
(*
    | cons0(VALstring(s1), cons0(VALstring(s2), nil0())) => VALstring(s1+s2)
*)
  )
| "-" => (
    case- vs of
    | cons0(VALint(i1), cons0(VALint(i2), nil0())) => VALint(i1-i2)
  )
| "*" => (
    case- vs of
    | cons0(VALint(i1), cons0(VALint(i2), nil0())) => VALint(i1*i2)
  )
| "/" => (
    case- vs of
    | cons0(VALint(i1), cons0(VALint(i2), nil0())) => VALint(i1/i2)
  )
| "<" => (
    case- vs of
    | cons0(VALint(i1), cons0(VALint(i2), nil0())) => VALint(bool2int(i1 < i2))
  )
| "<=" => (
    case- vs of
    | cons0(VALint(i1), cons0(VALint(i2), nil0())) => VALint(bool2int(i1 <= i2))
  )
| ">" => (
    case- vs of
    | cons0(VALint(i1), cons0(VALint(i2), nil0())) => VALint(bool2int(i1 > i2))
  )
| ">=" => (
    case- vs of
    | cons0(VALint(i1), cons0(VALint(i2), nil0())) => VALint(bool2int(i1 >= i2))
  )
| "=" => (
    case- vs of
    | cons0(VALint(i1), cons0(VALint(i2), nil0())) => VALint(bool2int(i1 = i2))
  )
| "!=" => (
    case- vs of
    | cons0(VALint(i1), cons0(VALint(i2), nil0())) => VALint(bool2int(i1 != i2))
  )
//
end // end of [eval_cbv_opr]

(* ****** ****** *)

(* end of [lambda_eval0.dats] *)

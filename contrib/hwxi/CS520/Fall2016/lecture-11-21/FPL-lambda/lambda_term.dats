(*
** FPL-lambda
*)
(* ****** ****** *)

#include
"share/atspre_staload.hats"
#include
"share/HATS/atspre_staload_libats_ML.hats"

(* ****** ****** *)

staload "./lambda.sats"

(* ****** ****** *)

implement
print_term(t0) = fprint(stdout_ref, t0)
implement
print_value(v0) = fprint(stdout_ref, v0)

(* ****** ****** *)

implement fprint_val<term> = fprint_term
implement fprint_val<value> = fprint_value

(* ****** ****** *)

implement
fprint_term
  (out, t0) =
(
case+ t0 of
//
| TMvar(x) =>
    fprint! (out, "TMvar(", x, ")")
  // end of [TMvar]
//
| TMlam(x, t) =>
    fprint! (out, "TMlam(", x, " => ", t, ")")
| TMapp(t1, t2) =>
    fprint! (out, "TMapp(", t1, "; ", t2, ")")
//
| TMint(i0) => fprint! (out, "TMint(", i0, ")")
| TMstr(s0) => fprint! (out, "TMstr(", s0, ")")
//
| TMfix(f, x, t) =>
    fprint! (out, "TMfix(", f, "(", x, ") => ", t, ")")
  // end of [TMfix]
//
| TMifnz(t1, t2, t3) =>
    fprint! (out, "TMifnz(", t1, "; ", t2, "; ", t3, ")")
  // end of [TMifnz]
//
| TMopr(opr, ts) => fprint! (out, "TMopr(", opr, "; ", ts)
//
| TMlist(ts) => fprint! (out, "TMlist(", ts, ")")
//
)

(* ****** ****** *)

implement
fprint_value
  (out, v0) =
(
case+ v0 of
| VALint(i0) => fprint! (out, "VALint(", i0, ")")
| VALstr(s0) => fprint! (out, "VALstr(", s0, ")")
| VAList(vs) => fprint! (out, "VAList(", vs, ")")
| VALclo(t_fun, env) => fprint! (out, "VALclo(", t_fun, "; ...)")
)

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
| TMstr(s0) => VALstr(s0)
//
| TMvar(x0) => xv.1 where
  {
    val-
    ~Some_vt(xv) =
      list0_find_opt(env, lam xv => x0 = xv.0)
    // end of [val]
  }
//
| TMlam _ => VALclo(t0, env)
//
| TMapp(t1, t2) => let
    val v1 = eval2_cbv(t1, env)
    val v2 = eval2_cbv(t2, env)
  in
    case- v1 of
    | VALclo(t_fun, env2) =>
      (
        case- t_fun of
        | TMlam(x, t_body) =>
          eval2_cbv
          (
            t_body, list0_cons($tup(x, v2), env2)
          )
        | TMfix(f, x, t_body) =>
          eval2_cbv
          (
            t_body, list0_cons($tup(x, v2), list0_cons($tup(f, v1), env2))
          )
      )
  end // end of [TMapp]
//
| TMfix _ => VALclo(t0, env)
//
| TMifnz(t1, t2, t3) => let
    val v1 = eval2_cbv(t1, env)
  in
    case- v1 of
    | VALint(i0) =>
      if i0 != 0 then eval2_cbv(t2, env) else eval2_cbv(t3, env)
    | VALstr(s0) =>
      if s0 != "" then eval2_cbv(t2, env) else eval2_cbv(t3, env)
  end // end of [TMifnz]
//
| TMopr(opr, ts) => eval2_cbv_opr(opr, ts, env)
//
| TMlist(ts) => VAList((ts).map(TYPE{value})(lam t => eval2_cbv(t, env)))
//
)

(* ****** ****** *)

macdef
VALvoid() = VALint(0)

(* ****** ****** *)

implement
eval2_cbv_opr
(
  opr: string
, arg: termlst, env: venv
) : value = let
//
val vs =
arg.map(TYPE{value})
    (lam t => eval2_cbv(t, env))
//
in
//
case- opr of
| "+" => (
    case- vs of
    | cons0
      (
        VALint(i1)
      , cons0(VALint(i2), nil0())
      ) => VALint(i1+i2)
(*
    | cons0
      (
        VALstr(s1)
      , cons0(VALstr(s2), nil0())
       ) => VALstr(s1+s2)
*)
  )
| "-" => (
    case- vs of
    | cons0
      (
        VALint(i1)
      , cons0(VALint(i2), nil0())
      ) => VALint(i1-i2)
  )
| "*" => (
    case- vs of
    | cons0
      (
        VALint(i1)
      , cons0(VALint(i2), nil0())
      ) => VALint(i1*i2)
  )
| "/" => (
    case- vs of
    | cons0
      (
        VALint(i1)
      , cons0(VALint(i2), nil0())
      ) => VALint(i1/i2)
  )
| "%" => (
    case- vs of
    | cons0
      (
        VALint(i1)
      , cons0(VALint(i2), nil0())
      ) => VALint(i1%i2)
  )
//
| "<" => (
    case- vs of
    | cons0
      (
        VALint(i1)
      , cons0(VALint(i2), nil0())
      ) => VALint(bool2int(i1 < i2))
  )
| "<=" => (
    case- vs of
    | cons0
      (
        VALint(i1)
      , cons0(VALint(i2), nil0())
      ) => VALint(bool2int(i1 <= i2))
  )
| ">" => (
    case- vs of
    | cons0
      (
        VALint(i1)
      , cons0(VALint(i2), nil0())
      ) => VALint(bool2int(i1 > i2))
  )
| ">=" => (
    case- vs of
    | cons0
      (
        VALint(i1)
      , cons0(VALint(i2), nil0())
      ) => VALint(bool2int(i1 >= i2))
  )
| "=" => (
    case- vs of
    | cons0
      (
        VALint(i1)
      , cons0(VALint(i2), nil0())
      ) => VALint(bool2int(i1 = i2))
  )
| "!=" => (
    case- vs of
    | cons0
      (
        VALint(i1)
      , cons0(VALint(i2), nil0())
      ) => VALint(bool2int(i1 != i2))
  )
//
| "print" => (
    case- vs of
    | cons0(VALint(i0), nil0()) =>
        let val () = print(i0) in VALvoid() end
    | cons0(VALstr(s0), nil0()) =>
        let val () = print(s0) in VALvoid() end
  )
| "print_newline" => (
    case- vs of
    | nil0() =>
      let val () = println! () in VALvoid() end
  )
//
| "head" =>
  (
    case- vs of
    | cons0(VAList(vs), nil0()) => list0_head_exn(vs)
  )
| "tail" =>
  (
    case- vs of
    | cons0(VAList(vs), nil0()) => VAList(list0_tail_exn(vs))
  )
//
end // end of [eval_cbv_opr]

(* ****** ****** *)

(* end of [lambda_term.dats] *)

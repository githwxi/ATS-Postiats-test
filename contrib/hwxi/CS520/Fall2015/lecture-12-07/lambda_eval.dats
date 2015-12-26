(* ****** ****** *)
//
// Implement lambda_eval0
//
(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
//
(* ****** ****** *)

staload "./lambda.sats"

(* ****** ****** *)
//
extern
fun
lambda_eval : (envmap, term) -> value
extern
fun
lambda_eval_var : (envmap, vnam) -> value
extern
fun
lambda_eval_opr : (string, valuelst) -> value
//
(* ****** ****** *)
//
implement
lambda_eval0(t0) = let
//
val env =
  envmap_make_nil() in lambda_eval(env, t0)
//
end // end of [lambda_eval0]
//
(* ****** ****** *)

implement
lambda_eval
  (env0, t0) = let
//
macdef eval(t) =
  lambda_eval(env0, ,(t))
//
in
//
case+ t0 of
//
| TMint(i) => VALint(i)
| TMbool(b) => VALbool(b)
| TMfloat(f) => VALfloat(f)
| TMstring(s) => VALstring(s)
//
| TMvar(x) =>
    lambda_eval_var(env0, x)
  // TMvar
//
| TMcst(c) => lambda_eval_cst(c)
//
| TMlam _ => VALlam(t0, env0)
| TMfix _ => VALfix(t0, env0)
//
| TMopr (opr, ts) => let
    val vs =
    list_map_cloref<term><value>
    ( ts
    , lam(t) => lambda_eval(env0, t)
    ) (* list_map_cloref *)
  in
    lambda_eval_opr(opr, list_vt2t(vs))
  end // end of [TMopr]
//
| TMcond(t1, t2, t3) => let
    val-VALbool(b) = eval(t1)
  in
    if b then eval(t2) else eval(t3)
  end // end of [TMcond]
//
| TMapp(t_fun, t_arg) => let
    val v_fun = eval(t_fun)
    val v_arg = eval(t_arg) // call-by-value
  in
    case- v_fun of
    | VALlam(t_lam, env) => let
(*
        val () =
        println! ("t_lam = ", t_lam)
*)
        val-TMlam(x, t_body) = t_lam
      in
        lambda_eval(envmap_insert(env, x, v_arg), t_body)
      end // end of [VALlam]
    | VALfix(t_fix, env) => let
        val-TMfix(f, t_lam) = t_fix
        val-TMlam(x, t_body) = t_lam
        val env1 = envmap_insert(env, f, v_fun)
      in
        lambda_eval(envmap_insert(env1, x, v_arg), t_body)
      end // end of [VALlam]
  end // end of [TMapp]    
//
| TMlist_nil
    () => VALlist(list_nil)
| TMlist_cons
    (t1, t2) => let
    val v1 = eval(t1)
    val-VALlist(vs2) = eval(t2)
  in
    VALlist(list_cons(v1, vs2))
  end // end of [TMlist_cons]
  
//
end // end of [lambda_eval]

(* ****** ****** *)
//
implement
lambda_eval_var
  (env0, x) = let
//
val
opt =
envmap_search_opt(env0, x)
//
in
//
case+ opt of
| ~Some_vt v => v
| ~None_vt _ => let
    val () = prerrln! ("lambda_eval_var: x = ", x)
  in
    exit(1){value}
  end // end of [None_vt]
//
end // end of [lambda_eval_var]
//
(* ****** ****** *)

(*
//
// See lambda_libenv
//
implement lambda_eval_cst(c0) = ...
*)

(* ****** ****** *)

implement
lambda_eval_opr
  (opr, vs) = let
in
//
case+ opr of
| "+" =>
  (
    case- vs of 
    | $lst(
        VALint(i1)
      , VALint(i2)
      ) => VALint(i1 + i2)
  )
| "-" =>
  (
    case- vs of 
    | $lst(
        VALint(i1)
      , VALint(i2)
      ) => VALint(i1 - i2)
  )
| "*" =>
  (
    case- vs of 
    | $lst(
        VALint(i1)
      , VALint(i2)
      ) => VALint(i1 * i2)
  )
| "/" =>
  (
    case- vs of 
    | $lst(
        VALint(i1)
      , VALint(i2)
      ) => VALint(i1 / i2)
  )
| "%" =>
  (
    case- vs of 
    | $lst(
        VALint(i1)
      , VALint(i2)
      ) => VALint(i1 % i2)
  )
//
| "<" =>
  (
    case- vs of 
    | $lst(
        VALint(i1)
      , VALint(i2)
      ) => VALbool(i1 < i2)
  )
| "<=" =>
  (
    case- vs of 
    | $lst(
        VALint(i1)
      , VALint(i2)
      ) => VALbool(i1 <= i2)
  )
//
| ">" =>
  (
    case- vs of 
    | $lst(
        VALint(i1)
      , VALint(i2)
      ) => VALbool(i1 > i2)
  )
| ">=" =>
  (
    case- vs of 
    | $lst(
        VALint(i1)
      , VALint(i2)
      ) => VALbool(i1 >= i2)
  )
//
| "=" =>
  (
    case- vs of 
    | $lst(
        VALint(i1)
      , VALint(i2)
      ) => VALbool(i1 = i2)
  )
| "!=" =>
  (
    case- vs of 
    | $lst(
        VALint(i1)
      , VALint(i2)
      ) => VALbool(i1 != i2)
  )
//
| "isnil" =>
  (
    case- vs of 
    | $lst(VALlist(vs)) => VALbool(list_is_nil(vs))
  )
| "iscons" =>
  (
    case- vs of 
    | $lst(VALlist(vs)) => VALbool(list_is_cons(vs))
  )
//
| "list_hd" =>
  (
    case- vs of 
    | $lst(VALlist(cons(v, _))) => v
  )
| "list_tl" =>
  (
    case- vs of 
    | $lst(VALlist(cons(_, vs))) => VALlist(vs)
  )
//
| "print" => let
    val () =
    fprint!
      (stdout_ref, "VALlist(", vs, ")") in VALint(0)
    // end of [val]
  end // end of [...]
| "println" => let
    val () =
    fprintln!
      (stdout_ref, "VALlist(", vs, ")") in VALint(0)
    // end of [val]
  end // end of [...]
//
| _(*unsupported*) => let
    val () =
      prerrln! ("lambda_eval_opr: opr = ", opr)
    // end of [val]
  in
    exit(1){value}
  end // end of [lambda_eval_opr]
//
end // end of [lambda_eval_opr]

(* ****** ****** *)

(* end of [lambda_eval.dats] *)

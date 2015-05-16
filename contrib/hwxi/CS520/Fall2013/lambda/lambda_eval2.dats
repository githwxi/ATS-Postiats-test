(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
//
(* ****** ****** *)

staload "lambda.sats"

(* ****** ****** *)
//
staload "libats/ML/SATS/basis.sats"
staload "libats/ML/SATS/list0.sats"
staload _ = "libats/ML/DATS/list0.dats"
//
(* ****** ****** *)

implement
eval2_nil (t0) = let
  val env = environ_nil () in eval2 (env, t0)
end // end of [eval2_nil]

(* ****** ****** *)

extern
fun eval2_list
  (env: environ, ts: termlst): valuelst

(* ****** ****** *)

extern
fun eval2_app (v_fun: value, v_arg: value): value

(* ****** ****** *)

extern
fun eval2_opr
  (opr: string, vs: valuelst): value
extern
fun eval2_opr_add (vs: valuelst): value
extern
fun eval2_opr_sub (vs: valuelst): value
extern
fun eval2_opr_mul (vs: valuelst): value
extern
fun eval2_opr_igt (vs: valuelst): value
extern
fun eval2_opr_igte (vs: valuelst): value

(* ****** ****** *)

implement
eval2 (env, t0) = let
in
//
case+ t0 of
| TMint i => VALint (i)
| TMvar x => environ_find (env, x)
| TMlam _ => VALlam (env, t0)
| TMfix _ => VALfix (env, t0)
| TMapp (t1, t2) => let
    val v1 = eval2 (env, t1)
    and v2 = eval2 (env, t2) in eval2_app (v1, v2)
  end // end of [TMapp]
| TMopr (opr, ts) => let
    val vs = eval2_list (env, ts) in eval2_opr (opr, vs)
  end // end of [TMopr]
| TMifnz
  (
    t_test, t_then, t_else
  ) => let
    val-VALint (i) = eval2 (env, t_test)
  in
    if i != 0
      then eval2 (env, t_then) else eval2 (env, t_else)
    // end of [if]
  end (* end of [TMifnz] *)
//
end // end of [eval2]

(* ****** ****** *)

implement
eval2_list (env, ts) =
  list0_map<term><value> (ts, lam t => eval2 (env, t))
// end of [eval2_list]

(* ****** ****** *)

implement
eval2_app
  (v_fun, v_arg) = let
in
//
case+ v_fun of
| VALlam (env, t_lam) => let
    val-TMlam (x, t_body) = t_lam
    val env = environ_extend (env, x, v_arg)
  in
    eval2 (env, t_body)
  end // end of [VALlam]
| VALfix (env, t_fix) => let
    val-TMfix (f, x, t_body) = t_fix
    val env = environ_extend (env, f, v_fun)
    val env = environ_extend (env, x, v_arg)
  in
    eval2 (env, t_body)
  end // end of [VALfix]
| _ => let
    val () =
      prerrln! ("eval2_app: v_fun: non-function!")
    val () = assertloc (false)
  in
    exit (1)
  end // end of [_]
//
end // end of [eval2_app]

(* ****** ****** *)

implement
eval2_opr (opr, vs) =
(
case+ opr of
| "+" => eval2_opr_add (vs)
| "-" => eval2_opr_sub (vs)
| "*" => eval2_opr_mul (vs)
| "igt" => eval2_opr_igt (vs)
| "igte" => eval2_opr_igte (vs)
| _ => let
    val () = prerrln!
    (
      "eval2_opr: unsupported opr: ", opr
    )
    val () = assertloc (false)
  in
    exit(1)
  end // end of [_]
)

(* ****** ****** *)

implement
eval2_opr_add (vs) = let
//
val-cons0 (v1, vs) = vs
val-cons0 (v2, vs) = vs
//
val-VALint (i1) = v1 and VALint (i2) = v2
//
in
  VALint (i1+i2)
end // end of [eval2_opr_add]

(* ****** ****** *)

implement
eval2_opr_sub (vs) = let
//
val-cons0 (v1, vs) = vs
val-cons0 (v2, vs) = vs
//
val-VALint (i1) = v1 and VALint (i2) = v2
//
in
  VALint (i1-i2)
end // end of [eval2_opr_sub]

(* ****** ****** *)

implement
eval2_opr_mul (vs) = let
//
val-cons0 (v1, vs) = vs
val-cons0 (v2, vs) = vs
//
val-VALint (i1) = v1 and VALint (i2) = v2
//
in
  VALint (i1*i2)
end // end of [eval2_opr_mul]

(* ****** ****** *)

implement
eval2_opr_igt (vs) = let
//
val-cons0 (v1, vs) = vs
val-cons0 (v2, vs) = vs
//
val-VALint (i1) = v1 and VALint (i2) = v2
//
in
  if i1 > i2 then VALint(1) else VALint(0)
end // end of [eval2_opr_igt]

(* ****** ****** *)

implement
eval2_opr_igte (vs) = let
//
val-cons0 (v1, vs) = vs
val-cons0 (v2, vs) = vs
//
val-VALint (i1) = v1 and VALint (i2) = v2
//
in
  if i1 >= i2 then VALint(1) else VALint(0)
end // end of [eval2_opr_igte]

(* ****** ****** *)

(* end of [lambda_eval2.dats] *)

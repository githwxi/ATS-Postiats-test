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

extern
fun eval_list (ts: termlst): termlst

(* ****** ****** *)

extern
fun eval_opr
  (string(*opr*), ts: termlst): term
extern
fun eval_opr_add (ts: termlst): term
extern
fun eval_opr_sub (ts: termlst): term
extern
fun eval_opr_mul (ts: termlst): term
extern
fun eval_opr_igt (ts: termlst): term
extern
fun eval_opr_igte (ts: termlst): term

(* ****** ****** *)
//
// HX: [t0] is assumed to be closed
//
implement
eval (t0) = let
in
//
case+ t0 of
//
| TMint _ => t0
//
| TMlam _ => t0
//
| TMfix (f, x, t) =>
    TMlam (x, subst (t, f, t0))
  // end of [TMfix]
//
| TMapp
    (t0_fun, t0_arg) => let
    val t0_fun = eval (t0_fun)
    val t0_arg = eval (t0_arg)
    val-TMlam (x, t0_fun_body) = t0_fun
  in
    eval (subst (t0_fun_body, x, t0_arg))
  end
//
| TMopr (opr, ts) => let
    val ts = eval_list (ts) in eval_opr (opr, ts)
  end // end of [TMopr]
//
| TMifnz
  (
    t_test, t_then, t_else
  ) => let
    val-TMint (i) = eval (t_test)
  in
    if i != 0 then eval (t_then) else eval (t_else)
  end // end of [TMifnz]
//
| TMlet (x, t1, t2) => let
    val t1 = eval (t1) in eval (subst (t2, x, t1))
  end // end of [TMlet]
//
| TMtup (ts) => TMtup (eval_list (ts))
| TMproj (t, i) => TMproj (eval (t), i)
//
| TMvar x => let
    val () =
      prerrln! ("eval: TMvar(", x, ")")
    // end of [val]
    val () = assertloc (false) in exit(1)
  end (* end of [TMvar] *)
//
end // end of [eval]

(* ****** ****** *)
//
implement
eval_list (ts) =
  list0_map<term><term> (ts, lam t => eval (t))
//
(* ****** ****** *)

implement
eval_opr (opr, ts) = let
in
//
case+ opr of
| "+" => eval_opr_add (ts)
| "-" => eval_opr_sub (ts)
| "*" => eval_opr_mul (ts)
| "igt" => eval_opr_igt (ts)
| "igte" => eval_opr_igte (ts)
| _ => let
    val () = prerrln!
    (
      "eval_opr: unsupported opr: ", opr
    )
    val () = assertloc (false)
  in
    exit(1)
  end // end of [_]
//
end // end of [eval_opr]

(* ****** ****** *)

implement
eval_opr_add (ts) = let
//
val-cons0 (t1, ts) = ts
val-cons0 (t2, ts) = ts
//
val-TMint (i1) = t1 and TMint (i2) = t2
//
in
  TMint (i1+i2)
end // end of [eval_opr_add]

implement
eval_opr_sub (ts) = let
//
val-cons0 (t1, ts) = ts
val-cons0 (t2, ts) = ts
//
val-TMint (i1) = t1 and TMint (i2) = t2
//
in
  TMint (i1-i2)
end // end of [eval_opr_sub]

implement
eval_opr_mul (ts) = let
//
val-cons0 (t1, ts) = ts
val-cons0 (t2, ts) = ts
//
val-TMint (i1) = t1 and TMint (i2) = t2
//
in
  TMint (i1*i2)
end // end of [eval_opr_mul]

(* ****** ****** *)

implement
eval_opr_igt (ts) = let
//
val-cons0 (t1, ts) = ts
val-cons0 (t2, ts) = ts
//
val-TMint (i1) = t1 and TMint (i2) = t2
//
in
  if i1 > i2 then TMint(1) else TMint(0)
end // end of [eval_opr_igt]

(* ****** ****** *)

implement
eval_opr_igte (ts) = let
//
val-cons0 (t1, ts) = ts
val-cons0 (t2, ts) = ts
//
val-TMint (i1) = t1 and TMint (i2) = t2
//
in
  if i1 >= i2 then TMint(1) else TMint(0)
end // end of [eval_opr_igte]

(* ****** ****** *)

(* end of [lambda_eval.dats] *)

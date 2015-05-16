(*
** Implementing UTLC
*)

(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
//
(* ****** ****** *)

#ifdef
UTLC_ALL
#else
staload "./utlc.sats"
#endif

(* ****** ****** *)
//
extern
fun
eval_opr
  (opr: string, ts: termlst): term
//
(* ****** ****** *)
//
extern
fun
eval_cond (term, term, term): term
//
(* ****** ****** *)

extern
fun
eval_cbval_list(ts: termlst): termlst

(* ****** ****** *)

implement
eval_cbval(t0) = let
//
macdef eval = eval_cbval
//
in
//
case+ t0 of
//
| TMvar _ => t0
//
| TMint _ => t0
//
| TMlam _ => t0
| TMfix (f1, t1) =>
    eval(term_subst(t1, f1, t0))
//
| TMapp (t1, t2) => let
    val t1 = eval(t1)
    val t2 = eval(t2)
  in
    case+ t1 of
    | TMlam(x1, t10) =>
        eval(term_subst(t10, x1, t2))
      // end of [TMlam]
    | _ (* non-TMlam *) => TMapp(t1, t2)
  end // end of [TMapp]
//
| TMopr (opr, ts) => eval_opr (opr, ts)
//
| TMcond (t1, t2, t3) => eval_cond (t1, t2, t3)
//
end // end of [eval_cbval]

(* ****** ****** *)
//
implement
eval_cbval_list(ts) =
  list_vt2t(list_map_fun<term><term>(ts, eval_cbval))
//
(* ****** ****** *)

fun
eval_add
(
  opr: string, ts: termlst
) : term =
(
case+ ts of
| $list(
    TMint(i1),
    TMint(i2)
  ) => TMint(i1+i2)
| _ (*ill-typed*) => TMopr(opr, ts)
)

(* ****** ****** *)

fun
eval_sub
(
  opr: string, ts: termlst
) : term =
(
case+ ts of
| $list(
    TMint(i1),
    TMint(i2)
  ) => TMint(i1-i2)
| _ (*ill-typed*) => TMopr(opr, ts)
)

(* ****** ****** *)

fun
eval_mul
(
  opr: string, ts: termlst
) : term =
(
case+ ts of
| $list(
    TMint(i1),
    TMint(i2)
  ) => TMint(i1*i2)
| _ (*ill-typed*) => TMopr(opr, ts)
)

(* ****** ****** *)

fun
eval_div
(
  opr: string, ts: termlst
) : term =
(
case+ ts of
| $list(
    TMint(i1),
    TMint(i2)
  ) => TMint(i1/i2)
| _ (*ill-typed*) => TMopr(opr, ts)
)

(* ****** ****** *)

fun
eval_ilt
(
  opr: string, ts: termlst
) : term =
(
case+ ts of
| $list(
    TMint(i1), TMint(i2)
  ) => TMint(if i1 < i2 then 1 else 0)
| _ (*ill-typed*) => TMopr(opr, ts)
)

(* ****** ****** *)

fun
eval_ilte
(
  opr: string, ts: termlst
) : term =
(
case+ ts of
| $list(
    TMint(i1), TMint(i2)
  ) => TMint(if i1 <= i2 then 1 else 0)
| _ (*ill-typed*) => TMopr(opr, ts)
)

(* ****** ****** *)

fun
eval_igt
(
  opr: string, ts: termlst
) : term =
(
case+ ts of
| $list(
    TMint(i1), TMint(i2)
  ) => TMint(if i1 > i2 then 1 else 0)
| _ (*ill-typed*) => TMopr(opr, ts)
)

(* ****** ****** *)

fun
eval_igte
(
  opr: string, ts: termlst
) : term =
(
case+ ts of
| $list(
    TMint(i1), TMint(i2)
  ) => TMint(if i1 >= i2 then 1 else 0)
| _ (*ill-typed*) => TMopr(opr, ts)
)

(* ****** ****** *)

fun
eval_ieq
(
  opr: string, ts: termlst
) : term =
(
case+ ts of
| $list(
    TMint(i1), TMint(i2)
  ) => TMint(if i1 = i2 then 1 else 0)
| _ (*ill-typed*) => TMopr(opr, ts)
)

(* ****** ****** *)

fun
eval_ineq
(
  opr: string, ts: termlst
) : term =
(
case+ ts of
| $list(
    TMint(i1), TMint(i2)
  ) => TMint(if i1 != i2 then 1 else 0)
| _ (*ill-typed*) => TMopr(opr, ts)
)

(* ****** ****** *)

implement
eval_opr(opr, ts) = let
//
val ts = eval_cbval_list(ts)
//
in
//
case+ opr of
//
| "+" => eval_add (opr, ts)
| "-" => eval_sub (opr, ts)
| "*" => eval_mul (opr, ts)
| "/" => eval_div (opr, ts)
| "<" => eval_ilt (opr, ts)
| "<=" => eval_ilte (opr, ts)
| ">" => eval_igt (opr, ts)
| ">=" => eval_igte (opr, ts)
| "=" => eval_ieq (opr, ts)
| "!=" => eval_ineq (opr, ts)
| _(*unsupported*) => TMopr(opr, ts)
//
end // end of [eval_opr]

(* ****** ****** *)

implement
eval_cond
  (t1, t2, t3) = let
//
val t1 = eval_cbval(t1)
//
in
//
case t1 of
| TMint(i) =>
  eval_cbval
    (if i != 0 then t2 else t3)
  // end of [TMint]
| _(*ill-typed*) => TMcond(t1, t2, t3)
//
end // end of [eval_cond]

(* ****** ****** *)

(* end of [utlc_eval.dats] *)

(*
** Implementing UTFPL
*)

(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
//
(* ****** ****** *)

staload "./utfpl.sats"

(* ****** ****** *)
//
extern
fun
cenv_find
  (env: cenv, x: tvar): valueopt
//
(* ****** ****** *)
//
implement
cenv_find
  (env, x) =
(
//
case+ env of
| list_nil () => None ()
| list_cons (xv, env) =>
  (
    if x = xv.0
      then Some(xv.1) else cenv_find (env, x)
    // end of [if]
  ) (* end of [list_cons] *)
//
) (* end of [cenv_find] *)
//
(* ****** ****** *)
//
extern
fun
eval0_opr
  (opr: string, valuelst): value
//
(* ****** ****** *)

local

fun
aux_add
(
  opr: string, vs: valuelst
) : value =
(
case+ vs of
| $list(
    VALint(i1)
  , VALint(i2)
  ) => VALint(i1+i2)
| _ => $raise ILLTYPED("eval0_opr: +")
)

fun
aux_sub
(
  opr: string, vs: valuelst
) : value =
(
case+ vs of
| $list(
    VALint(i1)
  , VALint(i2)
  ) => VALint(i1-i2)
| _ => $raise ILLTYPED("eval0_opr: -")
)

fun
aux_mul
(
  opr: string, vs: valuelst
) : value =
(
case+ vs of
| $list(
    VALint(i1)
  , VALint(i2)
  ) => VALint(i1*i2)
| _ => $raise ILLTYPED("eval0_opr: *")
)

fun
aux_div
(
  opr: string, vs: valuelst
) : value =
(
case+ vs of
| $list(
    VALint(i1)
  , VALint(i2)
  ) => VALint(i1/i2)
| _ => $raise ILLTYPED("eval0_opr: /")
)

fun
aux_mod
(
  opr: string, vs: valuelst
) : value =
(
case+ vs of
| $list(
    VALint(i1)
  , VALint(i2)
  ) => VALint(i1%i2)
| _ => $raise ILLTYPED("eval0_opr: %")
)

(* ****** ****** *)

fun
aux_ilt
(
  opr: string, vs: valuelst
) : value =
(
case+ vs of
| $list(
    VALint(i1)
  , VALint(i2)
  ) => VALint(if i1 < i2 then 1 else 0)
| _ (*else*) => $raise ILLTYPED("eval0_opr: <")
)

fun
aux_ilte
(
  opr: string, vs: valuelst
) : value =
(
case+ vs of
| $list(
    VALint(i1)
  , VALint(i2)
  ) => VALint(if i1 <= i2 then 1 else 0)
| _ (*else*) => $raise ILLTYPED("eval0_opr: <=")
)

fun
aux_igt
(
  opr: string, vs: valuelst
) : value =
(
case+ vs of
| $list(
    VALint(i1)
  , VALint(i2)
  ) => VALint(if i1 > i2 then 1 else 0)
| _ (*else*) => $raise ILLTYPED("eval0_opr: >")
)

fun
aux_igte
(
  opr: string, vs: valuelst
) : value =
(
case+ vs of
| $list(
    VALint(i1)
  , VALint(i2)
  ) => VALint(if i1 >= i2 then 1 else 0)
| _ (*else*) => $raise ILLTYPED("eval0_opr: >=")
)

fun
aux_ieq
(
  opr: string, vs: valuelst
) : value =
(
case+ vs of
| $list(
    VALint(i1)
  , VALint(i2)
  ) => VALint(if i1 = i2 then 1 else 0)
| _ (*else*) => $raise ILLTYPED("eval0_opr: =")
)

fun
aux_ineq
(
  opr: string, vs: valuelst
) : value =
(
case+ vs of
| $list(
    VALint(i1)
  , VALint(i2)
  ) => VALint(if i1 != i2 then 1 else 0)
| _ (*else*) => $raise ILLTYPED("eval0_opr: !=")
)

(* ****** ****** *)

fun
aux_car
(
  opr: string, vs: valuelst
) : value =
(
case+ vs of
| $list(
    VALcons(v1, v2)
  ) => v1
| _ (*else*) => $raise ILLTYPED("eval0_opr: car")
)

fun
aux_cdr
(
  opr: string, vs: valuelst
) : value =
(
case+ vs of
| $list(
    VALcons(v1, v2)
  ) => v2
| _ (*else*) => $raise ILLTYPED("eval0_opr: cdr")
)

(* ****** ****** *)

fun
aux_isnil
(
  opr: string, vs: valuelst
) : value =
(
case+ vs of
| $list(v) => (
    case+ v of
    | VALnil () => VALint(1) | _ => VALint(0)
  ) (* end of [list_sing] *)
| _ (*else*) => $raise ILLTYPED("eval0_opr: isnil")
)

fun
aux_iscons
(
  opr: string, vs: valuelst
) : value =
(
case+ vs of
| $list(v) => (
    case+ v of
    | VALcons _ => VALint(1) | _ => VALint(0)
  ) (* end of [list_sing] *)
| _ (*else*) => $raise ILLTYPED("eval0_opr: iscons")
)

(* ****** ****** *)

fun
aux_print
(
  opr: string, vs: valuelst
) : value = let
//
fun
pr (v: value): void = let
//
overload print with pr of 1000
//
in
//
case+ v of
| VALint(i) => print(i)
| VALstr(x) => print(x)
| VALlam _  => print("lam(...)")
| VALnil _  => print!("nil(", ")")
| VALcons(v1, v2) => print!("cons(", v1, ", ", v2, ")")
//
end // end of [pr]
//
and
prlst
  (vs: valuelst): void =
(
case+ vs of
| list_nil () => ()
| list_cons (v, vs) => (pr(v); prlst(vs))
)
//
in
  prlst(vs); VALnil()
end // end of [aux_print]

(* ****** ****** *)

in (* in-of-local *)

implement
eval0_opr(opr, vs) =
(
//
case+ opr of
//
| "+" => aux_add (opr, vs)
| "-" => aux_sub (opr, vs)
| "*" => aux_mul (opr, vs)
| "/" => aux_div (opr, vs)
| "%" => aux_mod (opr, vs)
//
| "<" => aux_ilt (opr, vs)
| "<=" => aux_ilte (opr, vs)
| ">" => aux_igt (opr, vs)
| ">=" => aux_igte (opr, vs)
| "=" => aux_ieq (opr, vs)
| "!=" => aux_ineq (opr, vs)
//
| "car" => aux_car (opr, vs)
| "cdr" => aux_cdr (opr, vs)
//
| "isnil" => aux_isnil (opr, vs)
| "iscons" => aux_iscons (opr, vs)
//
| "print" => aux_print (opr, vs)
//
| _(*unsupported*) => $raise UNSUPPORTED(opr)
//
) (* end of [eval_opr] *)

end // end of [local]

(* ****** ****** *)

implement
eval0_cbval(t0) = let
//
fun
aux
(
  t0: term, env: cenv
) : value =
(
case+ t0 of
| TMint i => VALint(i)
| TMstr x => VALstr(x)
| TMcst c => eval0_cst (c)
| TMlam _ => VALlam (t0, env)
| TMvar x => let
    val opt = cenv_find (env, x)
  in
    case+ opt of
    | Some v => v
    | None _ => $raise UNBOUND(x)
  end // end of [TMvar]
| TMbind
    (f, r_def) => let
    val-Some(def) = !r_def in aux (def, env)
  end // end of [TMbind]
//
| TMopr (opr, ts) =>
    eval0_opr (opr, auxlst (ts, env))
  // end of [TMopr]
//
| TMapp (t1, t2) => let
    val v1 = aux(t1, env)
    val v2 = aux(t2, env)
  in
    case v1 of
    | VALlam (t_lam, env2) => let
        val-TMlam(x, t_body) = t_lam
      in
        aux (t_body, list_cons ((x, v2), env2))
      end // end of [VALlam]
    | _ (*non-VALlam*) =>
        $raise ILLTYPED("eval0_cbval: non-fun")
  end // end of [TMapp]
//
| TMlet
   (x, t1, t2) => let
    val v1 = aux (t1, env) in
    aux (t2, list_cons ((x, v1), env))
  end // end of [TMlet]
//
| TMcond
    (t1, t2, t3) => let
    val v1 = aux(t1, env)
  in
    case v1 of
    | VALint (i) =>
        aux (if i != 0 then t2 else t3, env)
      // VAint
    | _ (*non-VALint*) =>
        $raise ILLTYPED("eval0_cbval: non-int")
  end // end of [TMcond]
//
| TMnil () => VALnil ()
| TMcons (t1, t2) =>
    VALcons(aux(t1, env), aux(t2, env))
  // end of [TMcons]
//
| TMfix (f, _) => let
    val () =
    prerrln!
      ("eval0_cbval: TMfix: ", f)
    // end of [val]
  in
    $raise FATAL("eval0_cbval: TMfix")
  end // end of [TMfix]
| TMfix2 (f, _, _) => let
    val () =
    prerrln!
      ("eval0_cbval: TMfix2: ", f)
    // end of [val]
  in
    $raise FATAL("eval0_cbval: TMfix2")
  end // end of [TMfix2]
)
//
and
auxlst
(
  ts: termlst, env: cenv
) : valuelst =
(
case+ ts of
| list_nil () => list_nil ()
| list_cons (t, ts) =>
    list_cons (aux(t, env), auxlst(ts, env))
  // end of [list_cons]
)
//
in
  aux (t0, list_nil)
end // end of [eval0_cbval]

(* ****** ****** *)

(* end of [utfpl_eval.dats] *)

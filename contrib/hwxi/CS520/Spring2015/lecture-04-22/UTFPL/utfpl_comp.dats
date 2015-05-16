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
typedef
tenv = List0 @(tvar, term)
//
(* ****** ****** *)
//
extern
fun
tenv_find
  (env: tenv, x: tvar): Option(term)
//
implement
tenv_find (env, x) =
(
case+ env of
| list_nil () => None ()
| list_cons (vt, vts) =>
    if x = vt.0 then Some(vt.1) else tenv_find(vts, x)
  // end of [list_cons]
)
//
(* ****** ****** *)

implement
comp0_fix (t0) = let
//
fun
aux
(
  t0: term, env: tenv
) : term =
(
case+ t0 of
//
| TMint _ => t0
//
| TMstr _ => t0
//
| TMcst _ => t0
//
| TMvar xf => let
    val opt =
      tenv_find (env, xf)
    // end of [val]
  in
    case+ opt of
    | None () => t0
    | Some (t_bind) => t_bind
  end // end of [TMvar]
//
| TMlam (x, t_body) =>
    TMlam (x, aux (t_body, env))
  // end of [TMlam]
//
| TMfix (f, t_body) => let
    val r = ref(None)
    val env =
      cons ((f, TMbind(f, r)), env)
    // end of [val]
    val t_body_new = aux (t_body, env)
  in
    !r := Some(t_body_new); t_body_new
  end // end of [TMfix]
//
| TMfix2 (f, x, t_body) => let
    val r = ref(None)
    val env =
      cons ((f, TMbind(f, r)), env)
    // end of [val]
    val t_body_new =
      TMlam(x, aux (t_body, env))
    // end of [val]
  in
    !r := Some(t_body_new); t_body_new
  end // end of [TMfix]
//
| TMapp (t1, t2) =>
    TMapp (aux(t1, env), aux(t2, env))
//
| TMlet (x, t1, t2) =>
    TMlet(x, aux(t1, env), aux(t2, env))
//
| TMcond (t1, t2, t3) =>
  TMcond
    (aux(t1, env), aux(t2, env), aux(t3, env))
  // end of [TMcond]
//
| TMopr (opr, ts) => TMopr (opr, auxlst(ts, env))
//
| TMnil () => TMnil ()
| TMcons (t1, t2) => TMcons (aux(t1, env), aux(t2, env))
//
| TMbind _ => t0 // HX-2015-04-22: this should not occur!!!
//
) (* end of [aux] *)
//
and
auxlst
(
  ts: termlst, env: tenv
) : termlst = (
//
case+ ts of
| list_nil () => list_nil ()
| list_cons (t, ts) => list_cons (aux(t, env), auxlst(ts, env))
//
) (* end of [auxlst] *)
//
in
  aux(t0, list_nil)
end // end of [comp0_fix]

(* ****** ****** *)

(* end of [utfpl_comp.dats] *)

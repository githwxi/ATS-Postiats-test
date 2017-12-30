(*
** Implementing UTLC
*)

(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
#include
"share/atspre_staload_libats_ML.hats"
//
(* ****** ****** *)

#ifdef
UTLC_ALL
#else
staload "./utlc.sats"
#endif

(* ****** ****** *)

implement
fprint_val<term> = fprint_term

(* ****** ****** *)
//
implement
print_term (t) =
  fprint_term (stdout_ref, t)
//
(* ****** ****** *)

implement
fprint_term(out, t0) =
(
case+ t0 of
| TMvar (x) => fprint! (out, "TMvar(", x, ")")
| TMint (i) => fprint! (out, "TMint(", i, ")")
| TMlam (x, t) => fprint! (out, "TMlam(", x, "; ", t, ")")
| TMapp (t1, t2) => fprint! (out, "TMapp(", t1, "; ", t2, ")")
| TMfix (f, t) => fprint! (out, "TMfix(", f, "; ", t, ")")
| TMopr (opr, ts) => fprint! (out, "TMopr(", opr, "; ", ts, ")")
| TMcond (t1, t2, t3) => fprint! (out, "TMcond(", t1, "; ", t2, "; ", t3, ")")
)

(* ****** ****** *)
//
extern
fun
termlst_subst(termlst, tvar, term): termlst
//
implement
termlst_subst(ts0, x, t) =
  list_vt2t(list_map_cloref<term><term>(ts0, lam (t0) => term_subst(t0, x, t)))
//
(* ****** ****** *)

implement
term_subst
  (t0, x, t) = let
//
macdef
subst(t0) = term_subst(,(t0), x, t)
//
in
//
case+ t0 of
| TMvar(x1) =>
    if x = x1 then t else t0
//
| TMint(int) => t0
//
| TMlam (x1, t1) =>
    if x = x1 then t0 else TMlam(x1, subst(t1))
| TMfix (f1, t1) =>
    if x = f1 then t0 else TMfix(f1, subst(t1))
//
| TMapp (t1, t2) => TMapp (subst(t1), subst(t2))
//
| TMopr (opr, ts) => TMopr (opr, termlst_subst(ts, x, t))
//
| TMcond (t1, t2, t3) => TMcond (subst(t1), subst(t2), subst(t3))
//
end // end of [term_subst]

(* ****** ****** *)

(* end of [utlc_term.dats] *)

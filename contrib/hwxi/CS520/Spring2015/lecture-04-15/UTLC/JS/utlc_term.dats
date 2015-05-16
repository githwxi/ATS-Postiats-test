(*
** Implementing UTLC
*)

(* ****** ****** *)

implement
print_val<term> = print_term

(* ****** ****** *)

implement
print_term(t0) =
(
case+ t0 of
| TMvar (x) => print! ("TMvar(", x, ")")
| TMint (i) => print! ("TMint(", i, ")")
| TMlam (x, t) => print! ("TMlam(", x, "; ", t, ")")
| TMapp (t1, t2) => print! ("TMapp(", t1, "; ", t2, ")")
| TMfix (f, t) => print! ("TMfix(", f, "; ", t, ")")
| TMopr (opr, ts) => print! ("TMopr(", opr, "; ", ts, ")")
| TMcond (t1, t2, t3) => print! ("TMcond(", t1, "; ", t2, "; ", t3, ")")
)

(* ****** ****** *)
//
extern
fun
termlst_subst(termlst, tvar, term): termlst
//
implement
termlst_subst(ts0, x, t) =
  list_map(ts0, lam(t0) => term_subst(t0, x, t))
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

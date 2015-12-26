(* ****** ****** *)
//
// Implement <term>
//
(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
//
(* ****** ****** *)

staload "./lambda.sats"

(* ****** ****** *)

implement
print_term(x) = fprint_term(stdout_ref, x)
implement
prerr_term(x) = fprint_term(stderr_ref, x)

(* ****** ****** *)

implement
fprint_term(out, t0) =
(
case+ t0 of
//
| TMint(i) => fprint! (out, "TMint(", i, ")")
| TMbool(b) => fprint! (out, "TMbool(", b, ")")
| TMfloat(f) => fprint! (out, "TMfloat(", f, ")")
| TMstring(s) => fprint! (out, "TMstring(", s, ")")
//
| TMvar(x) => fprint! (out, "TMvar(", x, ")")
| TMcst(c) => fprint! (out, "TMcst(", c, ")")
//
| TMlam(x, t) => fprint! (out, "TMlam(", x, ", ", t, ")")
| TMfix(f, t) => fprint! (out, "TMfix(", f, ", ", t, ")")
//
| TMapp(t1, t2) => fprint! (out, "TMapp(", t1, ", ", t2, ")")
//
| TMopr(opr, ts) => fprint! (out, "TMopr(", opr,  "; ", ts, ")")
| TMcond(t0, t1, t2) => fprint! (out, "TMcond(", t0, ", ", t1, ", ", t2)
//
| TMlist_nil() => fprint! (out, "TMlist_nil(", ")")
| TMlist_cons(t1, t2) => fprint! (out, "TMlist_cons(", t1, "; ", t2, ")")
//
)

(* ****** ****** *)

implement
fprint_termlst
  (out, ts) = let
//
implement
fprint_val<term> (out, x) = fprint_term(out, x)
//
in
  fprint_list<term>(out, ts)
end // end of [fprint_termlst]

(* ****** ****** *)

implement
subst0 (t0, x0, sub) = let
//
macdef
subst(t) = subst0(,(t), x0, sub)
//
fun auxlst(ts: termlst): termlst =
(
case+ ts of
| nil() => nil()
| cons(t, ts) => cons(subst(t), auxlst(ts))
)
//
in
//
case+ t0 of
//
| TMint _ => t0
| TMbool _ => t0
| TMfloat _ => t0
| TMstring _ => t0
//
| TMvar(x1) =>
  if x0 = x1 then sub else t0
//
| TMcst(c0) => t0
//
| TMlam(x1, t1) =>
  if x0 = x1
    then t0 else TMlam(x1, subst(t1))
  // end of [TMlam]
| TMfix(f1, t1) =>
  if x0 = f1
    then t0 else TMfix(f1, subst(t1))
  // end of [TMfix]
//
| TMapp(t1, t2) => TMapp(subst(t1), subst(t2))
//
| TMopr(opr, ts) => TMopr(opr, auxlst(ts))
//
| TMcond(t0, t1, t2) =>
    TMcond(subst(t0), subst(t1), subst(t2))
  // end of [TMcond]
//
| TMlist_nil() => t0
| TMlist_cons(t1, t2) => TMlist_cons(subst(t1), subst(t2))
//
end // end of [subst0]

(* ****** ****** *)

(* end of [lambda_term.dats] *)

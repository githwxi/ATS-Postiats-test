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
//
| TMint (i) => fprint! (out, "TMint(", i, ")")
| TMstr (x) => fprint! (out, "TMstr(", x, ")")
//
| TMcst (c) => fprint! (out, "TMcst(", c, ")")
//
| TMvar (x) => fprint! (out, "TMvar(", x, ")")
//
| TMlam (x, t) =>
    fprint! (out, "TMlam(", x, "; ", t, ")")
//
| TMapp (t1, t2) =>
    fprint! (out, "TMapp(", t1, "; ", t2, ")")
//
| TMlet (x, t1, t2) =>
    fprint! (out, "TMlet(", x, ";", t1, "; ", t2, ")")
//
| TMfix (f, t) =>
    fprint! (out, "TMfix(", f, "; ", t, ")")
| TMfix2 (f, x, t) =>
    fprint! (out, "TMfix2(", f, "; ", x, "; ", t, ")")
//
| TMopr (opr, ts) =>
    fprint! (out, "TMopr(", opr, "; ", ts, ")")
//
| TMcond (t1, t2, t3) =>
    fprint! (out, "TMcond(", t1, "; ", t2, "; ", t3, ")")
//
| TMnil () => fprint! (out, "TMnil(", ")")
| TMcons (t1, t2) => fprint! (out, "TMcons(", t1, ", ", t2, ")")
//
| TMbind (xf, r_def) => fprint! (out, "TMbind(", xf, " -> ", !r_def)
)

(* ****** ****** *)

(* end of [utfpl_term.dats] *)

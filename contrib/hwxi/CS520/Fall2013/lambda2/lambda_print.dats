(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
//
(* ****** ****** *)

staload "lambda.sats"

(* ****** ****** *)

staload "libats/ML/SATS/basis.sats"
staload "libats/ML/SATS/list0.sats"
staload _ = "libats/ML/DATS/list0.dats"

(* ****** ****** *)

implement
print_term (t) = fprint_term (stdout_ref, t)
implement
prerr_term (t) = fprint_term (stderr_ref, t)

(* ****** ****** *)

implement
fprint_term (out, t0) = let
in
//
case+ t0 of
| TMint (i) => fprint! (out, "TMint(", i, ")")
| TMvar x => fprint! (out, "TMvar(", x, ")")
//
| TMlam (x, t) => fprint! (out, "TMlam(", x, ", ", t, ")")
| TMfix (f, x, t) => fprint! (out, "TMfix(", f, ", ", x, ", ", t, ")")
//
| TMapp (t1, t2) => fprint! (out, "TMapp(", t1, ", ", t2, ")")
| TMopr (opr, ts) => fprint! (out, "TMopr(", opr, "; ", ts, ")")
| TMifnz (t1, t2, t3) => fprint! (out, "TMifnz(", t1, ", ", t2, ", ", t3, ")")
//
| TMlet (x, t1, t2) => fprint! (out, "TMlet(", x, ", ", t1, ", ", t2, ")")
//
| TMtup (ts) => fprint! (out, "TMtup(", ts, ")")
| TMproj (t, i) => fprint! (out, "TMproj(", t, ", ", i, ")")
//
end // end of [fprint_term]

(* ****** ****** *)

local

implement
fprint_val<term> (out, t) = fprint (out, t)

in (* in of [local] *)

implement
fprint_termlst (out, ts) = fprint_list0_sep<term> (out, ts, ", ")

end // end of [local]

(* ****** ****** *)

implement
print_value (v) = fprint_value (stdout_ref, v)
implement
prerr_value (v) = fprint_value (stderr_ref, v)

(* ****** ****** *)

implement
fprint_value (out, v0) = let
in
//
case+ v0 of
| VALint (i) => fprint! (out, "VALint(", i, ")")
| VALstring (str) => fprint! (out, "VALstring(", str, ")")
| VALlam (env, t_lam) => fprint! (out, "VALlam(...)")
| VALfix (env, t_fix) => fprint! (out, "VALfix(...)")
| VALtup (vs) => fprint! (out, "VALtup(", vs, ")")
//
end // end of [fprint_value]

(* ****** ****** *)

local

implement
fprint_val<value> (out, t) = fprint (out, t)

in (* in of [local] *)

implement
fprint_valuelst (out, vs) = fprint_list0_sep<value> (out, vs, ", ")

end // end of [local]

(* ****** ****** *)

(* end of [lambda_print.dats] *)

(* ****** ****** *)
//
// Implement <value>
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
print_value(x) = fprint_value(stdout_ref, x)
implement
prerr_value(x) = fprint_value(stderr_ref, x)

(* ****** ****** *)

implement
fprint_value(out, v0) =
(
case+ v0 of
//
| VALint(i) => fprint! (out, "VALint(", i, ")")
| VALbool(b) => fprint! (out, "VALbool(", b, ")")
| VALfloat(f) => fprint! (out, "VALfloat(", f, ")")
| VALstring(s) => fprint! (out, "VALstring(", s, ")")
//
| VALlam(t_lam, _) => fprint! (out, "VALlam(", t_lam, ")")
| VALfix(t_fix, _) => fprint! (out, "VALfix(", t_fix, ")")
//
| VALlist(vs) => fprint! (out, "VALlist(", vs, ")")
//
)

(* ****** ****** *)

implement
fprint_valuelst
  (out, ts) = let
//
implement
fprint_val<value> (out, x) = fprint_value(out, x)
//
in
  fprint_list<value>(out, ts)
end // end of [fprint_valuelst]

(* ****** ****** *)

(* end of [lambda_value.dats] *)

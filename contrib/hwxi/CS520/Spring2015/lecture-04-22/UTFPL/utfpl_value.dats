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
fprint_val<value> = fprint_value

(* ****** ****** *)
//
implement
print_value (v) =
  fprint_value (stdout_ref, v)
//
(* ****** ****** *)

implement
fprint_value(out, v0) =
(
case+ v0 of
//
| VALint (i) => fprint! (out, "VALint(", i, ")")
| VALstr (x) => fprint! (out, "VALstr(", x, ")")
//
| VALlam (t_lam, env) => fprint! (out, "VALlam(", "...", ")")
//
| VALnil ( ) => fprint! (out, "VALnil(", ")")
| VALcons (v1, v2) => fprint! (out, "VALcons(", v1, ", ", v2, ")")
//
) (* end of [fprint_value] *)

(* ****** ****** *)

(* end of [utfpl_value.dats] *)

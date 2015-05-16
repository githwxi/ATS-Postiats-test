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

assume tvar_type = string

(* ****** ****** *)
//
implement
var_make (name) = name
//
(* ****** ****** *)

implement
eq_var_var (x, y) = eq_string_string (x, y)
implement
neq_var_var (x, y) = neq_string_string (x, y)

(* ****** ****** *)
//
implement
fprint_val<tvar> = fprint_var
//
implement
print_var (x) = fprint_var (stdout_ref, x)
implement
prerr_var (x) = fprint_var (stderr_ref, x)
implement
fprint_var (out, x) = fprint_string (out, x)
//
(* ****** ****** *)

(* end of [utfpl_var.dats] *)

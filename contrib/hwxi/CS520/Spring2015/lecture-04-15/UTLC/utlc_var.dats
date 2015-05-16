(*
** Implementing UTLC
*)

(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
//
(* ****** ****** *)

#ifdef
UTLC_ALL
#else
staload "./utlc.sats"
#endif

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
fprint_var (out, x) = fprint_string (out, x)
//
(* ****** ****** *)

(* end of [utlc_var.dats] *)

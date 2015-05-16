(*
** Implementing UTLC
*)

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

implement
print_val<tvar> = print_var

(* ****** ****** *)
//
implement
print_var (x) = print_string (x)
//
(* ****** ****** *)

(* end of [utlc_var.dats] *)

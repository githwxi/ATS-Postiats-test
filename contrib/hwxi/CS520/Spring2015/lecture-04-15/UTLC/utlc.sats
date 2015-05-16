(*
** Implementing UTLC
*)

(* ****** ****** *)

abstype tvar_type = ptr
typedef tvar = tvar_type

(* ****** ****** *)
//
fun var_make(string): tvar
//
(* ****** ****** *)
//
fun
eq_var_var : (tvar, tvar) -> bool
fun
neq_var_var : (tvar, tvar) -> bool
//
overload = with eq_var_var
overload != with neq_var_var
//
(* ****** ****** *)
//
fun print_var : (tvar) -> void
fun fprint_var : fprint_type (tvar)
//
overload print with print_var
overload fprint with fprint_var
//
(* ****** ****** *)

datatype term =
  | TMvar of tvar
  | TMint of (int)
  | TMlam of (tvar, term)
  | TMfix of (tvar, term)
(*
  | TMfix2 of (tvar, tvar, term)
*)
  | TMapp of (term, term)
  | TMopr of (string(*opr*), termlst(*arg*))
  | TMcond of (term, term(*then*), term(*else*))

where termlst = List0(term)

(* ****** ****** *)
//
fun print_term : (term) -> void
fun fprint_term : fprint_type (term)
//
overload print with print_term
overload fprint with fprint_term
//
(* ****** ****** *)
//
fun
term_subst(t0: term, x: tvar, sub: term): term
//
(* ****** ****** *)

fun eval_cbnam (t0: term): term // call-by-name

(* ****** ****** *)

fun eval_cbval (t0: term): term // call-by-value

(* ****** ****** *)

(* end of [utlc.sats] *)

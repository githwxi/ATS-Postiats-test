(*
** FPL-lambda
*)
(* ****** ****** *)
//
#include
"share/HATS/atspre_staload_libats_ML.hats"
//
(* ****** ****** *)

typedef tvar = string

(* ****** ****** *)

datatype term =
//
  | TMvar of tvar
//
  | TMlam of (tvar, term)
  | TMapp of (term, term)
//
  | TMint of (int)
  | TMstr of (string)
//
  | TMfix of (tvar(*f*), tvar(*x*), term)
//
  | TMifnz of (term, term, term) // if non-zero then ... else ...
//
  | TMopr of (string(*opr*), termlst(*arg*))
//
  | TMlist of termlst
//
where termlst = list0(term)

(* ****** ****** *)
//
datatype
value =
  | VALint of int
  | VALstr of string
  | VAList of list0(value)
  | VALclo of (term, venv)
//
where
venv = list0($tup(tvar, value))
//
typedef valuelst = list0(value)
//
(* ****** ****** *)
//
fun
print_term(t0: term): void
fun
fprint_term(out: FILEref, t0: term): void
//
overload print with print_term
overload fprint with fprint_term
//
(* ****** ****** *)
//
fun
print_value(t0: value): void
fun
fprint_value(out: FILEref, t0: value): void
//
overload print with print_value
overload fprint with fprint_value
//
(* ****** ****** *)
//
fun
eval_cbv(t0: term): value // call-by-value
fun
eval2_cbv
  (t0: term, env: venv): value // call-by-value
//
(* ****** ****** *)
//
(*
fun
subst0(t0: term, x0: tvar, sub: term): term
*)
//
(* ****** ****** *)

(* end of [lambda.sats] *)

(*
** FPL-lambda
*)

(* ****** ****** *)
//
#define
LIBATSCC2JS_targetloc
"$PATSHOME\
/contrib/libatscc2js/ATS2-0.3.2"
//
(* ****** ****** *)
//
#include
"{$LIBATSCC2JS}/staloadall.hats"
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
where termlst = list0(term)

(* ****** ****** *)
//
fun
Var : (tvar) -> term = "mac#"
//
fun
Lam : (tvar, term) -> term = "mac#"
fun
App : (term, term) -> term = "mac#"
//
fun
Int : (int) -> term = "mac#"
fun
Str : (string) -> term = "mac#"
fun
Opr : (string, termlst) -> term = "mac#"
//
fun
Fix : (tvar, tvar, term) -> term = "mac#"
//
fun
Ifnz : (term, term, term) -> term = "mac#"
//
fun
Nil : () -> termlst = "mac#"
and
Cons : (term, termlst) -> termlst = "mac#"
//
fun Lt : (term, term) -> term = "mac#"
fun Lte : (term, term) -> term = "mac#"
fun Gt : (term, term) -> term = "mac#"
fun Gte : (term, term) -> term = "mac#"
fun Eq : (term, term) -> term = "mac#"
fun Neq : (term, term) -> term = "mac#"
//
fun Add : (term, term) -> term = "mac#"
fun Sub : (term, term) -> term = "mac#"
fun Mul : (term, term) -> term = "mac#"
fun Div : (term, term) -> term = "mac#"
fun Mod : (term, term) -> term = "mac#"
//
(* ****** ****** *)
//
datatype
value =
  | VALint of int
  | VALstr of string
  | VALclo of (term, venv)
//
where venv = list0($tup(tvar, value))
//
(* ****** ****** *)
//
fun
print_term(t0: term): void
fun
print_termlst(ts: termlst): void
//
overload print with print_term
overload print with print_termlst of 10
//
(* ****** ****** *)
//
fun
print_value(t0: value): void
//
overload print with print_value
//
(* ****** ****** *)
//
fun
tostring_term : term -> string
fun
tostring_termlst : termlst -> string
//
overload tostring with tostring_term
overload tostring with tostring_termlst of 10
//
(* ****** ****** *)
//
fun
tostring_value : value -> string
//
overload tostring with tostring_value
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

(* end of [lambda.sats] *)
 
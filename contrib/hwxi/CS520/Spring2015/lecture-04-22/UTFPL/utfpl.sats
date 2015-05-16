(*
** Implementing UTFPL
*)

(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
//
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
fun prerr_var : (tvar) -> void
fun fprint_var : fprint_type (tvar)
//
overload print with print_var
overload prerr with prerr_var
overload fprint with fprint_var
//
(* ****** ****** *)

typedef tcst = string

(* ****** ****** *)

datatype term =
//
  | TMint of int
  | TMstr of string
//
  | TMcst of tcst
//
  | TMvar of tvar
//
  | TMlam of (tvar, term)
//
  | TMfix of (tvar, term)
  | TMfix2 of (tvar, tvar, term)
//
  | TMapp of (term, term)
//
  | TMlet of (tvar, term, term) // let x = t1 in t2 end
//
  | TMopr of (string(*opr*), termlst(*arg*))
//
  | TMcond of (term, term(*then*), term(*else*))
//
  | TMnil of ()
  | TMcons of (term, term)
//
  | TMbind of (tvar, ref(termopt))
// end of [term]

where
termlst = List0(term)
and
termopt = Option(term)

(* ****** ****** *)
//
fun
print_term : (term) -> void
fun
fprint_term : fprint_type (term)
//
overload print with print_term
overload fprint with fprint_term
//
(* ****** ****** *)

macdef TMadd(a, b) = TMopr("+", $list{term}(,(a), ,(b)))
macdef TMsub(a, b) = TMopr("-", $list{term}(,(a), ,(b)))
macdef TMmul(a, b) = TMopr("*", $list{term}(,(a), ,(b)))

(* ****** ****** *)

macdef TMilt(a, b) = TMopr("<", $list{term}(,(a), ,(b)))
macdef TMilte(a, b) = TMopr("<=", $list{term}(,(a), ,(b)))
macdef TMigt(a, b) = TMopr(">", $list{term}(,(a), ,(b)))
macdef TMigte(a, b) = TMopr(">=", $list{term}(,(a), ,(b)))
macdef TMieq(a, b) = TMopr("=", $list{term}(,(a), ,(b)))
macdef TMineq(a, b) = TMopr("!=", $list{term}(,(a), ,(b)))

(* ****** ****** *)

macdef TMcar(xs) = TMopr("car", $list{term}(,(xs)))
macdef TMcdr(xs) = TMopr("cdr", $list{term}(,(xs)))

(* ****** ****** *)

macdef TMisnil(xs) = TMopr("isnil", $list{term}(,(xs)))
macdef TMiscons(xs) = TMopr("iscons", $list{term}(,(xs)))

(* ****** ****** *)

macdef TMapp2(f, x1, x2) = TMapp(TMapp(,(f), ,(x1)), ,(x2))
macdef TMapp3(f, x1, x2, x3) = TMapp(TMapp(TMapp(,(f), ,(x1)), ,(x2)), ,(x3))

(* ****** ****** *)

datatype value =
  | VALint of int
  | VALstr of string
  | VALlam of (term, cenv)
//
  | VALnil of ()
  | VALcons of (value, value)
// end of [value]

where cenv = List0 @(tvar, value)

(* ****** ****** *)
//
typedef
valuelst = List0(value)
typedef
valueopt = Option(value)
//
(* ****** ****** *)
//
fun
print_value : (value) -> void
fun
fprint_value : fprint_type (value)
//
overload print with print_value
overload fprint with fprint_value
//
(* ****** ****** *)

fun comp0_fix (t0: term): term

(* ****** ****** *)

exception FATAL of string
exception UNBOUND of tvar
exception ILLTYPED of string
exception UNSUPPORTED of string

(* ****** ****** *)

fun eval0_cst (c: tcst): value
fun bind0_cst (c: tcst, def: value): void

(* ****** ****** *)

fun eval0_cbval (t0: term): value

(* ****** ****** *)

(* end of [utfpl.sats] *)


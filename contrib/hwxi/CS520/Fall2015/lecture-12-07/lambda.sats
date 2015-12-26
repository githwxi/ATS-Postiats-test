(* ****** ****** *)
//
// Implementing
// untyped lambda-calculus
//
(* ****** ****** *)
//
(*
typedef vnam = string
*)
//
abstype
vnam_type = string
//
typedef vnam = vnam_type
//
(* ****** ****** *)

fun vnam_int : int -> vnam
fun vnam_string : string -> vnam

(* ****** ****** *)
//
fun
print_vnam : vnam -> void
and
prerr_vnam : vnam -> void
fun
fprint_vnam
  : (FILEref, vnam) -> void
overload print with print_vnam
overload prerr with prerr_vnam
overload fprint with fprint_vnam
//
(* ****** ****** *)

fun
eq_vnam_vnam : (vnam, vnam) -> bool
fun
neq_vnam_vnam : (vnam, vnam) -> bool
overload = with eq_vnam_vnam
overload != with neq_vnam_vnam
fun
compare_vnam_vnam : (vnam, vnam) -> int
overload compare with compare_vnam_vnam

(* ****** ****** *)
//
abstype
cnam_type = string
//
typedef cnam = cnam_type
//
(* ****** ****** *)

fun cnam_int : int -> cnam
fun cnam_string : string -> cnam

(* ****** ****** *)

fun cnam2string : cnam -> string

(* ****** ****** *)
//
fun
print_cnam : cnam -> void
and
prerr_cnam : cnam -> void
fun
fprint_cnam
  : (FILEref, cnam) -> void
overload print with print_cnam
overload prerr with prerr_cnam
overload fprint with fprint_cnam
//
(* ****** ****** *)

fun
eq_cnam_cnam : (cnam, cnam) -> bool
fun
neq_cnam_cnam : (cnam, cnam) -> bool
overload = with eq_cnam_cnam
overload != with eq_cnam_cnam
fun
compare_cnam_cnam : (cnam, cnam) -> int
overload compare with compare_cnam_cnam

(* ****** ****** *)

datatype term =
//
  | TMint of int
  | TMbool of bool
  | TMfloat of double
  | TMstring of string
//
  | TMvar of vnam
//
  | TMcst of cnam
//
  | TMlam of (vnam, term)
  | TMfix of (vnam, term)
//
  | TMapp of (term, term)
//
  | TMopr of (string(*opr*), termlst)
//
  | TMcond of (term, term(*then*), term(*else*))
//
  | TMlist_nil of ()
  | TMlist_cons of (term, term)
//
where termlst = List0(term)

(* ****** ****** *)
//
fun
print_term : term -> void
and
prerr_term : term -> void
overload print with print_term
overload prerr with prerr_term
//
fun
fprint_term : (FILEref, term) -> void
fun
fprint_termlst : (FILEref, termlst) -> void
//
overload fprint with fprint_term
overload fprint with fprint_termlst of 10
//
(* ****** ****** *)

fun
subst0
(
  t0: term, x: vnam, sub: term(*closed*)
) : term // end-of-fun

(* ****** ****** *)
//
// vnam-value-map
//
abstype envmap_type = ptr
typedef envmap = envmap_type
//
(* ****** ****** *)
//
datatype
value =
//
  | VALint of (int)
  | VALbool of (bool)
  | VALfloat of (double)
  | VALstring of (string)
//
  | VALlam of (term, envmap)
  | VALfix of (term, envmap)
//
  | VALlist of valuelst
//
where valuelst = List0(value)
//
(* ****** ****** *)
//
fun print_value : (value) -> void
fun prerr_value : (value) -> void
fun fprint_value : fprint_type(value)
fun fprint_valuelst : fprint_type(valuelst)
//
overload print with print_value
overload prerr with prerr_value
overload fprint with fprint_value
overload fprint with fprint_valuelst of 10
//
(* ****** ****** *)
//
fun envmap_make_nil(): envmap
//
fun
envmap_insert
  (envmap, vnam, value): envmap
//
fun
envmap_search_opt
  (xvs: envmap, x: vnam): Option_vt(value)
//
overload [] with envmap_search_opt
//
(* ****** ****** *)
//
fun
lambda_eval0: term(*closed*) -> value
//
(* ****** ****** *)

fun lambda_eval_cst (cst: cnam): value

(* ****** ****** *)

(* end of [lambda.sats] *)

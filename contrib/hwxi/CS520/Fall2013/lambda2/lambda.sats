(* ****** ****** *)
//
// Implementing lambda-calculus
//
(* ****** ****** *)

staload "libats/ML/SATS/basis.sats"

(* ****** ****** *)

typedef vname = string

(* ****** ****** *)

datatype term =
  | TMint of (int)
  | TMvar of vname
//
  | TMlam of (vname(*x*), term(*body*))
  | TMfix of (vname(*f*), vname(*x*), term(*body*))
//
  | TMapp of (term(*fun*), term(*arg*))
  | TMopr of (string(*opr*), termlst)
  | TMifnz of (term(*test*), term(*then*), term(*else*))
//
  | TMlet of (vname, term(*def*), term(*scope*))
//
  | TMtup of (termlst)
  | TMproj of (term, int)
//
// end of [term]

where termlst = list0 (term)

(* ****** ****** *)

abstype environ_type = ptr
typedef environ = environ_type

(* ****** ****** *)

fun environ_nil (): environ

(* ****** ****** *)

datatype value =
  | VALint of (int)
  | VALstring of (string)
  | VALlam of (environ, term (*lam-term*))
  | VALfix of (environ, term (*fix-term*))
  | VALtup of (valuelst)

where valuelst = list0 (value)

(* ****** ****** *)

fun VALvoid (): value // = VALtup (list0_nil)

(* ****** ****** *)

exception UnboundVarExn of vname

(* ****** ****** *)
//
fun environ_find
  (env: environ, x: vname): value
fun environ_extend
  (env: environ, x: vname, v: value): environ
//
(* ****** ****** *)
//
fun print_term : term -> void
fun prerr_term : term -> void
overload print with print_term
overload prerr with prerr_term
//
fun fprint_term : (FILEref, term) -> void
overload fprint with fprint_term
fun fprint_termlst : (FILEref, termlst) -> void
overload fprint with fprint_termlst of 10
//
(* ****** ****** *)
//
fun print_value : value -> void
fun prerr_value : value -> void
overload print with print_value
overload prerr with prerr_value
//
fun fprint_value : (FILEref, value) -> void
fun fprint_valuelst : (FILEref, valuelst) -> void
overload fprint with fprint_value
overload fprint with fprint_valuelst of 10
//
(* ****** ****** *)

(*
subst (t1, x, t2) = t1[x->t2]
*)
fun subst (t1: term, x: vname, t2: term): term

(* ****** ****** *)

fun eval (t: term): term

(* ****** ****** *)
//
fun eval2
  (environ, t: term): value
//
fun eval2_nil (t: term): value
//
(* ****** ****** *)

(* end of [lambda.sats] *)

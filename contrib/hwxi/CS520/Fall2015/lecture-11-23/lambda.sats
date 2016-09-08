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
abstype vnam = string
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
overload != with eq_vnam_vnam
fun
compare_vnam_vnam : (vnam, vnam) -> int
overload compare with compare_vnam_vnam

(* ****** ****** *)

datatype term =
  | TMint of int
  | TMbool of bool
  | TMvar of vnam
  | TMlam of (vnam, term)
  | TMapp of (term, term)
  | TMopr of (string(*opr*), termlst)
  | TMcond of (term, term(*then*), term(*else*))

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

abstype fvset = ptr

fun fvset_nil : () -> fvset
fun fvset_sing : (vnam) -> fvset

fun fvset_rmv : (fvset, vnam) -> fvset
fun fvset_diff : (fvset, fvset) -> fvset
fun fvset_union : (fvset, fvset) -> fvset

(* ****** ****** *)

fun FV : term -> fvset

(* ****** ****** *)

fun
subst0
(
  t0: term, x: vnam, sub: term(*closed*)
) : term // end-of-fun

(* ****** ****** *)

fun eval_cbn (t0: term): term // call-by-name

(* ****** ****** *)

fun eval_cbv (t0: term): term // call-by-value

(* ****** ****** *)

(* end of [lambda.sats] *)

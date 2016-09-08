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
  | TMvar of vnam // TMvar("x")
  | TMlam of (vnam, term) // TMlam("x", TMvar("x"))
  | TMapp of (term, term)
  
(* ****** ****** *)
//
fun
print_term : term -> void
and
prerr_term : term -> void
fun
fprint_term
  : (FILEref, term) -> void
overload print with print_term
overload prerr with prerr_term
overload fprint with fprint_term
//
(* ****** ****** *)

abstype fvset

fun fvset_sing : (vnam) -> fvset

fun fvset_rmv : (fvset, vnam) -> fvset
fun fvset_diff : (fvset, fvset) -> fvset
fun fvset_union : (fvset, fvset) -> fvset

(* ****** ****** *)

fun FV : term -> fvset

(* ****** ****** *)

fun subst0 (t0: term, x: vnam, sub: term(*closed*)): term

(* ****** ****** *)

(* end of [lambda.sats] *)

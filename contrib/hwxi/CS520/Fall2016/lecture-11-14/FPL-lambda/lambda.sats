(*
** FPL-LambdaCal
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
  | TMopr of (string(*opr*), termlst(*arg*))
//
  | TMfix of (tvar(*f*), tvar(*x*), term)
//
  | TMifnz of (term, term, term) // if non-zero then ... else ...
//
where termlst = list0(term)

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
(*
fun
eval_cbn(t0: term): term // call-by-name
*)
//
fun
eval_cbv(t0: term): term // call-by-value
//
(* ****** ****** *)
//
fun
subst0(t0: term, x0: tvar, sub: term): term
//
(* ****** ****** *)

datatype value =
  | VALint of int
  | VAL

(* ****** ****** *)

(* end of [lambda.sats] *)
 
(*
** Implementing UTFL
*)
(* ****** ****** *)
//
typedef
vnam = string
//
datatype term =
  | TMvar of vnam // TMvar("x")
  | TMlam of (vnam, term) // TMlam("x", TMvar("x"))
  | TMapp of (term, term)
//
(* ****** ****** *)
//
extern
fun
print_term : term -> void
and
prerr_term : term -> void
extern
fun
fprint_term
  : (FILEref, term) -> void
//
overload print with print_term
overload prerr with prerr_term
overload fprint with fprint_term
//
(* ****** ****** *)

implement main0 () = ()

(* ****** ****** *)

(* end of [lambda.dats] *)

(*
** Implementing UTLC
*)

(* ****** ****** *)

abstype var_t = ptr

(* ****** ****** *)

datatype
term =
| TMvar of var_t
| TMlam of (var_t, term)
| TMapp of (term, term)

(* ****** ****** *)

abstype varset_t = ptr
typedef varset = varset_t

(* ****** ****** *)
//
extern
fun varset_sing(var_t): varset
//
extern
fun varset_remove(varset, var_t): varset
//
extern
fun varset_union(varset, varset): varset
//
(* ****** ****** *)

extern
fun freevarset_of (term): varset

(* ****** ****** *)

implement
freevarset_of
  (t0) = let
//
macdef FV = freevarset_of
//
in
//
case+ t0 of
| TMvar (x) => varset_sing(x)
| TMlam (x, t) => varset_remove(FV(t), x)
| TMapp (t1, t2) => varset_union(FV(t1), FV(t2))
//
end // end of [freevarset_of]

(* ****** ****** *)

(* end of [utlc.dats] *)

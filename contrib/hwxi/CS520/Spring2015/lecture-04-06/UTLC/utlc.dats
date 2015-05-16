(*
** Implementing UTLC
*)

(* ****** ****** *)

abstype var_t = ptr

(* ****** ****** *)
//
extern
fun
eq_var_var: (var_t, var_t) -> bool
and
neq_var_var: (var_t, var_t) -> bool
//
overload = with eq_var_var
overload != with neq_var_var
//
(* ****** ****** *)

datatype
term =
| TMvar of var_t
| TMlam of (var_t, term)
| TMapp of (term, term)

(* ****** ****** *)

abstype varset = ptr

(* ****** ****** *)
//
extern
fun varset_nil(): varset
extern
fun varset_sing(var_t): varset
//
extern
fun varset_is_nil(varset): bool
//
extern
fun varset_remove(varset, var_t): varset
//
extern
fun varset_union(varset, varset): varset
//
(* ****** ****** *)

extern
fun fvarset_of (term): varset

(* ****** ****** *)

implement
fvarset_of
  (t0) = let
//
macdef FV = fvarset_of
//
in
//
case+ t0 of
| TMvar (x) => varset_sing(x)
| TMlam (x, t) => varset_remove(FV(t), x)
| TMapp (t1, t2) => varset_union(FV(t1), FV(t2))
//
end // end of [fvarset_of]

(* ****** ****** *)

extern
fun bvarset_of (term): varset

(* ****** ****** *)

implement
bvarset_of
  (t0) = let
//
macdef BV = bvarset_of
//
in
//
case+ t0 of
| TMvar (x) => varset_nil()
| TMlam (x, t) => varset_sing(x)
| TMapp (t1, t2) => varset_union(BV(t1), BV(t2))
//
end // end of [bvarset_of]

(* ****** ****** *)

overload + with varset_union

(* ****** ****** *)

extern
fun fbvarset_of (term): varset

implement
fbvarset_of(t0) = fvarset_of(t0)+bvarset_of(t0)

(* ****** ****** *)

extern
fun term_is_closed(term): bool

implement
term_is_closed(t0) = varset_is_nil(fvarset_of(t0))

(* ****** ****** *)
//
abstype cterm // closed
//
extern
fun ctm2tm(t: cterm): term
//
(* ****** ****** *)
//
extern
fun
subst(t0: term, x: var_t, t: cterm): term
//
(* ****** ****** *)

implement
subst(t0, x, t) =
(
case+ t0 of
| TMvar (x1) =>
  if x = x1 then ctm2tm(t) else t0
| TMlam (x1, t1) =>
  if x = x1 then t0 else TMlam(x1, subst(t1, x, t))
| TMapp (t1, t2) =>
  TMapp(subst(t1, x, t), subst(t2, x, t))
) (* end of [subst] *)

(* ****** ****** *)

(* end of [utlc.dats] *)

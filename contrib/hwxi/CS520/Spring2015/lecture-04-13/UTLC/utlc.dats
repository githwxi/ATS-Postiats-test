(*
** Implementing UTLC
*)

(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
//
staload
UN = "prelude/SATS/unsafe.sats"
//
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
//
implement
eq_var_var (x1, x2) =
  $UN.cast{string}(x1) = $UN.cast{string}(x2)
implement
neq_var_var (x1, x2) =
  $UN.cast{string}(x1) != $UN.cast{string}(x2)
//
(* ****** ****** *)
//
extern
fun print_var (x: var_t): void
extern
fun fprint_var (out: FILEref, x: var_t): void
//
overload print with print_var
overload fprint with fprint_var
//
(* ****** ****** *)
//
implement
print_var (x) =
  fprint_var (stdout_ref, x)
implement
fprint_var (out, x) =
  fprint_string (out, $UN.cast{string}(x))
//
(* ****** ****** *)

datatype
term =
| TMvar of var_t
| TMlam of (var_t, term)
| TMapp of (term, term)
(*
| TMint of (int)
| TMcond of (term, term, term)
*)
(* ****** ****** *)
//
extern
fun print_term (t: term): void
extern
fun fprint_term (out: FILEref, t: term): void
//
overload print with print_term
overload fprint with fprint_term
//
(* ****** ****** *)

implement
print_term (t) =
  fprint_term (stdout_ref, t)
implement
fprint_term (out, t0) =
(
//
case+ t0 of
| TMvar (x) => fprint! (out, "TMvar(", x, ")")
| TMlam (x, t) => fprint! (out, "TMlam(", x, "; ", t, ")")
| TMapp (t1, t2) => fprint! (out, "TMapp(", t1, ", ", t2, ")")
//
) (* end of [fprint_term] *)

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

(*
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
*)

(* ****** ****** *)

extern
fun bvarset_of (term): varset

(* ****** ****** *)

(*
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
*)

(* ****** ****** *)

overload + with varset_union

(* ****** ****** *)

extern
fun fbvarset_of (term): varset

(*
implement
fbvarset_of(t0) = fvarset_of(t0)+bvarset_of(t0)
*)

(* ****** ****** *)

extern
fun term_is_closed(term): bool

(*
implement
term_is_closed(t0) = varset_is_nil(fvarset_of(t0))
*)

(* ****** ****** *)
//
// for closed terms
//
abstype cterm = term
//
extern
castfn ctm2tm(t: cterm): term
extern
castfn tm2ctm(t: term): cterm
//
(* ****** ****** *)
//
extern
fun
csubst(t0: term, x: var_t, t: cterm): term
//
(* ****** ****** *)

implement
csubst(t0, x, t) =
(
case+ t0 of
| TMvar (x1) =>
  if x = x1 then ctm2tm(t) else t0
| TMlam (x1, t1) =>
  if x = x1 then t0 else TMlam(x1, csubst(t1, x, t))
| TMapp (t1, t2) =>
  TMapp(csubst(t1, x, t), csubst(t2, x, t))
) (* end of [subst] *)

(* ****** ****** *)

extern
fun interp(term): term

(* ****** ****** *)

implement
interp(t0) =
(
case+ t0 of
| TMvar _ => t0
| TMlam (x, t) => t0
| TMapp (t1, t2) => let
    val t1 = interp(t1)
    val t2 = interp(t2) // call-by-value
  in
    case- t1 of
    | TMlam (x1, t1_body) => interp(csubst(t1_body, x1, tm2ctm(t2)))
    | _ => TMapp(t1, t2)
  end
)

(* ****** ****** *)
//
val _x_ = $UN.cast{var_t}("x")
val _f_ = $UN.cast{var_t}("f")
//
val _tmx_ = TMvar(_x_)
val _tmf_ = TMvar(_f_)
//
val _0_ = TMlam(_f_, TMlam(_x_, _tmx_))
val _1_ = TMlam(_f_, TMlam(_x_, TMapp(_tmf_, _tmx_)))
//
(* ****** ****** *)
//
extern
fun
int2num{n:nat}(int(n)): term
//
implement
int2num(n) = let
//
fun
aux{n: nat}
  (n: int(n)): term = if n > 0 then TMapp(_tmf_, aux(n-1)) else _tmx_
//
in
  TMlam(_f_, TMlam(_x_, aux(n)))
end // end of [int2num]
//
(* ****** ****** *)

val _2_ = int2num(2)
val _3_ = int2num(3)
val _9_ = int2num(9)
val _10_ = int2num(10)

(* ****** ****** *)

val () = println! ("_0_ = ", _0_)
val () = println! ("_1_ = ", _1_)
val () = println! ("_10_ = ", _10_)

(* ****** ****** *)
//
extern
fun
num2int(term): intGte(0)
//
implement
num2int(t) = let
//
val-TMlam(_, t) = t
val-TMlam(_, t) = t
//
fun aux(t: term): intGte(0) =
(
case+ t of
| TMapp (_, t) => aux(t) + 1 | _ => 0
)
//
in
  aux(t)
end // end of [num2int]

(* ****** ****** *)

val () = assertloc(num2int(_0_) = 0)
val () = assertloc(num2int(_1_) = 1)
val () = assertloc(num2int(_10_) = 10)

(* ****** ****** *)

val tm23 = TMapp(_2_, _3_)
val tm23fx = TMapp(TMapp(tm23, _tmf_), _tmx_)

val tm32 = TMapp(_3_, _2_)
val tm32fx = TMapp(TMapp(tm32, _tmf_), _tmx_)

val tm92 = TMapp(_9_, _2_)
val tm92fx = TMapp(TMapp(tm92, _tmf_), _tmx_)

(* ****** ****** *)

val () = println! ("interp(tm23fx) = ", interp(tm23fx))
val () = println! ("interp(tm32fx) = ", interp(tm32fx))
val () = println! ("interp(tm92fx) = ", interp(tm92fx))

(* ****** ****** *)

implement main0 () = ()

(* ****** ****** *)

(* end of [utlc.dats] *)

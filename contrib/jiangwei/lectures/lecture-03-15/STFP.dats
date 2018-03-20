(* ****** ****** *)

#include
"share/atspre_staload.hats"
#include
"share/atspre_staload_libats_ML.hats"

(* ****** ****** *)

datatype styp =
  | STYbas of string
  | STYtup of (styp, styp)
  | STYfun of (styp, styp)

(* ****** ****** *)
//
extern
fun
eq_styp_styp
  : (styp, styp) -> bool
//
overload = with eq_styp_styp
//
(* ****** ****** *)

datatype expr =
//
  | EXPint of (int)
  | EXPstr of string
//
  | EXPsnd of (expr)
  | EXPfst of (expr)
  | EXPtup of (expr, expr)
//
  | EXPvar of string
  | EXPapp of (expr(*fun*), expr(*arg*))
  | EXPlam of (string(*x*), expr(*body*))
  | EXPfix of (string(*f*), string(*x*), expr(*body*))
// end of [expr]

(* ****** ****** *)

typedef
tyctx = list0($tup(string(*x*), styp(*T*)))

extern
fun
stypcheck(Gamma: tyctx, e0: expr): Option(styp)
extern
fun
stypcheck_var(Gamma: tyctx, e0: expr): Option(styp)
extern
fun
stypcheck_tup(Gamma: tyctx, e0: expr): Option(styp)
extern
fun
stypcheck_fst(Gamma: tyctx, e0: expr): Option(styp)
extern
fun
stypcheck_snd(Gamma: tyctx, e0: expr): Option(styp)
extern
fun
stypcheck_app(Gamma: tyctx, e0: expr): Option(styp)

(* ****** ****** *)

implement
stypcheck(Gamma, e0) =
(
case- e0 of
| EXPvar _ => stypcheck_var(Gamma, e0)
| EXPtup _ => stypcheck_tup(Gamma, e0)
| EXPfst _ => stypcheck_fst(Gamma, e0)
| EXPsnd _ => stypcheck_snd(Gamma, e0)
| EXPapp _ => stypcheck_app(Gamma, e0)
)

(* ****** ****** *)

implement
stypcheck_tup
  (Gamma, e0) = let
  val-EXPtup(e1, e2) = e0
  val opt1 = stypcheck(Gamma, e1)
  val opt2 = stypcheck(Gamma, e2)
in
  case+ opt1 of
  | None() =>
    None()
  | Some(T1) =>
    (
      case+ opt2 of
      | None() => None()
      | Some(T2) => Some(STYtup(T1, T2))
    )
end

(* ****** ****** *)

implement
stypcheck_fst
  (Gamma, e0) = let
  val-EXPfst(e1) = e0
  val opt1 = stypcheck(Gamma, e1)
in
  case+ opt1 of
  | None() =>
    None()
  | Some(T1) =>
    (
      case+ T1 of
      | STYtup(T11, _) => Some(T11) | _ => None()
    )
end

(* ****** ****** *)

implement
stypcheck_snd
  (Gamma, e0) = let
  val-EXPsnd(e2) = e0
  val opt2 = stypcheck(Gamma, e2)
in
  case+ opt2 of
  | None() =>
    None()
  | Some(T2) =>
    (
      case+ T2 of
      | STYtup(_, T22) => Some(T22) | _ => None()
    )
end

(* ****** ****** *)

implement
stypcheck_app
  (Gamma, e0) = let
  val-EXPapp(e1, e2) = e0
  val opt1 = stypcheck(Gamma, e1)
  val opt2 = stypcheck(Gamma, e2)
in
  case+ opt1 of
  | None() =>
    None()
  | Some(T1) =>
    (
      case+ T1 of
      | STYtup(T11, T12) =>
        (
          case+ opt2 of
          | None() =>
            None()
          | Some(T2) =>
            if T11 = T2 then Some(T12) else None()
        )
      | _ => None((*void*))
    )
end

(* ****** ****** *)

(* end of [STFP.dats] *)

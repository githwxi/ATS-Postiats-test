(* ****** ****** *)
(*
staload "./lambda.sats"
*)
(* ****** ****** *)
(*
#include
"share/atspre_define.hats"
#include
"{$LIBATSCC2JS}/staloadall.hats"
*)
(* ****** ****** *)
//
implement Var(x) = TMvar(x)
implement Lam(x, t) = TMlam(x, t)
implement App(t1, t2) = TMapp(t1, t2)
//
implement Int(i) = TMint(i)
implement Str(s) = TMstr(s)
//
implement Opr(opr, ts) = TMopr(opr, ts)
//
implement Fix(f, x, t) = TMfix(f, x, t)
//
implement Ifnz(t1, t2, t3) = TMifnz(t1, t2, t3)
//
(* ****** ****** *)
//
implement Nil() = nil0()
implement Cons(x,xs) = cons0(x, xs)
//
implement Lt(x, y) = Opr("<", Cons(x, Cons(y, Nil())))
implement Lte(x, y) = Opr("<=", Cons(x, Cons(y, Nil())))
implement Gt(x, y) = Opr(">", Cons(x, Cons(y, Nil())))
implement Gte(x, y) = Opr(">=", Cons(x, Cons(y, Nil())))
implement Eq(x, y) = Opr("=", Cons(x, Cons(y, Nil())))
implement Neq(x, y) = Opr("!=", Cons(x, Cons(y, Nil())))
//
implement Add(x, y) = Opr("+", Cons(x, Cons(y, Nil())))
implement Sub(x, y) = Opr("-", Cons(x, Cons(y, Nil())))
implement Mul(x, y) = Opr("*", Cons(x, Cons(y, Nil())))
implement Div(x, y) = Opr("/", Cons(x, Cons(y, Nil())))
implement Mod(x, y) = Opr("%", Cons(x, Cons(y, Nil())))
//
(* ****** ****** *)
//
implement
print_val<term> = print_term
//
(* ****** ****** *)

implement
print_term(t0) =
(
case+ t0 of
//
| TMvar(x) => print! ("TMvar(", x, ")")
//
| TMlam(x, t) =>
    print! ("TMlam(", x, " => ", t, ")")
| TMapp(t1, t2) =>
    print! ("TMapp(", t1, "; ", t2, ")")
//
| TMint(i0) => print! ("TMint(", i0, ")")
| TMstr(s0) => print! ("TMstring(", s0, ")")
//
| TMopr(opr, ts) => print! ("TMopr(", opr, "; ", ts)
//
| TMfix(f, x, t) =>
    print! ("TMfix(", f, "(", x, ") => ", t, ")")
//
| TMifnz(t1, t2, t3) =>
    print! ("TMifnz(", t1, "; ", t2, "; ", t3, ")")
)

implement
print_termlst(ts) = print_list0<term>(ts)

(* ****** ****** *)
//
implement
tostring_term
  (t0) = (
//
case+ t0 of
//
| TMvar(x) => "Var(" + String(x) + ")"
//
| TMlam(x, t) =>
    "Lam(" + String(x) + " => " + tostring(t) + ")"
| TMapp(t1, t2) =>
    "App(" + tostring(t1) + "; " + tostring(t2) + ")"
//
| TMint(i0) => "Int(" + String(i0) + ")"
| TMstr(s0) => "Str(" + (   s0   ) + ")"
//
| TMopr(opr, ts) =>
    "Opr(" + opr + ", " + tostring_termlst(ts) + ")"
  // end of [TMopr]
//
| TMfix(f, x, t) =>
    "Fix(" + String(f) + "(" + String(x) + ") => " + tostring(t) + ")"
//
| TMifnz(t1, t2, t3) =>
    "Ifnz(" + tostring(t1) + "; " + tostring(t2) + "; " + tostring(t3) + ")"
//
) (* end of [tostring_term] *)
//
(* ****** ****** *)

implement
tostring_termlst
  (ts) =
(
  case+ ts of
  | nil0() =>
    "Nil()"
  | cons0(t, ts) =>
    "Cons(" + tostring(t) + ", " + tostring_termlst(ts) + ")"
) (* end of [tostring_termlst] *)

(* ****** ****** *)

implement
subst0
(t0, x0, sub) = let
//
fun
mysubst(t0: term): term = subst0(t0, x0, sub)
//
in
//
case+ t0 of
//
| TMvar(x) => if x0 = x then sub else t0
//
| TMlam(x, t) =>
    if x0 = x then t0 else TMlam(x, mysubst(t))
  // end of [TMlam]
//
| TMapp(t1, t2) => TMapp(mysubst(t1), mysubst(t2))
//
| TMint _ => t0
| TMstr _ => t0
//
| TMopr(opr, ts) =>
    TMopr(opr, ts.map(TYPE{term})(lam t => mysubst(t)))
//
| TMfix(f, x, t) =>
    if x0 = f then t0 else
      if x0 = x then t0 else TMfix(f, x, mysubst(t))
    // end of [if]
//
| TMifnz(t1, t2, t3) =>
    TMifnz(mysubst(t1), mysubst(t2), mysubst(t3))
//
end // end of [subst0]

(* ****** ****** *)

fun
eval_cbv_opr
(
  opr: string, ts: termlst
) : term = let
  val ts = ts.map(TYPE{term})(lam t => eval_cbv(t))
in
//
case+ opr of
| "+" => (
    case+ ts of
    | cons0(TMint(i1), cons0(TMint(i2), nil0())) => TMint(i1+i2)
(*
    | cons0(TMstring(s1), cons0(TMstring(s2), nil0())) => TMstring(s1+s2)
*)
    | _(*type-error*) => TMopr(opr, ts)
  )
| "-" => (
    case+ ts of
    | cons0(TMint(i1), cons0(TMint(i2), nil0())) => TMint(i1-i2)
    | _(*type-error*) => TMopr(opr, ts)
  )
| "*" => (
    case+ ts of
    | cons0(TMint(i1), cons0(TMint(i2), nil0())) => TMint(i1*i2)
    | _(*type-error*) => TMopr(opr, ts)
  )
| "/" => (
    case+ ts of
    | cons0(TMint(i1), cons0(TMint(i2), nil0())) => TMint(i1/i2)
    | _(*type-error*) => TMopr(opr, ts)
  )
| "%" => (
    case+ ts of
    | cons0(TMint(i1), cons0(TMint(i2), nil0())) => TMint(i1%i2)
    | _(*type-error*) => TMopr(opr, ts)
  )
//
| "<" => (
    case+ ts of
    | cons0(TMint(i1), cons0(TMint(i2), nil0())) => TMint(bool2int(i1 < i2))
    | _(*type-error*) => TMopr(opr, ts)
  )
| "<=" => (
    case+ ts of
    | cons0(TMint(i1), cons0(TMint(i2), nil0())) => TMint(bool2int(i1 <= i2))
    | _(*type-error*) => TMopr(opr, ts)
  )
| ">" => (
    case+ ts of
    | cons0(TMint(i1), cons0(TMint(i2), nil0())) => TMint(bool2int(i1 > i2))
    | _(*type-error*) => TMopr(opr, ts)
  )
| ">=" => (
    case+ ts of
    | cons0(TMint(i1), cons0(TMint(i2), nil0())) => TMint(bool2int(i1 >= i2))
    | _(*type-error*) => TMopr(opr, ts)
  )
| "=" => (
    case+ ts of
    | cons0(TMint(i1), cons0(TMint(i2), nil0())) => TMint(bool2int(i1 = i2))
    | _(*type-error*) => TMopr(opr, ts)
  )
| "!=" => (
    case+ ts of
    | cons0(TMint(i1), cons0(TMint(i2), nil0())) => TMint(bool2int(i1 != i2))
    | _(*type-error*) => TMopr(opr, ts)
  )
//
| _(*unrecognized*) => TMopr(opr, ts)
//
end // end of [eval_cbv_opr]

(* ****** ****** *)

implement
eval_cbv(t0) =
(
case+ t0 of
| TMvar _ => t0
| TMlam _ => t0
//
| TMapp(t1, t2) => let
    val t1 = eval_cbv(t1)
    val t2 = eval_cbv(t2)
  in
    case+ t1 of
    | TMlam(x, t10) =>
        eval_cbv(subst0(t10, x, t2))
      // end of [TMlam]
    | _(*non-TMlam*) => TMapp(t1, t2)
  end // end of [TMapp]
//
| TMint _ => t0
| TMstr _ => t0
//
| TMopr(opr, ts) => eval_cbv_opr(opr, ts)
//
| TMfix(f, x, t_def) =>
    TMlam(x, subst0(t_def, f, t0))
  // end of [TMfix]
//
| TMifnz
  (
    t1, t2, t3
  ) => let
    val t1 =
      eval_cbv(t1)
    // end of [val]
  in
    case+ t1 of
    | TMint(i0) =>
      if i0 != 0
        then eval_cbv(t2)
        else eval_cbv(t3)
      // end of [if]
    | _(*non-TMint*) => TMifnz(t1, t2, t3)
  end // end of [TMifnz]
//
) (* end of [eval_cbv] *)

(* ****** ****** *)

(* end of [lambda_term.dats] *)

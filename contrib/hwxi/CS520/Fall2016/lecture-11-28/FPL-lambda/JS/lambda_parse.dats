(* ****** ****** *)

datatype term =
//
  | TMvar of tvar
//
  | TMlam of (tvar, term)
  | TMapp of (term, term)
//
  | TMint of (int)
(*
  | TMstr of (string)
*)
//
  | TMfix of (tvar(*f*), tvar(*x*), term)
//
  | TMifnz of (term, term, term) // if non-zero then ... else ...
//
  | TMopr of (string(*opr*), termlst(*arg*))
//
where
tvar = string
and
termlst = list0(term)

(* ****** ****** *)
//
extern
fun
tostring_term : term -> string
extern
fun
tostring_termlst : termlst -> string
//
overload tostring with tostring_term
overload tostring with tostring_termlst of 10
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
(*
| TMstr(s0) => "Str(" + (   s0   ) + ")"
*)
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
//
extern
fun
string2term_parse
  (inp: string): Option(term)
//
(* ****** ****** *)
//
val
par_COMMA =
sat{token}
(
  lam x =>
  case+ x of
  | TOKspchr(",") => true | _ => false
)
//
val
par_LPAREN =
sat{token}
(
  lam x =>
  case+ x of
  | TOKspchr("(") => true | _ => false
)
//
val
par_RPAREN =
sat{token}
(
  lam x =>
  case+ x of
  | TOKspchr(")") => true | _ => false
)
//
(* ****** ****** *)
//
val
par_IFNZ =
sat{token}
(
  lam x =>
  case+ x of
  | TOKkeywd("ifnz") => true | _ => false
)
val
par_THEN =
sat{token}
(
  lam x =>
  case+ x of
  | TOKkeywd("then") => true | _ => false
)
val
par_ELSE =
sat{token}
(
  lam x =>
  case+ x of
  | TOKkeywd("else") => true | _ => false
)
//
(* ****** ****** *)
//
val
par_EQGT =
sat{token}
(
  lam x =>
  case+ x of
  | TOKkeywd("=>") => true | _ => false
)
//
val
par_LAM =
sat{token}
(
lam x =>
case+ x of
| TOKkeywd("lam") => true | _ => false
)
val
par_FIX =
sat{token}
(
lam x =>
case+ x of
| TOKkeywd("fix") => true | _ => false
)
//
(* ****** ****** *)

val
par_var =
parser_map
(
sat{token}
(
  lam tok =>
  case+ tok of
  | TOKident _ => true | _ => false
)
,
lam(tok) =>
let val-TOKident(name) = tok in name end
)

(* ****** ****** *)

val
par_TMint =
parser_map
(
sat{token}
(
  lam tok =>
  case+ tok of
  | TOKint _ => true | _ => false
)
,
lam(tok) =>
let val-TOKint(i0) = tok in TMint(i0) end
)

val
par_TMvar =
parser_map
(
sat{token}
(
  lam tok =>
  case+ tok of
  | TOKident _ => true | _ => false
)
,
lam(tok) =>
let val-TOKident(id) = tok in TMvar(id) end
)

(* ****** ****** *)

macdef << = parser_tup2_fst
macdef >> = parser_tup2_snd

(* ****** ****** *)
//
extern
fun
lpar_aterm
(
): lazy(parser(token, term))
extern
fun
lpar_term0
(
): lazy(parser(token, term))
//
(* ****** ****** *)

extern
fun
parser_unlazy
{a:t@ype}
{t:t@ype}
(lp: lazy(parser(a, t))): parser(a, t)
implement
parser_unlazy(lp) = lam(inp0) => (!lp)(inp0)

(* ****** ****** *)

val
par_aterm =
parser_unlazy(lpar_aterm())
val
par_term0 =
parser_unlazy(lpar_term0())

(* ****** ****** *)
//
implement
lpar_aterm() = $delay
(
par_TMint ||
par_TMvar ||
(par_LPAREN >> (par_term0 << par_RPAREN))
)
//
(* ****** ****** *)

val
par_TMlam =
parser_map2
  {token}{tvar,term}{term}
(
  par_LAM >> par_var
, par_EQGT >> par_term0
, lam(x, t) => TMlam(x, t)
)

(* ****** ****** *)

val
par_TMfix =
parser_map3
  {token}{tvar,tvar,term}{term}
(
  par_FIX >> par_var
, par_LPAREN >> (par_var << par_RPAREN)
, par_EQGT >> par_term0
, lam(f, x, t) => TMfix(f, x, t)
)

(* ****** ****** *)

val
par_TMifnz =
parser_map3
  {token}{term,term,term}{term}
(
  par_IFNZ >> par_term0
, par_THEN >> par_term0
, par_ELSE >> par_term0
, lam(t0, t1, t2) => TMifnz(t0, t1, t2)
)

(* ****** ****** *)

fun
term_is_opr
  (t0: term): bool =
(
  case+ t0 of
  | TMvar(opr) =>
    (
      ifcase
        | opr = "+" => true
        | opr = "-" => true
        | opr = "*" => true
        | opr = "/" => true
        | opr = "<" => true
        | opr = "<=" => true
        | opr = ">" => true
        | opr = ">=" => true
        | opr = "=" => true
        | opr = "!=" => true
        | _(*else*) => false
    )
  | _(*non-TMvar*) => false
)

(* ****** ****** *)

fun
TM_app_opr
(
  t0: term, ts: termlst
) : term = let
//
fun
aux_app
(
  t0: term, ts: termlst
) : term =
(
  case+ ts of
  | nil0() => t0
  | cons0(t, ts) => aux_app(TMapp(t0, t), ts)
)
//
in
//
if
term_is_opr(t0)
then let
  val-TMvar(opr) = t0
in
  TMopr(opr, ts)
end // end of [then]
else aux_app(t0, ts)
//
end // end of [TM_app_opr]

(* ****** ****** *)

val
par_TM_app_opr =
parser_map
{token}{termlst}{term}
(
  repeat1(par_aterm)
, lam(ts) =>
  let val-cons0(t0, ts) = ts in TM_app_opr(t0, ts) end
)

(* ****** ****** *)

implement
lpar_term0() = $delay
(
  par_TMlam ||
  par_TMfix ||
  par_TMifnz ||
  par_TM_app_opr ||
  parser_fail()
)

(* ****** ****** *)

implement
string2term_parse
  (inp) = opt where
{
//
val
toks = string_tokenize(inp)
val+
PAROUT(opt, toks) = par_term0(toks)
//
} (* end of [string2term_parse] *)

(* ****** ****** *)

(* end of [lambda_parse.dats] *)

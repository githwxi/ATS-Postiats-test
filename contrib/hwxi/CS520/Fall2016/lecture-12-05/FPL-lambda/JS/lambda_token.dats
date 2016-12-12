(* ****** ****** *)
(*
//
// HX:
// Note: typedef char = int
//
*)
(* ****** ****** *)

#staload
"{$LIBATSCC2JS}/SATS/BUCS320/parcomb.sats"

(* ****** ****** *)
//
datatype token =
//
  | TOKint of int
//
  | TOKident of string
//
  | TOKkeywd of string
//
  | TOKspchr of strchr
  | TOKspace of ((*void*))
//
  | TOKendin of stream(char)
//
(* ****** ****** *)
//
extern
fun
print_token : token -> void
overload print with print_token
//
implement
print_token
  (tok) =
(
  case+ tok of
  | TOKint x => print! ("TOKint(", x, ")")
  | TOKspace _ => print! ("TOKspace(", ")")
  | TOKident x => print! ("TOKident(", x, ")")
  | TOKkeywd x => print! ("TOKkeywd(", x, ")")
  | TOKspchr x => print! ("TOKspchr(", x, ")")
  | TOKendin _ => print! ("TOKendin(", ")")
)
//
//
extern
fun
fprint_token : fprint_type(token)
overload fprint with fprint_token
//
implement
fprint_token
  (out, tok) =
(
  case+ tok of
  | TOKint x => fprint! (out, "TOKint(", x, ")")
  | TOKspace _ => fprint! (out, "TOKspace(", ")")
  | TOKident x => fprint! (out, "TOKident(", x, ")")
  | TOKkeywd x => fprint! (out, "TOKkeywd(", x, ")")
  | TOKspchr x => fprint! (out, "TOKspchr(", x, ")")
  | TOKendin _ => fprint! (out, "TOKendin(", ")")
)
//
(* ****** ****** *)
//
symintr && ||
overload && with parser_join2
overload || with parser_orelse
//
(* ****** ****** *)

macdef sat = parser_satisfy
macdef repeat0 = parser_repeat0
macdef repeat1 = parser_repeat1

(* ****** ****** *)
//
extern
fun
charlst2int : list0(char) -> int
extern
fun
charlst2string : list0(char) -> string
//
(* ****** ****** *)

implement
charlst2int
  (cs) = loop(cs, 0) where
{
//
val _0_ = 48(*'0'*)
//
fun
loop(cs: list0(char), res: int): int =
  case+ cs of
    | nil0() => res
    | cons0(c, cs) => loop(cs, 10*res+(c-_0_))
//
} (* end of [charlst2int] *)
      
(* ****** ****** *)

implement
charlst2string
  (cs) = aux(cs) where
{
//
fun
aux
(
cs: list0(char)
) : string =
  case+ cs of
  | nil0() => ""
  | cons0(c, cs) =>
    string_fromCharCode(c) + aux(cs)
//
} (* end of [charlst2string] *)

(* ****** ****** *)
//
fun
char_issymbl
  (c0: char): bool = let
  val c0 = string_fromCharCode(c0)
in
  ("%&+-./:=@~`^|*!?<>#").exists()(lam c => c0 = c)
end // end of [char_issymbl]
//
(* ****** ****** *)
//
val
par_alpha =
sat{char}(lam c => char_isalpha(c))
//
val
par_alnum_ =
sat{char}
(
lam c =>
char_isalnum(c) orelse c = strchr_code("_")
)
//
val
par_symbl =
sat{char}(lam c => char_issymbl(c))
//
val
par_digit =
sat{char}(lam c => char_isdigit(c))
//
val
par_space =
sat{char}(lam c => char_isspace(c))
//
(* ****** ****** *)
//
val
par_TOKspace =
parser_map{char}
(
  repeat1(par_space)
, lam(cs) => TOKspace((*void*))
)
//
(* ****** ****** *)
//
val
par_TOKint =
parser_map{char}
(
  repeat1(par_digit)
, lam(cs) => TOKint(charlst2int(cs))
)
//
(* ****** ****** *)

fun
token_idkwd
(
cs: string
) : token =
(
ifcase
//
  | cs = "=>" => TOKkeywd(cs)
//
  | cs = "lam" => TOKkeywd(cs)
  | cs = "fix" => TOKkeywd(cs)
//
  | cs = "let" => TOKkeywd(cs)
  | cs = "in" => TOKkeywd(cs)
  | cs = "end" => TOKkeywd(cs)
//
  | cs = "ifnz" => TOKkeywd(cs)
  | cs = "then" => TOKkeywd(cs)
  | cs = "else" => TOKkeywd(cs)
//
  | _(* else *) => TOKident(cs)
//
) (* end of [token_idkwd] *)

(* ****** ****** *)
//
val
par_TOKidkwd =
//
parser_map{char}
(
  repeat1(par_symbl)
, lam(cs) =>
    token_idkwd(charlst2string(cs))
  // end of [lam]
)
//
||
//
parser_map2{char}
(
  par_alpha
, repeat0(par_alnum_)
, lam(c, cs) =>
    token_idkwd(charlst2string(cons0(c, cs)))
  // end of [lam]
)
//
(* ****** ****** *)
//
val
par_TOKspchr =
parser_map{char}
(
  parser_anyone{char}()
, lam c => TOKspchr(string_fromCharCode(c))
)
//
(* ****** ****** *)
//
val
par_token =
(
  par_TOKint ||
  par_TOKidkwd ||
  par_TOKspace ||
  par_TOKspchr
) : parser(char, token)
//
(* ****** ****** *)
//
extern
fun
string_tokenize
  (inp: string): stream(token)
//
(* ****** ****** *)

implement
string_tokenize
  (inp) = let
//
fun
auxmain
(
cs: parinp(char)
) : stream(token) = $delay
(
let
//
val+PAROUT
  (opt, cs2) = par_token(cs)
//
in
  case+ opt of
  | None() =>
    (
      stream_sing(TOKendin(cs2))
    )
  | Some(tok) =>
    (
      case+ tok of
      | TOKspace() => !(auxmain(cs2))
      | _(*non-TOKspace*) =>
        stream_cons(tok, auxmain(cs2))
    )
end // end of [let]
)
//
in
  auxmain(stream_vt2t(streamize_string_code(inp)))
end // end of [string_tokenize]

(* ****** ****** *)

(* end of [lambda_token.dats] *)

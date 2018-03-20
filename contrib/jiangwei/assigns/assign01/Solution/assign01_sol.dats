(* ****** ****** *)

#include "./../assign01.dats"

(* ****** ****** *)

(*
Please do your implementation below:
*)

(* ****** ****** *)
//
implement
Fact_int2expr(n) =
if n > 0
  then Mul(Fact_int2expr(n-1), Int(n))
  else Int(1)
//
(* ****** ****** *)

implement
print_expr2(e) = fprint_expr2(stdout_ref, e)
implement
prerr_expr2(e) = fprint_expr2(stderr_ref, e)

(* ****** ****** *)

implement
fprint_expr2
  (out, e0) =
(
case+ e0 of
| Int2(i) => // clause
  fprint!(out, "Int2(", i, ")")
| Neg2(e) =>
  fprint!(out, "Neg2(", e, ")")
| Add2(e1, e2) =>
  fprint!(out, "Add2(", e1, ", ", e2, ")")
| Sub2(e1, e2) =>
  fprint!(out, "Sub2(", e1, ", ", e2, ")")
| Mul2(e1, e2) =>
  fprint!(out, "Mul2(", e1, ", ", e2, ")")
| Div2(e1, e2) =>
  fprint!(out, "Div2(", e1, ", ", e2, ")")
| Ifz2(e1, e2, e3) =>
  fprint!(out, "Ifz2(", e1, ", ", e2, ", ", e3, ")")
)

(* ****** ****** *)

implement
eval_expr2(e0) = let

macdef eval = eval_expr2

in

case+ e0 of
| Int2(i) => i
| Neg2(e) => ~(eval(e))
| Add2(e1, e2) => eval(e1) + eval(e2)
| Sub2(e1, e2) => eval(e1) - eval(e2)
| Mul2(e1, e2) => eval(e1) * eval(e2)
| Div2(e1, e2) => eval(e1) / eval(e2)
| Ifz2(e1, e2, e3) =>
  if eval(e1) = 0 then eval(e2) else eval(e3)

end // end of [eval_expr2]

(* ****** ****** *)

implement
eval_expr3(x, e0) = let

macdef
eval(e) = eval_expr3(x, ,(e))

in

case+ e0 of
| X() => x
| Int3(i) => i
| Neg3(e) => ~(eval(e))
| Add3(e1, e2) => eval(e1) + eval(e2)
| Sub3(e1, e2) => eval(e1) - eval(e2)
| Mul3(e1, e2) => eval(e1) * eval(e2)
| Div3(e1, e2) => eval(e1) / eval(e2)
| Ifz3(e1, e2, e3) =>
  if eval(e1) = 0 then eval(e2) else eval(e3)

end // end of [eval_expr3]

(* ****** ****** *)

(* end of [assign01_sol.dats] *)

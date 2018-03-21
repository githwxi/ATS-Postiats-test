(* ****** ****** *)

#include "./assign01.dats"

(* ****** ****** *)

(*
Please do your implementation below:
*)

// Please implement
// a function Fact that takes an integer
// and returns an expression representing the
// product of the first n positive integers.
//
// For instance,
//
// Fact(0) = Int(1)
// Fact(1) = Mul(Fact(0), Int(1))
// Fact(2) = Mul(Fact(1), Int(2))
implement
Fact_int2expr(n) = 
  if (n=0) then 
    Int(1):expr
  else
    let
      val current = Int(n)
      val previous = Fact_int2expr(n-1)
    in
      Mul(previous, current)
    end

// Please implement
// print_expr2,
// prerr_expr2,
// fprint_exp2, (5 points)
// and eval_expr2 (5 points)
implement
print_expr2(e) = fprint_expr2(stdout_ref, e)
implement
prerr_expr2(e) = fprint_expr2(stderr_ref, e)

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
  fprint!(out, "Ifz2(", e1, ", ", e2, ",", e3, ")")
)

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
  if (eval(e1) = 0) then
    eval(e2)
  else
    eval(e3)

end


(*
** HX: 5 points
**
** Given a expr3-value e, eval_expr3(x, e)
** returns the value of [e] where the variable
** [X] in [e] is given the value [x]. For instance
**
** eval_expr3
** (10, Mul(X(), Add(X(), Int(3)))) = 10*(10+3) = 130 
**
*)

implement
eval_expr3(x, e0) = let

macdef eval = eval_expr3

in
case+ e0 of
| X() => x
| Int3(i) => i
| Neg3(e) => ~(eval(x, e))
| Add3(e1, e2) => eval(x, e1) + eval(x, e2)
| Sub3(e1, e2) => eval(x, e1) - eval(x, e2)
| Mul3(e1, e2) => eval(x, e1) * eval(x, e2)
| Div3(e1, e2) => eval(x, e1) / eval(x, e2)
| Ifz3(e1, e2, e3) =>
  if (eval(x, e1) = 0) then
    eval(x, e2)
  else
    eval(x, e3)
end


val e0 = Int(0):expr // 0
val e1 = Fact_int2expr(3)
val e2 = Int2(1)
val e3 = Mul2(Int2(10), Int2(10))
val e4 = Mul2(Int2(20), Int2(20))
val e5 = Ifz2(e2, e3, e4)
val e6 = Add3(X, Int3(1))

implement main0() =
{
val () = println!("e0 = ", e0)
val () = println!("e1 = ", e1)
val () = println!("e5 = ", e5)

//
val () = println!("eval(e0) = ", eval_expr(e0))
val () = println!("eval(e1) = ", eval_expr(e1))
val () = println!("eval(e5) = ", eval_expr2(e5))
val () = println!("eval(e6) = ", eval_expr3(100, e6))
}


(* ****** ****** *)

(* end of [assign01_sol.dats] *)
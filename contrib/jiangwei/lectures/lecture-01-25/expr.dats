
(*
** ....
*)

#include
"share/atspre_staload.hats"
#include
"share/atspre_staload_libats_ML.hats"

(* ****** ****** *)

datatype expr =
  | Int of int
  | Neg of expr
  | Add of (expr, expr)
  | Sub of (expr, expr)
  | Mul of (expr, expr)
  | Div of (expr, expr)
  | Square of expr

(* ****** ****** *)

extern
fun
print_expr(e: expr): void // stdout
and
prerr_expr(e: expr): void // stderr

extern
fun
fprint_expr(out: FILEref, e: expr): void

(* ****** ****** *)

overload print with print_expr
overload prerr with prerr_expr
overload fprint with fprint_expr

(* ****** ****** *)

implement
print_expr(e) = fprint_expr(stdout_ref, e)
implement
prerr_expr(e) = fprint_expr(stderr_ref, e)

(* ****** ****** *)

implement
fprint_expr
  (out, e0) =
(
case+ e0 of
| Int(i) => // clause
  fprint!(out, "Int(", i, ")")
| Neg(e) =>
  fprint!(out, "Neg(", e, ")")
| Add(e1, e2) =>
  fprint!(out, "Add(", e1, ", ", e2, ")")
| Sub(e1, e2) =>
  fprint!(out, "Sub(", e1, ", ", e2, ")")
| Mul(e1, e2) =>
  fprint!(out, "Mul(", e1, ", ", e2, ")")
| Div(e1, e2) =>
  fprint!(out, "Div(", e1, ", ", e2, ")")
| Square(e) =>
  fprint!(out, "Square(", e, ")")
)

(* ****** ****** *)

extern
fun eval_expr(e: expr): int

(* ****** ****** *)

implement
eval_expr(e0) = let

macdef eval = eval_expr

in

case+ e0 of
| Int(i) => i
| Neg(e) => ~(eval(e))
| Add(e1, e2) => eval(e1) + eval(e2)
| Sub(e1, e2) => eval(e1) - eval(e2)
| Mul(e1, e2) => eval(e1) * eval(e2)
| Div(e1, e2) => eval(e1) / eval(e2)
| Square(e) =>
  let val x = eval(e) in x * x end

end // end of [eval_expr]


(* ****** ****** *)

val e0 = Int(0) // 0
val e1 = Neg(e0) // -(0)
val e2 = Add(e0, e1) // 0 + (-(0))
val e3 = Div(e2, Int(0)) // e2 / 0

val e4 = Square(Add(Int(5), Int(6))) // square(5+6)

(* ****** ****** *)

implement main0() =
{
val () = println!("e0 = ", e0)
val () = println!("e1 = ", e1)
val () = println!("e2 = ", e2)
val () = println!("e3 = ", e3)
val () = println!("e4 = ", e4)
//
val () = println!("eval(e0) = ", eval_expr(e0))
val () = println!("eval(e1) = ", eval_expr(e1))
val () = println!("eval(e2) = ", eval_expr(e2))
(*
//
// HX: dividing-by-zero:
//
val () = println!("eval(e3) = ", eval_expr(e3))
//
*)
val () = println!("eval(e4) = ", eval_expr(e4))
//
}

(* ****** ****** *)

(* end of [expr.dats] *)

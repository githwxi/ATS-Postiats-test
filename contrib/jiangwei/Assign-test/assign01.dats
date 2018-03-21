(* ****** ****** *)
//
// Title:
// Principles of
// Programming Languages
// Course: CAS CS 520
//
// Semester: Spring, 2018
//
// Classroom: MCS B25
// Class Time: TR 2:00-3:15
//
// Instructor: Hongwei Xi (hwxiATcsDOTbuDOTedu)
//
(* ****** ****** *)
//
// Due date: Tuesday, the 30th of January
//
(* ****** ****** *)

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
//
// HX: 5 points:
//
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
// ...
//
extern fun Fact_int2expr(n: int): expr
//
(* ****** ****** *)
//
// HX: 10 points
//
// Please implement
// print_expr2,
// prerr_expr2,
// fprint_exp2, (5 points)
// and eval_expr2 (5 points)
//
(* ****** ****** *)

datatype expr2 =
  | Int2 of int
  | Neg2 of expr2
  | Add2 of (expr2, expr2)
  | Sub2 of (expr2, expr2)
  | Mul2 of (expr2, expr2)
  | Div2 of (expr2, expr2)
  | Ifz2 of (expr2, expr2, expr2) // Ifz2(x, y, z): (if x = 0 then y else z)

(* ****** ****** *)

extern
fun
print_expr2(e: expr2): void // stdout
and
prerr_expr2(e: expr2): void // stderr

extern
fun
fprint_expr2(out: FILEref, e: expr2): void

(* ****** ****** *)

overload print with print_expr2
overload prerr with prerr_expr2
overload fprint with fprint_expr2

(* ****** ****** *)

extern fun eval_expr2(e: expr2): int

(* ****** ****** *)

datatype expr3 =
  | X of () // a variable
  | Int3 of int
  | Neg3 of expr3
  | Add3 of (expr3, expr3)
  | Sub3 of (expr3, expr3)
  | Mul3 of (expr3, expr3)
  | Div3 of (expr3, expr3)
  | Ifz3 of (expr3, expr3, expr3)
  
(*

For instance,

Mul3(X(), Add3(X(), Int3(3)))

represents the expression X * (X + 3)

*)

(* ****** ****** *)

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

extern fun eval_expr3(x: int, e: expr3): int

(* ****** ****** *)

(* end of [assign01.dats] *)

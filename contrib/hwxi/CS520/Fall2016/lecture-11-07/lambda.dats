(*
** HX:
** implementing lambda-calculus
*)

(* ****** ****** *)
//
datatype term =
| TMvar of string
| TMapp of (term(*fun*), term(*arg*))
| TMlam of (string(*var*), term(*body*))
//
(* ****** ****** *)
//
extern
fun
print_term : (term) -> void
extern
fun
fprint_term : (FILEref, term) -> void
//
overload print with print_term
overload fprint with fprint_term
//
(* ****** ****** *)

implement
print_term(t0) = fprint(stdout_ref, t0)

(* ****** ****** *)

implement
fprint_term(out, t0) =
(
case+ t0 of
| TMvar(x) => fprint!(out, "TMvar(", x, ")")
| TMapp(t1, t2) =>
    fprint!(out, "TMapp(", t1, ", ", t2, ")")
| TMlam(x, t_body) =>
    fprint!(out, "TMlam(", x, " => ", t_body, ")")
)

(* ****** ****** *)
//
extern
fun
subst(t0: term, x0: string, sub: term): term
//
implement
subst(t0, x0, sub) =
(
case+ t0 of
| TMvar(x) =>
    if x0 = x then sub else t0
| TMlam(x, t1) =>
    if x0 = x then t0 else TMlam(x, subst(t1, x0, sub))
| TMapp(t1, t2) =>
    TMapp(subst(t1, x0, sub), subst(t2, x0, sub))
)

(* ****** ****** *)

val x = TMvar("x")
val y = TMvar("y")
val z = TMvar("z")
val K =
TMlam("x", TMlam("y", x))
val K' =
TMlam("x", TMlam("y", y))
val S =
TMlam("x",
TMlam("y",
TMlam("z", TMapp(TMapp(x, z), TMapp(y, z)))))

(* ****** ****** *)

val () = println! ("K = ", K)
val () = println! ("K' = ", K')
val () = println! ("S = ", S)

(* ****** ****** *)

implement main0 () = ()

(* ****** ****** *)

(* end of [lambda.dats] *)

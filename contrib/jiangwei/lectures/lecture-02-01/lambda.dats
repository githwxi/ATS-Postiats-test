(* ****** ****** *)

#include
"share/atspre_staload.hats"
#include
"share/atspre_staload_libats_ML.hats"

(* ****** ****** *)

datatype term =
  | TMvar of string //variable
  | TMlam of (string, term(*body*)) //abstraction, bound var + function body
  | TMapp of (term(*fun*), term(*arg*)) //application, function + arguments

(* ****** ****** *)

extern
fun
print_term(t0: term): void
extern
fun
fprint_term(out: FILEref, t0: term): void

overload print with print_term
overload fprint with fprint_term

(* ****** ****** *)

implement
print_term(t0) = fprint_term(stdout_ref, t0)

implement
fprint_term(out, t0) =
(
case+ t0 of
| TMvar(x) => fprint!(out, "TMvar(", x, ")") //direct print
| TMlam(x, t) => fprint!(out, "TMlam(", x, "; ", t, ")") //recursively call
| TMapp(t1, t2) => fprint!(out, "TMapp(", t1, "; ", t2, ")")
)

(* ****** ****** *)

extern
fun
subst // t0[x -> t1] x = t1, x0 = sub
(t0: term, x0: string, sub: term): term


//sub is a term not a string
//beta redex
implement
subst
(t0, x0, sub) = 
(
case+ t0 of
| TMvar(x) =>
  if x = x0 then sub else t0 //string comparison
| TMlam(x, t) => TMlam(x, subst(t, x0, sub))
  //if x = x0
    //then TMlam(x, subst(t, x0, sub)) else t0
    //then t0 else TMlam(x, subst(t, x0, sub))
  // end of [if]
| TMapp(t1, t2) =>
  TMapp(subst(t1, x0, sub),  subst(t2, x0, sub))
) (* end of [subst] *)

(* ****** ****** *)

extern
fun
evaluate(t0: term): term

implement
evaluate(t0) =
(
case+ t0 of
| TMvar _ => t0
| TMlam _ => t0
| TMapp(t1, t2) => let
    val t1 = evaluate(t1)
    val t2 = evaluate(t2) // call-by-value
  in
    case- t1 of
    | TMlam(x, t_body) => evaluate(subst(t_body, x, t2))
  end
)

(* ****** ****** *)

val x = TMvar("x")
val y = TMvar("y")
val z = TMvar("z")

val I = TMlam("x", x) //bound var + fun body
val K = TMlam("x", TMlam("y", x))
val S = TMlam("x", TMlam("y", TMlam("z", TMapp(TMapp(x, z), TMapp(y, z)))))

val I2 = subst(I, "x", TMvar("a") )

val S2 = subst(S, "y", TMvar("a") )
(* ****** ****** *)

implement
main0() = let
(*
val () =
println!
("Hello from [lambda]!")
*)

val () = println!("I = ", I)
val () = println!("K = ", K)
val () = println!("S = ", S)
val () = println!("I2 = ", I2)
val () = println!("S2 = ", S2)
val () = println!("SKK(x) = ", evaluate(TMapp(TMapp(TMapp(S, K), K), x)))

in
  // nothing
end // end of [main0]

(* ****** ****** *)

(* end of [lambda.dats] *)

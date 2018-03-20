(* ****** ****** *)

#include "./../assign02.dats"

(* ****** ****** *)

(*
Please do your implementation below:
*)

(* ****** ****** *)

implement
subst
(t0, x0, sub) = 
(
case t0 of
//
| TMint(_) => t0
//
| TMvar(x) =>
  if x = x0 then sub else t0
//
| TMadd(t1, t2) =>
  TMadd(subst(t1, x0, sub),  subst(t2, x0, sub))
//
| TMlam(x, t) =>
  if x = x0
    then t0 else TMlam(x, subst(t, x0, sub))
  // end of [if]
| TMapp(t1, t2) =>
  TMapp(subst(t1, x0, sub),  subst(t2, x0, sub))
//
| TMifnz(t1, t2, t3) =>
  TMifnz(subst(t1, x0, sub), subst(t2, x0, sub), subst(t3, x0, sub))
//
) (* end of [subst] *)

(* ****** ****** *)

implement
evaluate(t0) =
(
case+ t0 of
| TMint _ => t0
| TMvar _ => t0
| TMlam _ => t0
| TMadd(t1, t2) => let
    val t1 = evaluate(t1)
    val t2 = evaluate(t2)
  in
    case- t1 of
    | TMint(i1) =>
      (case- t2 of
       | TMint(i2) => TMint(i1+i2)
      )
  end // end of [TMadd]
| TMapp(t1, t2) => let
    val t1 = evaluate(t1)
    val t2 = evaluate(t2) // call-by-value
  in
    case- t1 of
    | TMlam(x, t_body) => evaluate(subst(t_body, x, t2))
  end // end of [TMapp]
| TMifnz(t1, t2, t3) => let
    val t1 = evaluate(t1)
  in
    case- t1 of
    | TMint(i1) =>
      if i1 != 0 then evaluate(t2) else evaluate(t3)
  end // end of [TMinfnz]
)

(* ****** ****** *)
//
// HX:
// The following testing code is provided:
//
implement
main0() =
{
//
val () =
println!
("twicethrice(tmdbl)(1) = ", evaluate(TMapp(TMapp(twicethrice,tmdbl),TMint(1))))
//
val () =
println!
("thricetwice(tmdbl)(1) = ", evaluate(TMapp(TMapp(thricetwice,tmdbl),TMint(1))))
//
} (* end of [main0] *)

(* ****** ****** *)

(* end of [assign02_sol.dats] *)
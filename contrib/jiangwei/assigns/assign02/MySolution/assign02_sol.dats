(* ****** ****** *)

#include "./../assign02.dats"

(* ****** ****** *)

(*
Please do your implementation below:
*)

implement
subst
(t0, x0, sub) = 
(
case+ t0 of
| TMint(i) => t0
| TMvar(x) =>
  if x = x0 then sub else t0 //string comparison
| TMadd(t1, t2) => TMadd( subst(t1, x0, sub), subst(t2, x0, sub) )
| TMlam(x, t) => //TMlam(x, subst(t, x0, sub))
  if x = x0
    then t0 else TMlam(x, subst(t, x0, sub))
  // end of [if]
| TMapp(t1, t2) =>
  TMapp(subst(t1, x0, sub),  subst(t2, x0, sub))
| TMifnz(t1, t2, t3) =>
  TMifnz(subst(t1, x0, sub), subst(t2, x0, sub), subst(t3, x0, sub) )
)

implement 
evaluate(t0) = 
(
case- t0 of
| TMint _ => t0
| TMvar _ => t0
| TMlam _ => t0
| TMadd(t1, t2) => let
    val t1 = evaluate(t1)
    val t2 = evaluate(t2) // call-by-value
  in
    case- t1 of
    | TMint(i1) =>
      case- t2 of
      | TMint(i2) => evaluate(TMint(i1 + i2))
      | _ => TMadd( evaluate(t1) ,evaluate(t2) )
    | _ => TMadd( evaluate(t1) ,evaluate(t2) )
  end
| TMapp(t1, t2) => let
    val t1 = evaluate(t1)
    val t2 = evaluate(t2) // call-by-value
  in
    case- t1 of
    | TMlam(x, t_body) => evaluate(subst(t_body, x, t2))
  end
| TMifnz(t1, t2, t3) => let//TMifnz(evaluate(t1), evaluate(t2), evaluate(t3))
    val t1 = evaluate(t1)
    val t2 = evaluate(t3)
    val t3 = evaluate(t3)
  in
    case- t1 of
    | TMint(i1) =>
      if(i1 = 0) then evaluate(t3) else evaluate(t2)
    | _ => TMifnz(evaluate(t1), evaluate(t2), evaluate(t3))
  end
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
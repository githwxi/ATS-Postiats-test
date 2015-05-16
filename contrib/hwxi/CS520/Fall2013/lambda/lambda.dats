(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
//
(* ****** ****** *)

staload "./lambda.sats"

(* ****** ****** *)
//
staload "libats/ML/SATS/basis.sats"
staload "libats/ML/SATS/list0.sats"
staload _ = "libats/ML/DATS/list0.dats"
//
(* ****** ****** *)

(*
dynload "./lambda.sats"
*)
dynload "./lambda_size.dats"
dynload "./lambda_print.dats"
dynload "./lambda_context.dats"
dynload "./lambda_subst.dats"
dynload "./lambda_eval.dats"
dynload "./lambda_environ.dats"
dynload "./lambda_eval2.dats"

(* ****** ****** *)

local

val x = TMvar "x"
val y = TMvar "y"
val z = TMvar "z"

in (* in of [local] *)

implement I = TMlam ("x", x)
//
implement K = TMlam ("x", TMlam ("y", x))
implement K' = TMlam ("x", TMlam ("y", y))
//
implement S = TMlam ("x", TMlam ("y", TMlam ("z", TMapp (TMapp (x, z), TMapp (y, z)))))

end // end of [local]

(* ****** ****** *)

implement SKK = TMapp (TMapp (S, K), K)

(* ****** ****** *)

local

val f = TMvar "f"
val x = TMvar "x"
val _1 = TMint (1)
//
macdef app (t1, t2) = TMapp (,(t1), ,(t2))
macdef sub (t1, t2) = TMopr ("-", list0_make_pair<term> (,(t1), ,(t2)))
macdef mul (t1, t2) = TMopr ("*", list0_make_pair<term> (,(t1), ,(t2)))
//
in

val TMfact = TMfix ("f", "x", TMifnz (x, mul (x, app (f, sub (x, _1))), _1))

end // end of [local]

(* ****** ****** *)

local

val f = TMvar "f"
val x = TMvar "x"
val _10 = TMint (10)
val _11 = TMint (11)
val _100 = TMint (100)
macdef app (t1, t2) = TMapp (,(t1), ,(t2))
macdef add (t1, t2) = TMopr ("+", list0_make_pair<term> (,(t1), ,(t2)))
macdef sub (t1, t2) = TMopr ("-", list0_make_pair<term> (,(t1), ,(t2)))
macdef igt (t1, t2) = TMopr ("igt", list0_make_pair<term> (,(t1), ,(t2)))

in

val TMf91 = TMfix
(
  "f", "x"
, TMifnz (igt(x, _100), sub (x, _10), app (f, app (f, add (x, _11))))
)

end // end of [local]

(* ****** ****** *)

local

val f = TMvar "f"
val x = TMvar "x"
val y = TMvar "y"
macdef app (t1, t2) = TMapp (,(t1), ,(t2))
macdef app2 (t1, t21, t22) = TMapp (TMapp (,(t1), ,(t21)), ,(t22))
macdef add (t1, t2) = TMopr ("+", list0_make_pair<term> (,(t1), ,(t2)))
macdef sub (t1, t2) = TMopr ("-", list0_make_pair<term> (,(t1), ,(t2)))
macdef igte (t1, t2) = TMopr ("igte", list0_make_pair<term> (,(t1), ,(t2)))

in

val TMmod = TMfix
(
  "f", "x"
, TMlam ("y", TMifnz (igte (x, y), app2 (f, sub (x, y), y), x))
)

end // end of [local]

(* ****** ****** *)

implement
main0 () =
{
//
val () =
println! ("Greetings from lambda!")
//
val () = println! ("I = ", I)
val () = println! ("K = ", K)
val () = println! ("S = ", S)
//
val () = println! ("SKK(10) = ", eval (TMapp (SKK, TMint(10))))
//
val () = println! ("fact(10) = ", eval (TMapp (TMfact, TMint(10))))
val () = println! ("fact(10) = ", eval2_nil (TMapp (TMfact, TMint(10))))
//
val () = println! ("f91(0) = ", eval (TMapp (TMf91, TMint(0))))
val () = println! ("f91(1) = ", eval (TMapp (TMf91, TMint(1))))
val () = println! ("f91(10) = ", eval (TMapp (TMf91, TMint(10))))
val () = println! ("f91(20) = ", eval (TMapp (TMf91, TMint(20))))
//
val () =
println! ("mod(10, 3) = ", eval (TMapp (TMapp (TMmod, TMint(10)), TMint(3))))
//
} (* end of [main0] *)

(* ****** ****** *)

(* end of [lambda.dats] *)

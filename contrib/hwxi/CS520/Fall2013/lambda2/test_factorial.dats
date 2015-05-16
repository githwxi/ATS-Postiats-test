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

extern val TMfact : term

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

implement
TMfact =  TMfix ("f", "x", TMifnz (x, mul (x, app (f, sub (x, _1))), _1))

end // end of [local]

(* ****** ****** *)

val () = println! ("fact(10) = ", eval2_nil(TMapp(TMfact, TMint(10))))

(* ****** ****** *)

(* end of [test_factorial.dats] *)

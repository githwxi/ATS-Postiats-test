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

extern val TMfib : term

(* ****** ****** *)

local

val f = TMvar "f"
val x = TMvar "x"
val _1 = TMint (1)
val _2 = TMint (2)
//
macdef app (t1, t2) = TMapp (,(t1), ,(t2))
macdef add (t1, t2) = TMopr ("+", list0_make_pair<term> (,(t1), ,(t2)))
macdef sub (t1, t2) = TMopr ("-", list0_make_pair<term> (,(t1), ,(t2)))
macdef igte (t1, t2) = TMopr ("igte", list0_make_pair<term> (,(t1), ,(t2)))
//
in

implement
TMfib =  TMfix ("f", "x", TMifnz (igte(x, _2), add (app (f, sub(x, _1)), app (f, sub (x, _2))), x))

end // end of [local]

(* ****** ****** *)

val () = println! ("fib(10) = ", eval2_nil(TMapp(TMfib, TMint(10))))

(* ****** ****** *)

(* end of [test_fib.dats] *)

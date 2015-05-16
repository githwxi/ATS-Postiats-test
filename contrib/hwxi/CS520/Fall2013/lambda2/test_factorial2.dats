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

extern val TMfact2 : term

(* ****** ****** *)

local

val f = TMvar "f"
val xy = TMvar "xy"
val _1 = TMint (1)
//
macdef app (t1, t2) = TMapp (,(t1), ,(t2))
macdef sub (t1, t2) = TMopr ("-", list0_make_pair<term> (,(t1), ,(t2)))
macdef mul (t1, t2) = TMopr ("*", list0_make_pair<term> (,(t1), ,(t2)))
//
macdef tup2 (t1, t2) = TMtup (list0_make_pair<term> (,(t1), ,(t2)))
macdef proj (t, i) = TMproj(,(t), ,(i))
//
in

implement
TMfact2 = TMfix
(
  "f", "xy"
, TMifnz (proj(xy,0), app(f, tup2(sub(proj(xy,0), _1), mul (proj(xy,0), proj(xy,1)))), proj(xy,1))
)

end // end of [local]

(* ****** ****** *)

val () = println! ("fact2(10) = ", eval2_nil(TMapp(TMfact2, TMtup(list0_make_pair<term>(TMint(10), TMint(1))))))

(* ****** ****** *)

(* end of [test_factorial2.dats] *)

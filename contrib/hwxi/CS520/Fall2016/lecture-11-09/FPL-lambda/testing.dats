(* ****** ****** *)

#include
"share/atspre_staload.hats"
#include
"share/HATS/atspre_staload_libats_ML.hats"

(* ****** ****** *)

staload "./lambda.sats"

(* ****** ****** *)

dynload "./lambda_term.dats"

(* ****** ****** *)

val x = TMvar "x"
val y = TMvar "y"
val z = TMvar "z"
val K = TMlam ("x", TMlam("y", x))
val S = TMlam ("x", TMlam("y", TMlam("z", TMapp(TMapp(x, z), TMapp(y, z)))))

(* ****** ****** *)

val SKK = TMapp(TMapp(S, K), K)
val SKKx = TMapp(TMapp(TMapp(S, K), K), x)

(* ****** ****** *)

val () = println! ("K = ", K)
val () = println! ("S = ", S)

(* ****** ****** *)

val () = println! ("cbn(SKK) = ", eval_cbn(SKK))
val () = println! ("cbn(SKKx) = ", eval_cbn(SKKx))

(* ****** ****** *)

val () = println! ("cbv(SKK) = ", eval_cbv(SKK))
val () = println! ("cbv(SKKx) = ", eval_cbv(SKKx))

(* ****** ****** *)

implement main0() = ((*void*))

(* ****** ****** *)

(* end of [testing.dats] *)

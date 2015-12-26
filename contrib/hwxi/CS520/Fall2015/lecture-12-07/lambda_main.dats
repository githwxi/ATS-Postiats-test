(* ****** ****** *)

staload "lambda.sats"

(* ****** ****** *)
//
dynload "lambda_vnam.dats"
dynload "lambda_cnam.dats"
//
dynload "lambda_term.dats"
dynload "lambda_value.dats"
//
dynload "lambda_eval.dats"
//
dynload "lambda_envmap.dats"
dynload "lambda_libenv.dats"
//
(* ****** ****** *)

dynload "lambda_test.dats"

(* ****** ****** *)

implement
main0 () = () where
{
//
val () = println! "Hello from lambda!"
//
} (* end of [main0] *)

(* ****** ****** *)

(* end of [lambda_main.dats] *)

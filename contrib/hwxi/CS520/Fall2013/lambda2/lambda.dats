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

implement VALvoid () = VALtup (list0_nil)

(* ****** ****** *)

(*
dynload "./lambda.sats"
*)
dynload "./lambda_print.dats"
dynload "./lambda_subst.dats"
dynload "./lambda_eval.dats"
dynload "./lambda_environ.dats"
dynload "./lambda_eval2.dats"

(* ****** ****** *)

val () = println! ("Greetings from lambda!")

(* ****** ****** *)

dynload "./test_fibonacci.dats"
dynload "./test_factorial.dats"
dynload "./test_factorial2.dats"

(* ****** ****** *)

implement main0 () = ()

(* ****** ****** *)

(* end of [lambda.dats] *)

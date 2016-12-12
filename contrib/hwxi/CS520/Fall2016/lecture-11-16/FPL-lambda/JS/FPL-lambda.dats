(* ****** ****** *)

#define ATS_MAINATSFLAG 1
#define ATS_DYNLOADNAME "FPL_lambda_initize"

(* ****** ****** *)
//
#include
"share/atspre_define.hats"
#include
"{$LIBATSCC2JS}/staloadall.hats"
//
(* ****** ****** *)
//
staload
"{$LIBATSCC2JS}/SATS/print.sats"
staload
"{$LIBATSCC2JS}/DATS/print.dats"
//
(* ****** ****** *)
//
staload
"{$LIBATSCC2JS}/SATS/Bacon.js/baconjs.sats"
//
(* ****** ****** *)

staload "./lambda.sats"

(* ****** ****** *)
//
fun{}
bool2int(b: bool): int = if b then 1 else 0
//
(* ****** ****** *)

#include "./lambda_term.dats"

(* ****** ****** *)
//
val
Fact10 =
App(Fix("f", "x", Ifnz(Gt(Var("x"), Int(0)), Mul(Var("x"), App(Var("f"), Sub(Var("x"), Int(1)))), Int(1))), Int(10))
//
(* ****** ****** *)

%{^
//
function
theEval_input() { return $("#eval_inp").val(); }
//
var
theEval_clicks = $("#eval_btn").asEventStream("click")
//
%} // end of [%{^]

(* ****** ****** *)
//
fun
eval_cbv_print
  (inp: string): void =
  alert(tostring(eval_cbv($extfcall(term, "eval", inp))))
//
(* ****** ****** *)
//
val
theEval_clicks = $extval(EStream(void), "theEval_clicks")
//
val ((*void*)) =
theEval_clicks.onValue()(lam(_) => eval_cbv_print($extfcall(string, "theEval_input")))
//
(* ****** ****** *)

%{$
//
jQuery(document).ready(function(){FPL_lambda_initize();});
//
%} // end of [%{$]

(* ****** ****** *)

(* end of [FPL-lambda] *)

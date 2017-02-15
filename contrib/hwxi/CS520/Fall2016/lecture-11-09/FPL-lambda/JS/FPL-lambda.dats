(* ****** ****** *)
//
#define
LIBATSCC2JS_targetloc
"$PATSHOME\
/contrib/libatscc2js/ATS2-0.3.2"
//
(* ****** ****** *)

#define ATS_MAINATSFLAG 1
#define ATS_DYNLOADNAME "FPL_lambda_initize"

(* ****** ****** *)
//
#include
"{$LIBATSCC2JS}/staloadall.hats"
//
(* ****** ****** *)
//
staload
"{$LIBATSCC2JS}/SATS/Bacon.js/baconjs.sats"
//
(* ****** ****** *)

staload "./lambda.sats"

(* ****** ****** *)

#include "./lambda_term.dats"

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

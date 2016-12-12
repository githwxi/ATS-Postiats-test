(* ****** ****** *)
//
#include
"share/atspre_define.hats"
#include
"{$LIBATSCC2JS}/staloadall.hats"
//
(* ****** ****** *)

#define
ATS_MAINATSFLAG 1
#define
ATS_DYNLOADNAME "FPL_lambda_initize"

(* ****** ****** *)
//
staload
"{$LIBATSCC2JS}/SATS/print.sats"
staload
"{$LIBATSCC2JS}/DATS/print.dats"
//
(* ****** ****** *)
//
#include "./lambda_token.dats"
#include "./lambda_parse.dats"
#include "./lambda_eval0.dats"
//
(* ****** ****** *)
//
staload
"{$LIBATSCC2JS}/SATS/Bacon.js/baconjs.sats"
//
(* ****** ****** *)

%{^
//
function
theEval_input() { return $("#eval_inp").val(); }
function
theEval2_input() { return $("#eval2_inp").val(); }
function
theEval3_input() { return $("#eval3_inp").val(); }
//
var
theEval_clicks = $("#eval_btn").asEventStream("click")
var
theEval2_clicks = $("#eval2_btn").asEventStream("click")
var
theEval3_clicks = $("#eval3_btn").asEventStream("click")
//
%} // end of [%{^]

(* ****** ****** *)
//
fun
eval_string_print
  (inp: string): void = let
//
val
opt = string2term_parse(inp)
//
in
//
the_print_store_clear();
(
case+ opt of
| None() => println! ("ERROR!")
| Some(t0) => println! (tostring(eval_cbv(t0)))
);
alert(the_print_store_join());
//
end // end of [eval_tokenizer_print]
//
(* ****** ****** *)
//
val
theEval_clicks =
  $extval(EStream(void), "theEval_clicks")
val
theEval2_clicks =
  $extval(EStream(void), "theEval2_clicks")
val
theEval3_clicks =
  $extval(EStream(void), "theEval3_clicks")
//
val ((*void*)) =
theEval_clicks.onValue()
(
  lam(_) =>
  eval_string_print($extfcall(string, "theEval_input"))
)
val ((*void*)) =
theEval2_clicks.onValue()
(
  lam(_) =>
  eval_string_print($extfcall(string, "theEval2_input"))
)
val ((*void*)) =
theEval3_clicks.onValue()
(
  lam(_) =>
  eval_string_print($extfcall(string, "theEval3_input"))
)
//
(* ****** ****** *)

%{$
//
jQuery(document).ready(function(){FPL_lambda_initize();});
//
%} // end of [%{$]

(* ****** ****** *)

(* end of [FPL-lambda] *)

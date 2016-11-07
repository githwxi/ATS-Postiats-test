(*
** FRP via Bacon.js
*)

(* ****** ****** *)

#define ATS_MAINATSFLAG 1
#define ATS_DYNLOADNAME "my_dynload"

(* ****** ****** *)
//
#include
"share/atspre_define.hats"
//
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

%{^
//
function event_keycode(x) { return(x.keyCode); }
//
var
theKeyDowns = $(document).asEventStream("keydown")
var
theKeyCodes = 0
//
%} // end of [%{^]

(* ****** ****** *)

extern
fun event_keycode(JSobj): int = "mac#"

(* ****** ****** *)
//
val theKeyDowns = $extval(EStream(JSobj), "theKeyDowns")
val theKeyCodes = theKeyDowns.map(TYPE{int})(lam(x) =<cloref1> event_keycode(x))
//
extvar "theKeyCodes" = theKeyCodes
//
(* ****** ****** *)
    
%{$
//
function
KeyCode_initize()
{
  var _ = my_dynload()
  var _ = theKeyCodes.assign($("#keycode"), "text")
}
//
jQuery(document).ready(function(){KeyCode_initize();});
//
%} // end of [%{$]

(* ****** ****** *)

(* end of [KeyCode.dats] *)

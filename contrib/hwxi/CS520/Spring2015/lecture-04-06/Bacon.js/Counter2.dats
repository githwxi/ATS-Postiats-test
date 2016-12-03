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
var
theUps = $("#up").asEventStream("click")
var
theDowns = $("#down").asEventStream("click")
var
theResets = $("#reset").asEventStream("click")
//
var theCounts = 0
//
%} // end of [%{^]

(* ****** ****** *)
//
val theUps =
  $extval(EStream(void), "theUps")
val theDowns =
  $extval(EStream(void), "theDowns")
val theResets =
  $extval(EStream(void), "theResets")
//
(* ****** ****** *)

datatype act = Up | Down | Reset

(* ****** ****** *)
//
val theUps = EStream_map(theUps, lam(x) => Up())
val theDowns = EStream_map(theDowns, lam(x) => Down())
val theResets = EStream_map(theResets, lam(x) => Reset())
//
val theEvents = theUps
val theEvents = merge(theEvents, theDowns)
val theEvents = merge(theEvents, theResets)
//
val
theCounts =
scan{int}{act}
(
  theEvents, 100
, lam(y, x) =<cloref1> case+ x of Up() => y+1 | Down() => y-1 | Reset() => 100
)
//
extvar "theCounts" = theCounts
//
(* ****** ****** *)
    
%{$
//
function
Counter_initize()
{
  var _ = my_dynload()
  var _ = theCounts.assign($("#counter"), "text")
}
//
jQuery(document).ready(function(){Counter_initize();});
//
%} // end of [%{$]

(* ****** ****** *)

(* end of [Counter2.dats] *)

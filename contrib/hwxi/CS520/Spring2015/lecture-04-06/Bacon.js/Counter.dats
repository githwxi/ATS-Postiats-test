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
theDns = $("#down").asEventStream("click")
//
var theCounts = 0
//
%} // end of [%{^]

(* ****** ****** *)
//
val theUps =
  $extval(EStream(void), "theUps")
val theDns =
  $extval(EStream(void), "theDns")
//
val theUps = map (theUps, lam(x) =<cloref1> 1)
val theDns = map (theDns, lam(x) =<cloref1> ~1)
//
val theUpDns = merge(theUps, theDns)
//
val
theCounts =
scan{int,int}(theUpDns, 100, lam(y, x) =<cloref1> (y + x))
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

(* end of [Counter.dats] *)

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
theRandoms = $("#random").asEventStream("click")
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
val theRandoms =
  $extval(EStream(void), "theRandoms")
val theResets =
  $extval(EStream(void), "theResets")
//
(* ****** ****** *)

datatype action = Up | Down | Random | Reset

(* ****** ****** *)
//
macdef map = EStream_map
//
val theUps = map (theUps, lam(x) => Up())
val theDowns = map (theDowns, lam(x) => Down())
val theRandoms = map (theRandoms, lam(x) => Random())
val theResets = map (theResets, lam(x) => Reset())
//
val theClicks = theUps
val theClicks = merge(theClicks, theDowns)
val theClicks = merge(theClicks, theRandoms)
val theClicks = merge(theClicks, theResets)
//
(* ****** ****** *)

val
theCounts = let
//
val state = ref{int}(0)
val mybus = Bacon_new_bus()
//
fun
aux
(
  x: action
) : void = let
//
val n = state[]
//
val n = (
  case+ x of
  | Up() => if n < 99 then n+1 else 0
  | Down() => if n > 0 then n-1 else 99
  | Random() => double2int(100*JSmath_random())
  | Reset() => 0
) : int // end of [val]
//
val () = state[] := n
//
in
  mybus.push(n)
end // end of [aux]
//
val () = theClicks.onValue()(lam(x) =<cloref1> aux(x))
//
in
  mybus
end // end of [theCounts]

(* ****** ****** *)
//
val
theCounts = let
//
fun
stringize
(
  x0: int
) : string = let
//
  val d0 = x0 % 10
  val x1 = x0 / 10
  val d1 = x1 % 10
//
in
  String(d1) + String(d0)
end // end of [stringize]
//
in
  map(theCounts, lam(x) => stringize(x))
end // end of [val]
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

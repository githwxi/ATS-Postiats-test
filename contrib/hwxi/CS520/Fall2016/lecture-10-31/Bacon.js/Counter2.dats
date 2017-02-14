(*
** FRP via Bacon.js
*)

(* ****** ****** *)

#define ATS_MAINATSFLAG 1
#define ATS_DYNLOADNAME "my_dynload"

(* ****** ****** *)
//
#define
LIBATSCC2JS_targetloc
"$PATSHOME\
/contrib/libatscc2js/ATS2-0.3.2"
//
(* ****** ****** *)
//
staload
UN = "prelude/SATS/unsafe.sats"
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
//
extern
fun
streamize_EStream
  {a:t@ype}(EStream(a)): stream_vt(a)
extern
fun
streamize_Property
  {a:t@ype}(Property(a)): stream_vt(a)
//
(* ****** ****** *)

implement
streamize_EStream
  {a}(es) = let
//
val
xref = ref{a}($UN.cast(0))
//
fun
auxmain
(
  xref: ref(a)
) : stream_vt(a) = $ldelay
(
let
//
val () =
EStream_onValue
  (es, lam(x) => xref[] := x)
//
in
  stream_vt_cons(xref[], auxmain(xref))
end 
) (*$ldelay*) // end of [auxmain]
//
in
  auxmain(xref)
end // end of [streamize_Property]

(* ****** ****** *)

implement
streamize_Property
  {a}(es) = let
//
val
xref = ref{a}($UN.cast(0))
//
fun
auxmain
(
  xref: ref(a)
) : stream_vt(a) = $ldelay
(
let
//
val () =
Property_onValue
  (es, lam(x) => xref[] := x)
//
in
  stream_vt_cons(xref[], auxmain(xref))
end 
) (*$ldelay*) // end of [auxmain]
//
in
  auxmain(xref)
end // end of [streamize_Property]

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
var theCounter = 0
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

datatype act = Up | Down | Random | Reset

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
//
val
theCounter =
EStream_scan{int}{act}
(
  theClicks, 0
, lam(y, x) =<cloref1>
  case+ x of
  | Up() => min(99, y+1)
  | Down() => max(0, y-1)
  | Random() => double2int(100*JSmath_random())
  | Reset() => 0
)
//
val
theCounter = let
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
  val () = alert("d0 = " + String(d0))
  val () = alert("d1 = " + String(d1))
//
in
  String(d1) + String(d0)
end // end of [stringize]
//
in
  Property_map(theCounter, lam(x) =<cloref1> stringize(x))
end // end of [val]
//
val theCounter = streamize_Property(theCounter)
//
val () = theCounter.foreach()(lam x => alert(x))
//
(* ****** ****** *)
    
%{$
//
function
Counter_initize()
{
  var _ = my_dynload()
}
//
jQuery(document).ready(function(){Counter_initize();});
//
%} // end of [%{$]

(* ****** ****** *)

(* end of [Counter.dats] *)

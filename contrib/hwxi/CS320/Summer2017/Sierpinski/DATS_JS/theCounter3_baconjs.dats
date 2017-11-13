(* ****** ****** *)
(*
theCounter3_baconjs
*)
(* ****** ****** *)
//
#define
ATS_MAINATSFLAG 1
#define
ATS_DYNLOADNAME
"theCounter3_baconjs_start"
//
#define
ATS_STATIC_PREFIX "theCounter3_baconjs_"
//
(* ****** ****** *)
//
#define
LIBATSCC2JS_targetloc
"$PATSHOME\
/contrib/libatscc2js/ATS2-0.3.2"
//
(* ****** ****** *)
//
#include
"{$LIBATSCC2JS}/staloadall.hats"
//
#staload
"{$LIBATSCC2JS}/SATS/print.sats"
#staload _(*anon*) =
"{$LIBATSCC2JS}/DATS/print.dats"
//
(* ****** ****** *)
//
#staload
"{$LIBATSCC2JS}\
/SATS/Bacon.js/baconjs.sats"
#staload
"{$LIBATSCC2JS}\
/SATS/Bacon.js/baconjs_ext.sats"
//
(* ****** ****** *)
//
#staload
"{$LIBATSCC2JS}\
/SATS/HTML/canvas-2d/canvas2d.sats"
//
(* ****** ****** *)
//
extern
fun
theCanvas_get((*void*)): canvas = "mac#"
extern
fun
theCanvas_ctx2d_get((*void*)): canvas2d = "mac#"
//
(* ****** ****** *)
//
#include "./theShow_update.dats"
//
(* ****** ****** *)

local
//
datatype act =
  | Auto
  | Next | Next2
  | Prev | Prev2
  | Rand | Reset | Skip
//
val
theAuto_btn =
$extval(ptr, "$(\"#theAuto_btn\")")
val
theAuto_clicks =
$extmcall(EStream(ptr), theAuto_btn, "asEventStream", "click")
//
val
theNext_btn =
$extval(ptr, "$(\"#theNext_btn\")")
val
theNext_clicks =
$extmcall(EStream(ptr), theNext_btn, "asEventStream", "click")
//
val
thePrev_btn =
$extval(ptr, "$(\"#thePrev_btn\")")
val
thePrev_clicks =
$extmcall(EStream(ptr), thePrev_btn, "asEventStream", "click")
//
val
theRand_btn =
$extval(ptr, "$(\"#theRand_btn\")")
val
theRand_clicks =
$extmcall(EStream(ptr), theRand_btn, "asEventStream", "click")
//
val
theReset_btn =
$extval(ptr, "$(\"#theReset_btn\")")
val
theReset_clicks =
$extmcall(EStream(ptr), theReset_btn, "asEventStream", "click")
//
(* ****** ****** *)
//
val
theAuto_clicks =
theAuto_clicks.map(TYPE{act})(lam _ => Auto())
//
val
theNext_clicks = 
EStream_map{singpair(ptr)}{act}
(
  EStream_singpair_trans(theNext_clicks, 250)
, lam(x) => case+ x of Sing _ => Next() | Pair _ => Next2()
)
val
thePrev_clicks = 
EStream_map{singpair(ptr)}{act}
(
  EStream_singpair_trans(thePrev_clicks, 250)
, lam(x) => case+ x of Sing _ => Prev() | Pair _ => Prev2()
)
//
val
theRand_clicks = theRand_clicks.map(TYPE{act})(lam _ => Rand())
//
val
theReset_clicks = theReset_clicks.map(TYPE{act})(lam _ => Reset())
//
(* ****** ****** *)
//
val
theComb_clicks =
merge(theNext_clicks, thePrev_clicks, theRand_clicks)
//
val
theAuto_toggles =
EStream_scan{bool}{act}
(
  merge
  (
    theAuto_clicks, theReset_clicks
  )
, false // initial
, lam(res, act) => case+ act of Auto() => ~res | _ => false
)
//
val () =
theAuto_toggles.onValue()
(
lam(tf) =>
if tf
then $extmcall(void, theAuto_btn, "addClass", "btn-primary")
else $extmcall(void, theAuto_btn, "removeClass", "btn-primary")
)
//
val theAutoComb_stream =
  Property_sampledBy_estream_cfun
    (theAuto_toggles, theComb_clicks, lam(x, y) => if x then Skip else y)
//
val theTick_stream =
  Property_sampledBy_estream
    (theAuto_toggles, Bacon_interval{int}(1500(*ms*), 0))
//
val theComb2_clicks =
  merge
  (
    theComb_clicks
  , theAuto_clicks.map(TYPE{act})(lam _ => Skip)
  , theReset_clicks.map(TYPE{act})(lam _ => Skip)
  )
val theComb2_property = EStream_toProperty_init(theComb2_clicks, Skip)
//
val theComb2Tick_stream =
  Property_sampledBy_estream_cfun
    (theComb2_property, theTick_stream, lam(x, y) => if y then x else Skip)
//
(* ****** ****** *)
//
val
theCounts =
EStream_scan{int}{act}
(
  merge
  (
    theReset_clicks
  , theAutoComb_stream
  , theComb2Tick_stream
  )
, 0 (*initial*)
, lam(res, act) =>
  (
    case+ act of
//
    | Next() =>
      let val res2 = res + 1 in
        if res2 >= 100 then res2-100 else res2
      end // end of [Next2]
    | Next2() =>
      let val res2 = res + 5 in
        if res2 >= 100 then res2-100 else res2
      end // end of [Next2]
//
    | Prev() =>
      let val res2 = res - 1 in
        if res2 >= 0 then res2 else 100 + res2
      end // end of [Prev]
    | Prev2() =>
      let val res2 = res - 5 in
        if res2 >= 0 then res2 else 100 + res2
      end // end of [Prev2]
//
    | Rand() => double2int(100*JSmath_random())
//
    | Auto() => res | Reset() => (0) | Skip() => res
  )
) (* end of [theCounts] *)
//
in (* in-of-local *)
//
val () = theCounts.onValue()(lam(count) => theShow_update(count))
//
end // end of [local]

(* ****** ****** *)

%{^
//
var
theCanvas =
document.getElementById
("theShowStream-canvas");
var
theCanvas_ctx2d = theCanvas.getContext('2d');
//
var _ = theCanvas_ctx2d.font = "40px Georgia";
//
function
theCanvas_get() { return theCanvas; };
function
theCanvas_ctx2d_get() { return theCanvas_ctx2d; };
//
%} (* end of [%{^] *)

(* ****** ****** *)

%{$
//
theCounter3_baconjs_start();
//
%} // end of [%{$]

(* ****** ****** *)

(* end of [theCounter3_baconjs.dats] *)

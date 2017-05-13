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
"theCounter3_baconjs_initize"
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
"{$LIBATSCC2JS}/SATS/Bacon.js/baconjs.sats"
#staload
"{$LIBATSCC2JS}/SATS/Bacon.js/baconjs_ext.sats"
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
theCanvas_get(): canvas = "mac#"
extern
fun
theCanvas_ctx2d_get(): canvas2d = "mac#"
//
(* ****** ****** *)
//
extern
fun
theAllAct_Next_do(): void = "mac#"
extern
fun
theAllAct_Prev_do(): void = "mac#"
extern
fun
theAllAct_Next2_do(): void = "mac#"
extern
fun
theAllAct_Prev2_do(): void = "mac#"
//
extern
fun
theAllAct_Reset_do(): void = "mac#"
//
extern
fun
theAllAct_Random_do(): void = "mac#"
extern
fun
theAllAct_Search_do(): void = "mac#"
//
(* ****** ****** *)

local
//
datatype act =
  | Auto
  | Next | Next2
  | Prev | Prev2
  | Srch | Reset | Skip
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
theSrch_btn =
$extval(ptr, "$(\"#theSrch_btn\")")
val
theSrch_clicks =
$extmcall(EStream(ptr), theSrch_btn, "asEventStream", "click")
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
  EStream_singpair_trans(theNext_clicks, 200)
, lam(x) => case+ x of Sing _ => Next() | Pair _ => Next2()
)
val
thePrev_clicks = 
EStream_map{singpair(ptr)}{act}
(
  EStream_singpair_trans(thePrev_clicks, 200)
, lam(x) => case+ x of Sing _ => Prev() | Pair _ => Prev2()
)
//
val
theSrch_clicks = theSrch_clicks.map(TYPE{act})(lam _ => Srch())
//
val
theReset_clicks = theReset_clicks.map(TYPE{act})(lam _ => Reset())
//
(* ****** ****** *)
//
val
theComb_clicks =
merge(theNext_clicks, thePrev_clicks, theSrch_clicks)
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
    (theAuto_toggles, Bacon_interval{int}(250(*ms*), 0))
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

#define MAX 1000000

(* ****** ****** *)
//
fun
theAllAct_do
  (act: act): void =
(
//
case+ act of
| Auto() => ()
| Skip() => ()
//
| Next() => theAllAct_Next_do()
| Prev() => theAllAct_Prev_do()
| Next2() => theAllAct_Next2_do()
| Prev2() => theAllAct_Prev2_do()
//
| Srch() => theAllAct_Search_do()
//
| Reset() => theAllAct_Reset_do()
//
) (* end of [theAllAct_do] *)
//
(* ****** ****** *)
//
val
theAllAct_stream =
merge(
  theReset_clicks
, theAutoComb_stream
, theComb2Tick_stream
) (* end of [theAllAct_stream] *)
//
in (* in-of-local *)
//
val () = theAllAct_stream.onValue()(lam(act) => theAllAct_do(act))
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
//
extern
fun
theCounter3_baconjs_start
  ((*void*)): void = "mac#"
//
implement
theCounter3_baconjs_start() =
{
val () =
$extfcall
(
  void
, "theCounter3_baconjs_initize"
) (* $extfcall *)
//
val ((*void*)) = theAllAct_Reset_do()
} (* theCounter3_baconjs_start *)
//
(* ****** ****** *)

%{$
//
theCounter3_baconjs_start();
//
%} // end of [%{$]

(* ****** ****** *)

(* end of [theCounter3_baconjs.dats] *)

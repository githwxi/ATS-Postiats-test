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
"$PATSHOME/contrib/libatscc2js/ATS2-0.3.2"
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
staload
"{$LIBATSCC2JS}/SATS/Bacon.js/baconjs_ext.sats"
//
(* ****** ****** *)

%{^
//
var
theAutos =
  $("#button_auto").asEventStream("click")
var
theNexts =
  $("#button_next").asEventStream("click")
//
var theFibs_auto = 0
var theFibs_next = 0
//
%} // end of [%{^]

(* ****** ****** *)
//
val
theAutos =
  $extval(EStream(void), "theAutos")
//
val
theNexts =
  $extval(EStream(void), "theNexts")
//
(* ****** ****** *)
//
val theFibs = let
//
fun
aux
(
  f0: int, f1: int
) : stream(int) =
  $delay(stream_cons(f0, aux(f1, f0+f1)))
//
in
  aux(0, 1)
end // end of [theFibs]
//
(* ****** ****** *)
//
val
theAutos =
EStream_scan{bool}
  (theAutos, false, lam(tf, _) =<cloref1> not(tf))
//
val
theAutos = theAutos.sampledBy(Bacon_interval{int}(1000, 0))
//
(* ****** ****** *)
//
(*
val
theFibs_auto = let
//
val
f_theFibs =
  stream2cloref_exn(theFibs)
//
in
  theAutos.map(lam _ =<cloref1> f_theFibs())
end // end of [theFibs_auto]
*)
//
(*
EStream_scan_stream_opt
  {a,b,c:t0p}
(
  xs: EStream(b)
, ini: a, ys: stream(c), cfun(a, b, c, Option_vt(a))
) : Property(a) = "mac#%" // end-of-function
*)
val
theFibs_auto =
EStream_scan_stream_opt
  {int,bool,int}
(
  theAutos, 0, theFibs
, lam(_, x, y) => if x then Some_vt(y) else None_vt())
//
(* ****** ****** *)
//
val
theFibs_next = let
//
val
f_theFibs =
  stream2cloref_exn(theFibs)
//
in
  theNexts.map(TYPE{int})(lam _ =<cloref1> f_theFibs())
end // end of [theFibs_next]
//
(* ****** ****** *)
//
extvar "theFibs_auto" = theFibs_auto
extvar "theFibs_next" = theFibs_next
//
(* ****** ****** *)
    
%{$
//
function
FibStream_initize()
{
  var _ = my_dynload()
  var _ = theFibs_auto.assign($("#fibval_auto"), "text")
  var _ = theFibs_next.assign($("#fibval_next"), "text")
}
//
jQuery(document).ready(function(){FibStream_initize();});
//
%} // end of [%{$]

(* ****** ****** *)

(* end of [FibStream2.dats] *)

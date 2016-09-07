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
theClicks = $("#click").asEventStream("click")
//
var theCounts = 0
//
%} // end of [%{^]

(* ****** ****** *)
//
val
theClicks = $extval(EStream(void), "theClicks")
//
(* ****** ****** *)
//
typedef
cont(a:t@ype, ans:t@ype) = (a) -<cloref1> ans
//
(* ****** ****** *)
(*
//
fun{
ans:t0p
} kfact
(
  n: int
, k: cont(int, ans)
) : stream_con(cont(int, ans)) =
(
if
n > 0
then let
//
val k2 =
  lam
  (
    res: int
  ) : ans =<cloref1> k(n * res)
in
  stream_cons(k2, $delay(kfact(n-1, k2)))
end // end of [then]
else stream_nil(*void*) // else
)
//
*)
(* ****** ****** *)

typedef state = $tup(int, cont(int, void))

(* ****** ****** *)
//
val n0 = 10
//
val k0 =
lam(res: int) =<cloref1>
  alert("fact(" + String(n0) + ") = " + String(res))
//
val k1 =
lam(res: int) =<cloref1> alert("The computation is already done!")
//
(* ****** ****** *)

val theState_0 = $tup(10, k0)
val theState_1 = $tup(~1, k1)

(* ****** ****** *)

val
theStates =
scan{state,void}
(
  theClicks
, theState_0
, lam(state, _) =<cloref1>
  let
    val n = state.0 and k = state.1
  in
    if n <= 0
      then (k(1); theState_1)
      else $tup(n-1, lam(res:int): void => k(n*res))
    // end of [if]
  end // end of [let]
) (* end of [scan] *)

(* ****** ****** *)
//
val
theCounts =
Property_map{state}{int}(theStates, lam(state) =<cloref1> (state.0)+1)
//
extvar "theCounts" = theCounts
//
(* ****** ****** *)
    
%{$
//
function
kfact_initize()
{
  var _ = my_dynload()
  var _ = theCounts.assign($("#count"), "text")
}
//
jQuery(document).ready(function(){kfact_initize();});
//
%} // end of [%{$]

(* ****** ****** *)

(* end of [kfact.dats] *)

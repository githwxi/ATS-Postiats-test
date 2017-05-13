(* ****** ****** *)
(*
// theShow_update
*)
(* ****** ****** *)
//
(*
#define
ATS_MAINATSFLAG 1
#define
ATS_DYNLOADNAME
"theShow_update_start"
#define
ATS_STATIC_PREFIX "theShow_update_"
*)
//
(* ****** ****** *)
//
(*
#define
LIBATSCC2JS_targetloc
"$PATSHOME\
/contrib/libatscc2js/ATS2-0.3.2"
//
#include
"{$LIBATSCC2JS}/staloadall.hats"
#staload
"{$LIBATSCC2JS}/SATS/HTML/canvas-2d/canvas2d.sats"
*)
//
(* ****** ****** *)
//
extern
fun
theShow_count_get(): int = "mac#"
extern
fun
theShow_count_set(int): void = "mac#"
//
local

val theCount = ref{int}(~1)

in (* in-of-local *)
//
implement
theShow_count_get() = theCount[]
implement
theShow_count_set(count) = theCount[] := count
//
end // end of [local]

(* ****** ****** *)
//
extern
fun
theShow_update(count: int): void = "mac#"
extern
fun
theShow_update_do(count: int): void = "mac#"
//
(* ****** ****** *)

implement
theShow_update
  (c1) = let
//
val c0 = theShow_count_get()
//
in
//
if
(c0 != c1)
then
(
theShow_count_set(c1); theShow_update_do(c1)
) (* end of [then] *)
//
end // end of [theShow_update]

(* ****** ****** *)

abst@ype state_t0ype

(* ****** ****** *)

typedef state = state_t0ype
typedef states = stream(state)

(* ****** ****** *)
//
extern
fun
theStateStream_gen(): states = "mac#"
//
extern
fun
theState_show(state): void = "mac#"
and
theStateStream_show(): void = "mac#"
//
extern
fun
theStateStream_get_at(int): void = "mac#"
//
(* ****** ****** *)

local
//
val
theStates_ref =
  ref{states}(theStateStream_gen())
//
val
theCount_next_ref = ref{int}(0)
val
theStates_next_ref =
let
  val xs = theStates_ref[] in ref{states}(xs)
end // theStates_next_ref
//
in (* in-of-local *)

implement
theStateStream_show
  ((*void*)) = let
//
val xs = theStates_next_ref[]
//
in
//
case+ !xs of
| stream_nil() => ()
| stream_cons(x, xs) => let
    val n0 = theCount_next_ref[]
    val () = theCount_next_ref[] := n0 + 1
  in
    theStates_next_ref[] := xs; theState_show(x)
  end // end of [stream_cons]
//
end (* end of [theStateStream_show] *)

(* ****** ****** *)

implement
theStateStream_get_at
  (n1) = let
//
fun
loop
(
xs: states, n: intGte(0)
) : states =
if
(n > 0)
then
(
case+ !xs of
| stream_nil() => xs
| stream_cons(_, xs) => loop(xs, n-1)
)
else xs // end of [else]
//
val n0 = theCount_next_ref[]
//
(*
val () = if (n0 = n1) then alert("Cache hit!")
val () = if (n0 != n1) then alert("Cache miss!")
*)
//
in
//
if
(n0 != n1)
then let
//
val n1 = g1ofg0(n1)
val xs = theStates_ref[]
val xs = (if n1 >= 0 then loop(xs, n1) else xs): states
//
in
  theCount_next_ref[] := n1; theStates_next_ref[] := xs
end // end of [then]
//
end // end of [theStateStream_get_at]

(* ****** ****** *)

end // end of [local]

(* ****** ****** *)

implement
theShow_update_do
  (count) =
  theStateStream_show() where
{
//
val () = theStateStream_get_at(count)
//
} (* end of [theShow_update_do] *)

(* ****** ****** *)
//
#define
STATESTREAM_EMBEDDED 1
//
#include "./theStateStream.dats"
//
(* ****** ****** *)

(* end of [theShow_update.dats] *)

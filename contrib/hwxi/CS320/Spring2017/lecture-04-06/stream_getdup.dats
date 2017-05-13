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
(* ****** ****** *)
//
extern
fun
{a:t@ype}
stream_getdup(stream(a)): stream(a)
//
(* ****** ****** *)

implement
{a}
stream_getdup(xs) =
  aux1(xs) where
{
//
fun
aux1
(
xs: stream(a)
) : stream(a) = $delay
(
let
val-stream_cons(x1, xs) = !xs in !(aux2(x1, xs))
end
)

and
aux2
(
x1: a
,
xs: stream(a)
) : stream(a) = $delay
(
let
  val-stream_cons(x2, xs) = !xs
  val sgn = gcompare_val_val<a>(x1, x2)
in
  if sgn != 0 then !(aux2(x2, xs)) else !(aux3(x2, xs))
end
)

and
aux3
(
x2: a
,
xs: stream(a)
) : stream(a) = $delay
(
let
  val-stream_cons(x3, xs) = !xs
  val sgn = gcompare_val_val<a>(x2, x3)
in
  if sgn != 0
    then stream_cons(x2, aux2(x3, xs)) else !(aux3(x3, xs))
  // end of [if]
end
)
//
} (* end of [stream_getdup] *)

(* ****** ****** *)

implement main0() = { (*nothing*) }

(* ****** ****** *)

(* end of [stream_getdup.dats] *)

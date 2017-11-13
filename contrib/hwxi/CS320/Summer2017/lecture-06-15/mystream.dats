(* ****** ****** *)
//
#define
ATS_MAINATSFLAG 1
#define
ATS_DYNLOADNAME
"mystream_initize"
//
(* ****** ****** *)
//
extern
fun
my_set_timeout
  (fwork: () -<cloref1> void, int(*delay*)): void
//
(* ****** ****** *)

implement
my_set_timeout
  (fwork, ms) =
{
//
  val
  fwork =
  $extfcall
  (() -> void, "ats2jspre_cloref2fun0", fwork)
//
  val () = $extfcall(void, "setTimeout", fwork, ms)
//
}

(* ****** ****** *)

(*
// HX:
// How to compile:
##myatsccdef=\
patsopt --dynamic $1 | \
atscc2js --output $fname($1)_$fname_ext($1).js -i -
//
*)

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
#staload
"{$LIBATSCC2JS}/SATS/HTML/canvas-2d/canvas2d.sats"
//
(* ****** ****** *)
//
extern
fun
{a:t@ype}
mystream_show(xs: stream(a)): void
//
(* ****** ****** *)

extern
fun
{a:t@ype}
mystream_show_elt(a): void
extern
fun{}
mystream_show_finish(): void

(* ****** ****** *)

implement
{a}
mystream_show
  (xs) =
(
case+ !xs of
| stream_nil() =>
  mystream_show_finish()
| stream_cons(x, xs) =>
  {
    val () =
    mystream_show_elt<a>(x)
    val () =
    my_set_timeout(lam() => mystream_show(xs), 1000)
  }
)

(* ****** ****** *)
//
val
theNats = from(0) where
{
fun
from
(
i: int
): stream(int) =
   $delay(stream_cons(i, from(i+1)))
}
//
(* ****** ****** *)

implement
mystream_show_elt<int>(x) = alert(String(x))

(* ****** ****** *)

val
theNats_2 =
stream_takeLte(theNats, 2)
val
theNats_2 = stream_vt2t(theNats_2)

(* ****** ****** *)
//
val () =
mystream_show<int>(theNats_2)
where
{
implement
mystream_show_finish<> () = alert("The End")
}
//
(* ****** ****** *)

(* end of [mystream.dats] *)

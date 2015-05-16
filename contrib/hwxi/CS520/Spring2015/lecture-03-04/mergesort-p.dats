(*
** A refinement-based
** implementation of mergesort
*)
(* ****** ****** *)
//
// Please visit:
// http://ats-lang.sourceforge.net/EXAMPLE/EFFECTIVATS/mergesort/main.html
//
(* ****** ****** *)

%{^
#include <pthread.h>
%} // end of [%{^]

(* ****** ****** *)
//
#include
"share/atspre_define.hats"
#include
"share/atspre_staload.hats"
//
(* ****** ****** *)

staload UN = $UNSAFE

(* ****** ****** *)
//
staload "libats/SATS/athread.sats"
//
staload _ = "libats/DATS/athread.dats"
staload _ = "libats/DATS/athread_posix.dats"
//
(* ****** ****** *)

staload _ = "libats/DATS/deqarray.dats"

(* ****** ****** *)
//
staload
"{$LIBATSHWXI}/teaching/mythread/SATS/channel_vt.sats"
staload
"{$LIBATSHWXI}/teaching/mythread/DATS/channel_vt.dats"
//
(* ****** ****** *)
//
extern
fun
{a:t@ype}
do_work_mt
(
  f: () -<lincloptr1> a
) : channel(a)
//
implement
{a}(*tmp*)
do_work_mt (f) = let
  val ch =
  channel_create_exn<a> (i2sz(2))
  val ch2 = channel_ref(ch)
  val tid =
  athread_create_cloptr_exn
  (
    llam () => let
       val () =
       channel_insert<a> (ch, f())
       val qptr =
       $UN.castvwtp0{ptr}(channel_unref(ch))
       val () =
       if qptr > 0 then
         queue_free_type($UN.castvwtp0{queue(a)}(qptr))
       // end of [if]
     in
       cloptr_free($UN.castvwtp0{cloptr(void)}(f))
     end // end of [llam]
  ) (* athread_create_cloptr_exn *)
in
  ch2
end // end of [do_work_mt]
//
(* ****** ****** *)
//
extern
fun{a:t0p}
mergesort{n:nat}
  (xs: list (a, n)): list (a, n)
//
(* ****** ****** *)

extern
fun{a:t0p}
myseq_split
  {n:int | n >= 2}
(
  xs: list(a, n), n: int n
) : (list(a, n/2), list(a, n-n/2))

(* ****** ****** *)

extern
fun{a:t0p}
myseq_merge
  {n1,n2:nat}
  (xs1: list(a, n1), xs2: list(a, n2)): list(a, n1+n2)
// end of [myseq_merge]

(* ****** ****** *)

implement
{a}(*tmp*)
myseq_split
  (xs, n) = let
  val (xs1, xs2) = list_split_at<a> (xs, half(n))
in
  (list_vt2t(xs1), xs2)
end // end of [myseq_split]

(* ****** ****** *)

implement
{a}(*tmp*)
myseq_merge
  (xs10, xs20) = let
in
//
case+ xs10 of
| cons (x1, xs11) =>
  (
    case+ xs20 of
    | cons (x2, xs21) => let
        val sgn = gcompare_val_val<a> (x1, x2)
      in
        if sgn <= 0
          then cons{a}(x1, myseq_merge<a> (xs11, xs20))
          else cons{a}(x2, myseq_merge<a> (xs10, xs21))
        // end of [if]
      end (* end of [cons] *)
    | nil ((*void*)) => xs10
  )
| nil ((*void*)) => xs20
//
end // end of [myseq_merge]

(* ****** ****** *)
//
extern
fun{a:t0p}
msort{n:nat}
  (xs: list (a, n), n: int n): list (a, n)
//
extern
fun{a:t0p}
msort_mt{n:nat}
  (xs: list (a, n), n: int n): list (a, n)
//
(* ****** ****** *)
//
implement
{a}(*tmp*)
msort (xs, n) =
(
  if n >= 2 then let
    val n1 = half (n)
    val (xs1, xs2) =
      myseq_split<a> (xs, n)
    // end of [val]
    val ys1 = msort_mt (xs1, n1)
    and ys2 = msort_mt (xs2, n-n1)
  in
    myseq_merge<a> (ys1, ys2)
  end else (xs) // end of [if]
) (* end of [msort] *)
//
(* ****** ****** *)

implement
{a}(*tmp*)
msort_mt{n}(xs, n) = let
  val ch =
  do_work_mt<list(a,n)> (llam () => msort(xs, n))
  val ys = channel_takeout (ch)
  val qptr = $UN.castvwtp0{ptr}(channel_unref(ch))
  val () =
  if qptr > 0 then
    queue_free_type($UN.castvwtp0{queue(ptr)}(qptr))
  // end of [if]
in
  ys
end // end of [msort_mt]

(* ****** ****** *)
//
implement
{a}(*tmp*)
mergesort (xs) = msort (xs, list_length(xs))
//
(* ****** ****** *)

implement
main0 () = let
//
val xs =
$list{int}(2, 9, 8, 4, 5, 3, 1, 7, 6, 0)
val () = fprintln! (stdout_ref, "xs(*input*)  = ", xs)
//
val xs = mergesort<int> (xs)
//
val () = fprintln! (stdout_ref, "xs(*sorted*) = ", xs)
//
in
  // nothing
end // end of [main0]

(* ****** ****** *)

(* end of [mergesort-p.dats] *)

(* ****** ****** *)
(*
** For testing
** atscntrn-bucs320-mergesortpar
*)
(* ****** ****** *)

%{^
//
#include <pthread.h>
//
#ifdef ATS_MEMALLOC_GCBDW
#undef GC_H
#define GC_THREADS
#include <gc/gc.h>
#endif // #if(ATS_MEMALLOC_GCBDW)
//
%} // end of [%{^]

(* ****** ****** *)
//
#define
ATS_DYNLOADFLAG 0
//
(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
#include
"share/HATS\
/atspre_staload_libats_ML.hats"
//
(* ****** ****** *)

#define
PATSHOMELOCS_targetloc
"./../node_modules"

(* ****** ****** *)
//
#define MERGESORTPAR_LIST
//
#include
"{$PATSHOMELOCS}\
/atscntrb-bucs320-mergesortpar/mylibies.hats"
#include
"{$PATSHOMELOCS}\
/atscntrb-bucs320-mergesortpar/mydepies.hats"
#include
"{$PATSHOMELOCS}\
/atscntrb-bucs320-mergesortpar/mydepies_list.hats"
//
#staload FWS = $FWORKSHOP_chanlst
//
(* ****** ****** *)
//
extern
fun
MergeSortPar_list_double
  ($FWS.fworkshop, xs: list0(double)): list0(double)
//
(* ****** ****** *)
//
typedef elt =
$MergeSort_list.elt_t0ype
//
(* ****** ****** *)

local
//
assume
$MergeSort_list.elt_t0ype = double
//
implement
gcompare_val_val<elt>(x, y) = compare(x, y)
//
//
implement
$MergeSort_list.MergeSort_list$cutoff<>() = 8096
//
in (* in-of-local *)
//
implement
MergeSortPar_list_double
  (fws, xs) =
  $MergeSortPar_list.MergeSortPar_list<>(fws, xs)
//
end // end of [local]

(* ****** ****** *)
//
#staload
"libats/libc/SATS/stdlib.sats"
//
(* ****** ****** *)

fun{a:t@ype}
list0_is_sorted
  (xs: list0(INV(a))): bool =
(
case+ xs of
| list0_nil
    () => true
| list0_cons
    (x, xs) => loop(x, xs) where 
  {
    fun loop(x0: a, xs: list0(a)): bool =
      case+ xs of
      | list0_nil() => true
      | list0_cons(x1, xs) =>
        if gcompare_val_val<a>(x0, x1) <= 0 then loop(x1, xs) else false
    // end of [loop]
  }
)

(* ****** ****** *)

implement
main0() = () where
{
//
val N = 1000000
//
val
fws =
$FWS.fworkshop_create_exn()
//
val err =
  $FWS.fworkshop_add_worker(fws)
val err =
  $FWS.fworkshop_add_worker(fws)
//
local
implement
grandom_double<>() =
$extfcall(double, "drand48")
in(*in-of-local*)
val xs = grandom_list<double>(N)
end // end of [local]
//
val xs = g0ofg1(xs)
val ys = MergeSortPar_list_double(fws, xs)
//
val () =
if (N <= 10)
  then println! ("xs = ", xs)
val () =
if (N <= 10)
  then println! ("ys = ", ys)
//
val () = assertloc(list0_is_sorted(ys))
//
} (* end of [main0] *)

(* ****** ****** *)

(* end of [test01_mergesortpar.dats] *)

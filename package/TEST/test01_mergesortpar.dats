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
val () =
assertloc
(
  list0_is_ordered(ys, lam(x, y) => compare(x, y))
) (* assertloc *)
//
} (* end of [main0] *)

(* ****** ****** *)

(* end of [test01_mergesortpar.dats] *)

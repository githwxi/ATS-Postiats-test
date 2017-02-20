(* ****** ****** *)
(*
** For testing
** atscntrn-bucs320-quicksortpar
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
#define QUICKSORTPAR_ARRAY
//
#include
"{$PATSHOMELOCS}\
/atscntrb-bucs320-quicksortpar/mylibies.hats"
#include
"{$PATSHOMELOCS}\
/atscntrb-bucs320-quicksortpar/mydepies.hats"
#include
"{$PATSHOMELOCS}\
/atscntrb-bucs320-quicksortpar/mydepies_array.hats"
//
#staload FWS = $FWORKSHOP_chanlst
//
(* ****** ****** *)
//
extern
fun
QuickSortPar_array_double
  {n:int}
(
  $FWS.fworkshop, A: arrayref(double, n), n: int(n)
) : void // end of [QuickSortPar_array_double]
//
(* ****** ****** *)
//
typedef elt =
$QuickSort_array.elt_t0ype
//
(* ****** ****** *)

local
//
assume
$QuickSort_array.elt_t0ype = double
//
implement
gcompare_ref_ref<elt>(x, y) = compare(x, y)
//
//
implement
$QuickSort_array.QuickSort_array$cutoff<>() = 16*8096
//
in (* in-of-local *)
//
implement
QuickSortPar_array_double
  (fws, A, n) =
  $QuickSortPar_array.QuickSortPar_array<>(fws, A, n)
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
val N = 10000000
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
val A0 =
  grandom_arrayref<double>(i2sz(N))
end // end of [local]
//
val () =
  QuickSortPar_array_double(fws, A0, N)
//
val () =
assertloc
(
  array0_is_ordered
    (ASZ, lam(x, y) => compare(x, y))
  // array0_is_ordered
) where
{
  val ASZ = array0{double}(A0, i2sz(N))
} (* end of [val] *)
//
} (* end of [main0] *)

(* ****** ****** *)

(* end of [test02_quicksortpar.dats] *)

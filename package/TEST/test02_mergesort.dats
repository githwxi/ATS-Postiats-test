(* ****** ****** *)
(*
** For testing
** atscntrn-bucs320-mergesort
*)
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
#define MERGESORT_ARRAY
//
#include
"{$PATSHOMELOCS}\
/atscntrb-bucs320-mergesort/mydepies.hats"
#include
"{$PATSHOMELOCS}\
/atscntrb-bucs320-mergesort/mylibies.hats"
//
(* ****** ****** *)
//
extern
fun
MergeSort_array_double
  {n:int}
  (A: arrayref(double, n), n: int(n)): void
//
(* ****** ****** *)
//
typedef elt = $MergeSort_array.elt_t0ype
//
(* ****** ****** *)

local
//
assume
$MergeSort_array.elt_t0ype = double
//
implement
gcompare_val_val<elt>(x, y) = compare(x, y)
//
in (* in-of-local *)
//
implement
MergeSort_array_double
  (A, n) = $MergeSort_array.MergeSort_array<>(A, n)
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
local
implement
grandom_double<>() =
$extfcall(double, "drand48")
in(*in-of-local*)
val A0 =
  grandom_arrayref<double>(i2sz(N))
end // end of [local]
//
val () = MergeSort_array_double(A0, N)
//
(*
val () = assertloc(array0_is_sorted(ys))
*)
//
} (* end of [main0] *)

(* ****** ****** *)

(* end of [test01_mergesort.dats] *)

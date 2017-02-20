(* ****** ****** *)
(*
** For testing
** atscntrn-bucs320-quicksort
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
#define QUICKSORT_ARRAY
//
#include
"{$PATSHOMELOCS}\
/atscntrb-bucs320-quicksort/mydepies.hats"
#include
"{$PATSHOMELOCS}\
/atscntrb-bucs320-quicksort/mylibies.hats"
//
(* ****** ****** *)
//
extern
fun
QuickSort_array_double
  {n:int}
  (A: arrayref(double, n), n: int(n)): void
//
(* ****** ****** *)
//
typedef elt = $QuickSort_array.elt_t0ype
//
(* ****** ****** *)

local
//
assume
$QuickSort_array.elt_t0ype = double
//
implement
gcompare_val_val<elt>(x, y) = compare(x, y)
//
in (* in-of-local *)
//
implement
QuickSort_array_double
  (A, n) = $QuickSort_array.QuickSort_array<>(A, n)
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
local
implement
grandom_double<>() =
$extfcall(double, "drand48")
in(*in-of-local*)
val A0 =
  grandom_arrayref<double>(i2sz(N))
end // end of [local]
//
val () = QuickSort_array_double(A0, N)
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

(* end of [test01_quicksort.dats] *)

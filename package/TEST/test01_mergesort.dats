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
#define MERGESORT_LIST
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
MergeSort_list_double
  (xs: list0(double)): list0(double)
//
(* ****** ****** *)
//
typedef elt = $MergeSort_list.elt_t0ype
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
in (* in-of-local *)
//
implement
MergeSort_list_double
  (xs) = $MergeSort_list.MergeSort_list<>(xs)
//
end // end of [local]

(* ****** ****** *)
//
#staload
"libats/libc/SATS/stdlib.sats"
//
(* ****** ****** *)

(*
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
) (* end of [list0_is_sorted] *)
*)

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
val xs = grandom_list<double>(N)
end // end of [local]
//
val xs = g0ofg1(xs)
val ys = MergeSort_list_double(xs)
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

(* end of [test01_mergesort.dats] *)

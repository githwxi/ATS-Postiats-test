//
// Implementation of quicksort
//
(* ****** ****** *)
//
// Course CS520: Lecture-2013-09-26
// Instructor: Hongwei Xi (hwxiATcsDOTbuEDU)
//
(* ****** ****** *)

staload "libats/ML/SATS/basis.sats"
staload "libats/ML/SATS/array0.sats"

(* ****** ****** *)

extern
fun{a:t@ype} quicksort (A: array0 (a)): void

(* ****** ****** *)

extern
fun{a:t@ype}
array0_swap
  (A: array0 (a), i: size_t, j: size_t): void
// end of [array0_swap]

implement{a}
array0_swap
  (A, i, j) =
{
  val tmp = A[i]
  val () = A[i] := A[j]
  val () = A[j] := tmp
}

(* ****** ****** *)
//
// HX: [qsort] is for sorting an array segment
//
extern
fun{a:t@ype}
qsort (
  A: array0 (a), st: size_t, len: size_t
) : void // end of [qsort]
//
// HX: [qsort_pivot] chooses a pivot for partitioning
//
extern
fun{a:t@ype}
qsort_pivot (A: array0 (a), st: size_t, len: size_t): a
//
// HX-2013-09:
// [qsort_partition] partitions a segment into two segments
// such that the front one contains elements less than the pivot
// while the rear one contains the rest of the elements; the pivot
// is at the beginning of the rear segment; the returned value is
// the length of the front segment
//
extern
fun{a:t@ype}
qsort_partition
  (A: array0 (a), st: size_t, len: size_t, pivot: a): size_t
// end of [qsort_partition]

(* ****** ****** *)

implement{a}
quicksort (A) = qsort<a> (A, i2sz(0), array0_get_size(A))

(* ****** ****** *)

implement{a}
qsort (A, st, len) =
(
if len >= 2 then let
  val pivot = qsort_pivot<a> (A, st, len)
  val len_f = qsort_partition<a> (A, st, len, pivot)
  val ((*void*)) = qsort<a> (A, st, len_f)
  val len_r = len - len_f
  val ((*void*)) = qsort<a> (A, succ(st+len_f), pred(len_r))
in
  // nothing
end else () // end of [if]
)

(* ****** ****** *)

(* end of [quicksort.dats] *)

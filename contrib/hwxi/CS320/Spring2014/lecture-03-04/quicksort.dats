(*
** Implementing Quicksort
*)

#include
"share/atspre_staload.hats"
#include
"share/HATS/atspre_staload_libats_ML.hats"

(* ****** ****** *)

extern
fun{a:t0p}
array0_interchange
  (A: array0(a), i: int, j: int): void
implement{a}
array0_interchange
  (A, i, j) = let
  val tmp = A[i] in A[i] := A[j]; A[j] := tmp
end // end of [array0_interchange]

(* ****** ****** *)

extern
fun quicksort (array0 (int)): void

(* ****** ****** *)

extern
fun sort
  (array0(int), i: int, j: int): void
extern
fun sort2
  (array0(int), i: int, j: int): void // j - i >= 2
    
(* ****** ****** *)
//
extern
fun part
  (array0(int), i: int, j: int, pvt: int): int(*index*)
//
(* ****** ****** *)

implement
quicksort (A) = let
  val n = A.size() in sort (A, 0, sz2i(n))
end // end of [quicksort]
        
(* ****** ****** *)

implement
sort (A, i, j) =
  if j - i >= 2 then sort2 (A, i, j) else ()

(* ****** ****** *)
    
implement
sort2 (A, i, j) = let
  val k = i + (j - i) / 2
  val pvt = A[k]
  val () = array0_interchange (A, k, j-1)
  val k2 = part (A, i, j-1, pvt)
  val () = array0_interchange (A, k2, j-1)
  val () = sort (A, i, k2)
  val () = sort (A, k2+1, j)
in
  // nothing
end // end of [sort2]

(* ****** ****** *)

implement
part (A, i, j, pvt) = let
//
fun loop
(
  i1: int, i2: int
) : int =
(
if i2 < j then
 if (A[i2] < pvt) then let
   val () = array0_interchange (A, i1, i2)
 in
   loop (i1+1, i2+1)
 end else loop (i1, i2+1)
else i1 // end of [if]
) (* end of [loop] *)
//
in
  loop (0, 0)
end (* end of [part] *)

(* ****** ****** *)

(* end of [quicksort.dats] *)

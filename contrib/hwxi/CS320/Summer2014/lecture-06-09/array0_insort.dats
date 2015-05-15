(* ****** ****** *)

staload "libats/ML/SATS/basis.sats"
staload "libats/ML/SATS/array0.sats"

(* ****** ****** *)

extern
fun{a:t@ype}
insertionSort (A: array0 (a)): void

extern
fun{a:t@ype}
insertionSort2 (A: array0 (a), i: int, j: int): void
extern
fun{a:t@ype}
insertionSort2_aux (A: array0 (a), i: int, j: int): void

(* ****** ****** *)
//
implement
{a}(*tmp*)
insertionSort (A) =
  insertionSort2<a> (A, 0, sz2i(A.size()))
//
(* ****** ****** *)
//
// HX:
// [insertionSort2] is not tailrecursive
//
(* ****** ****** *)

implement
{a}(*tmp*)
insertionSort2
  (A, i, j) = let
in
  if j-i >= 2 then
  {
    val () = insertionSort2 (A, i+1, j)
    val () = insertionSort2_aux (A, i, j)
  }
end // end of [insertionSort2]

implement
{a}(*tmp*)
insertionSort2_aux
  (A, i, j) = let
in
  if j-i >= 2 then let
    val x0 = A[i]
    val x1 = A[i+1]
    val sgn = gcompare_val_val<a> (x0, x1)
  in
    if sgn <= 0
      then ()
      else let
        val () = A[i] := x1
        val () = A[i+1] := x0
      in
        insertionSort2_aux (A, i+1, j)
      end
  end
end // end of [insertionSort2]

(* ****** ****** *)
//
// HX: [insertionSort3] is tail-recursive
// 
(* ****** ****** *)

extern
fun{a:t@ype}
insertionSort3
  (A: array0 (a), i: int, j: int, k: int): void

implement
{a}(*tmp*)
insertionSort (A) = let
  val n = sz2i(A.size()) in insertionSort3 (A, 0, n, n)
end // end of [insertionSort]

implement
{a}(*tmp*)
insertionSort3
  (A, i, j, k) = let
in
  if i < j then
  {
    val () =
      insertionSort2_aux (A, j-1, k)
    // end of [val]
    val () = insertionSort3 (A, i, j-1, k)
  }
end // end of [insertionSort3]

(* ****** ****** *)

implement main0 () = ()

(* ****** ****** *)

(* end 0f [array0_insort.dats] *)

(* ****** ****** *)
//
// HX:
// Code for lecture-06-06
//
(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
#include
"share/HATS/atspre_staload_libats_ML.hats"
//
(* ****** ****** *)

staload "./../mylib/mylist.dats"

(* ****** ****** *)

(*
** Implementing matrix multiplication
*)

(* ****** ****** *)

typedef
row = list0(int)
typedef
mat = list0(list0(int)) // row major

(* ****** ****** *)

extern
fun
matrans : mat -> mat

(* ****** ****** *)

implement
matrans(M) = let
//
fun auxhd(M:mat): row =
  mylist_map_cloref(M, lam(xs) => list0_head_exn(xs))
fun auxtl(M:mat): mat =
  mylist_map_cloref(M, lam(xs) => list0_tail_exn(xs))
//
fun auxtrans(M:mat): mat =
  case- M of
  | list0_cons(xs, _) =>
    (
      case+ xs of
      | list0_nil() => list0_nil()
      | list0_cons _ => list0_cons(auxhd(M), auxtrans(auxtl(M)))
    )
//
in
//
case+ M of
| list0_nil() => list0_nil()
| list0_cons _ => auxtrans(M)
//
end // end of [matrans]

(* ****** ****** *)
//
extern
fun
dotprod : (row, row) -> int
//
(*
implement
dotprod(xs, ys) =
(
case+ xs of
| list0_nil() => 0
| list0_cons(x, xs) => let
    val-list0_cons(y, ys) = ys
  in
    x * y + dotprod(xs, ys)
  end
)
*)
implement
dotprod(xs, ys) =
  mylist2_foldleft_cloref<int,int,int>(xs, ys, 0, lam(res, x, y) => res + x*y)
//
(* ****** ****** *)
//
extern
fun
matmult : (mat, mat) -> mat
//
implement
matmult(M1, M2) = let
  val M2_t = matrans(M2)
in
  mylist_map_cloref(M1, lam(xs) => mylist_map_cloref(M2_t, lam(ys) => dotprod(xs, ys)))
end // end of [matmult]
//
(* ****** ****** *)

implement
main0() = let
//
val xs0 = g0ofg1($list{int}(1, ~1))
val xs1 = g0ofg1($list{int}(~1, 2))
val xss = g0ofg1($list{row}(xs0, xs1))
//
val out = stdout_ref
//
val yss = matmult(xss, xss)
//
val () = fprintln! (out, "xss = ", xss)
val () = fprintln! (out, "yss = ", yss)
//
in
  // nothing
end // end of [main0]

(* ****** ****** *)

(* end of [matmult.dats] *)

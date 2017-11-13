(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
#include
"share/HATS\
/atspre_staload_libats_ML.hats"
//
(* ****** ****** *)

typedef
matrix(a:t@ype) = list0(list0(a))

extern
fun
matmul(A: matrix(double), B: matrix(double)): matrix(double)

(*
fun
dotprod
(
xs: list0(double), ys: list0(double)
) : double =
(
case+ xs of
| list0_nil() => 0.0
| list0_cons(x, xs) => let
    val-list0_cons(y, ys) = ys in x * y + dotprod(xs, ys)
  end // end of [list0_cons]
)
*)
fun
dotprod
(
xs: list0(double), ys: list0(double)
) : double =
  list0_foldleft2<double><double,double>
    (xs, ys, 0.0, lam(res, x, y) => res + (x * y))


fun
{a:t@ype}
transpose
(
xss: list0(list0(a)), ncol: int
) : list0(list0(a)) = let
  val ns = list0_make_intrange_lr(0, ncol)
in  
//
list0_map<int><list0(a)>
  (ns, lam(i) => list0_map<list0(a)><a>(xss, lam(xs) => xs[i]))
//
end // end of [transpose]

implement
matmul(A, B) = let
//
// assume |xs| = |ys|
//
val
B_t =
transpose<double>(B, length(B[0]))  
//
in
//
list0_map<list0(double)><list0(double)>
  (A, lam(xs) => list0_map<list0(double)><double>(B_t, lam(ys) => dotprod(xs, ys)))
//
end

(* ****** ****** *)

implement main0() = ()

(* ****** ****** *)

(* end of [matmul.dats] *)

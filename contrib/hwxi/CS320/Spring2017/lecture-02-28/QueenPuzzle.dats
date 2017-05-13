(* ****** ****** *)

#include
"share/atspre_staload.hats"
#include
"share/HATS\
/atspre_staload_libats_ML.hats"

(* ****** ****** *)
//
#include
"$PATSHOMELOCS\
/effectivats-divideconquer/mylibies.hats"
//
#staload DC = $DivideConquer
//
(* ****** ****** *)
//
#define N 8
//
(* ****** ****** *)
//
extern
fun
QueenPuzzle(): list0(list0(int))
//
extern
fun
QueenPuzzle_helper
  : (list0(int)) -> list0(list0(int))
//
(* ****** ****** *)

implement
QueenPuzzle() = QueenPuzzle_helper(nil0)

(* ****** ****** *)

assume $DC.input_t0ype = list0(int)
assume $DC.output_t0ype = list0(list0(int))

(* ****** ****** *)

local

(* ****** ****** *)

implement
$DC.DC_base_test<>(xs) = (length(xs) = N)
implement
$DC.DC_base_solve<>(xs) = list0_sing(xs)

(* ****** ****** *)
//
implement
$DC.DC_divide<>
  (xs) =
  aux(0) where
{
//
typedef
input = $DC.input
//
fun
aux
(
  i: int
) : list0(input) = let
//
fun
test
(
xs: list0(int), d: int
) : bool =
(
case+ xs of
| list0_nil() => true
| list0_cons(x, xs) =>
    if (x != i && abs(x-i) != d) then test(xs, d+1) else false
  // end of [list0_cons]
)
//
in
//
if
(i < N)
then
(
if
test(xs, 1)
then list0_cons(list0_cons(i, xs), aux(i+1))
else aux(i+1)
)
else list0_nil(*void*)
//
end // end of [aux]
//
} (* end of [DC_divide] *)
//
(* ****** ****** *)

implement
$DC.DC_conquer_combine<>(_, rs) = list0_concat(rs)

(* ****** ****** *)

in (* in-of-local *)

implement
QueenPuzzle_helper(xs) = $DC.DC_solve<>(xs)

end // end of [local]

(* ****** ****** *)

implement
main0((*void*)) = 
{
//
val
xss = QueenPuzzle()
//
val ((*void*)) =
println! ("The number of solutions equals ", length(xss), ".")
//
val _(* nsol *) =
xss.iforeach
(
)
(
lam(i, xs) =>
(
println!
(
"Solution#", i+1, ":"
) ;
xs.rforeach()
(
lam x =>
(
(x).repeat()(lam() => print ". ");
print "Q ";
(N-1-x).repeat()(lam() => print ". "); println!()
)
); println!()
)
)
//
} (* end of [main0] *)

(* ****** ****** *)

(* end of [QueenPuzzle.dats] *)

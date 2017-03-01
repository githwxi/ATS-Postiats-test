(* ****** ****** *)
(*
** For testing
** atscntrn-bucs320-divideconquer
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
#include
"{$PATSHOMELOCS}\
/atscntrb-bucs320-divideconquer/mylibies.hats"
//
(* ****** ****** *)

#define N 8

(* ****** ****** *)

#staload DC = $DivideConquer

(* ****** ****** *)

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

assume
$DC.input_t0ype = list0(int)
assume
$DC.output_t0ype = list0(list0(int))

(* ****** ****** *)

local

(* ****** ****** *)

implement
$DC.DivideConquer$base_test<>
  (xs) = (length(xs) = N)
implement
$DC.DivideConquer$base_solve<>
  (xs) = list0_cons(xs, nil0)
//
(* ****** ****** *)
//
implement
$DC.DivideConquer$divide<>
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
else list0_nil((*void*))
//
end // end of [aux]
//
} (* end of [DivideConquer$divide] *)
//
(* ****** ****** *)

implement
$DC.DivideConquer$conquer$combine<>(_, rs) = list0_concat(rs)

(* ****** ****** *)

in (* in-of-local *)

implement
QueenPuzzle_helper(xs) = $DC.DivideConquer$solve<>(xs)

end // end of [local]

(* ****** ****** *)

implement
main0((*void*)) = 
{
//
overload
*
with
int_repeat_lazy
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
// argless
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
x*delay(print ". ");
print "Q ";
(N-1-x)*delay(print ". "); println!()
)
); println!((*void*))
)
)
//
} (* end of [main0] *)

(* ****** ****** *)

(* end of [test01_divideconquer.dats] *)

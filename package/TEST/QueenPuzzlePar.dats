(* ****** ****** *)
(*
** For testing
** atscntrn-bucs320-divideconquerpar
*)
(* ****** ****** *)
//
// HX-2017-03-03:
// It is slightly better than QueenPuzzle
//
(* ****** ****** *)

%{^
//
#include <pthread.h>
//
#ifdef ATS_MEMALLOC_GCBDW
#undef GC_H
#define GC_THREADS
#include <gc/gc.h>
#endif // #if(ATS_MEMALLOC_GCBDW)
//
%} // end of [%{^]

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
/atscntrb-bucs320-divideconquerpar/mydepies.hats"
#include
"{$PATSHOMELOCS}\
/atscntrb-bucs320-divideconquerpar/mylibies.hats"
//
(* ****** ****** *)

#define N 12

(* ****** ****** *)

#staload DC = $DivideConquer
#staload DCP = $DivideConquerPar
#staload FWS = $FWORKSHOP_chanlst

(* ****** ****** *)

extern
fun
QueenPuzzlePar
  ($FWS.fworkshop): list0(list0(int))
//
extern
fun
QueenPuzzlePar_helper:
  ($FWS.fworkshop, list0(int)) -> list0(list0(int))
//
(* ****** ****** *)

implement
QueenPuzzlePar(fws) =
QueenPuzzlePar_helper(fws, nil0)

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
QueenPuzzlePar_helper
  (fws, xs) = let
//
val () = $tempenver(fws)
//
implement
$DCP.DivideConquerPar$submit<>
  (fwork) =
{
//
val () =
$FWS.fworkshop_insert_lincloptr
( fws
, llam() => 0 where
  {
    val () = fwork()
    val () = // fwork needs to be freed
    cloptr_free
    (
      $UNSAFE.castvwtp0{cloptr(void)}(fwork)
    ) (* cloptr_free *)
  } // end of [fworkshop_insert_lincloptr]
) (* end of [val] *)
//
} (* DivideConquerPar$submit] *)
//
implement
$DCP.DivideConquerPar$submit2<>
  (xs, fwork) =
(
//
if
length(xs) >= N/2
then () where
{
  val () = fwork()
  val () = // fwork needs to be freed
  cloptr_free
    ($UNSAFE.castvwtp0{cloptr(void)}(fwork))
  // end of [cloptr_free]
}
else () where
{
  val () = $DCP.DivideConquerPar$submit<>(fwork)
}
//
) (* $DCP.DivideConquerPar$submit2 *)
//
in
  $DC.DivideConquer$solve<>(xs)
end // end of [QueenPuzzlePar_helper]

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
fws =
$FWS.fworkshop_create_exn()
//
val err =
  $FWS.fworkshop_add_worker(fws)
val err =
  $FWS.fworkshop_add_worker(fws)
//
val
xss = QueenPuzzlePar(fws)
//
val ((*void*)) =
println! ("The number of solutions equals ", length(xss), ".")
//
(*
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
*)
//
} (* end of [main0] *)

(* ****** ****** *)

(* end of [QueenPuzzlePar.dats] *)

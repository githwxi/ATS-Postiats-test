
#include
"share/atspre_staload.hats"
#include
"share/HATS/atspre_staload_libats_ML.hats"

(* ****** ****** *)

staload "./../mylib/mylist.dats"

(* ****** ****** *)

extern
fun
mlist : (list0(int)) -> int
extern
fun
mlist_exn : (list0(int)) -> int

(* ****** ****** *)
//
(*
implement
mlist(xs) =
mylist_foldleft_cloref<int,int>(xs, 1, lam(res, x) => x * res)
*)
//
(* ****** ****** *)
//
exception ZERO_EXN
//
implement
mlist_exn(xs) =
mylist_foldleft_cloref<int,int>
  (xs, 1, lam(res, x) => if x = 0 then $raise ZERO_EXN() else x * res)
//
implement
mlist(xs) =
try mlist_exn(xs) with ~ZERO_EXN() => 0
//
(* ****** ****** *)

implement
main0 () =
(
  println! ("mlist(...) = ", mlist(g0ofg1($list{int}(1,2,3,0,4,5,6,7,8,9))))
)

(* ****** ****** *)

(* end of [mlist_exn.dats] *)

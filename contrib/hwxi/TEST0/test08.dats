(*
** Testing
** libats/ML/intrange
*)

(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
#include
"share/HATS/atspre_staload_libats_ML.hats"
//
(* ****** ****** *)

staload UN = $UNSAFE

(* ****** ****** *)
//
val () =
(5).foreach()(lam(i) => println! ("i = ", i))
val () =
(5, 10).foreach()(lam(i) => println! ("i = ", i))
//
(* ****** ****** *)
//
val
sum10 =
(10).foldleft(TYPE{int})(0, lam(res, i) => res + (i+1))
val () = println! ("sum(10) = ", sum10)
val
fact10 =
(0, 10).foldleft(TYPE{int})(1, lam(res, i) => res * (i+1))
val () = println! ("fact(10) = ", fact10)
//
(* ****** ****** *)

implement main0 () = ()

(* ****** ****** *)

(* end of [test08.dats] *)

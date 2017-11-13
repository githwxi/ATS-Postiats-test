(* ****** ****** *)

#include
"share/atspre_staload.hats"
#include
"share/HATS/atspre_staload_libats_ML.hats"

(* ****** ****** *)
//
// i2sz: casting int to size_t
//
(*
val A =
array0_make_elt<int>(i2sz(10), ~1)
*)
//
val A = array0_tabulate<int>(i2sz(10), lam(i) => let val i = sz2i(i) in i * i end)
//
(* ****** ****** *)

val () = println! (A[5])
val () = A[5] := 2 * A[5]
val () = println! (A[5])

(* ****** ****** *)

(*
val () = println! (A[10]) // off-by-1 error
*)

(* ****** ****** *)

val sum =
array0_foldleft<int><int>(A, 0, lam(res, x) => res + x)

(* ****** ****** *)

val sum2 =
array0_foldright<int><int>(A, lam(res, x) => res + x, 0)

(* ****** ****** *)

implement main0() =
{
val () = println! ("A = ", A)
val () = println! ("sum = ", sum)
val () = println! ("sum2 = ", sum2)
val () =
array0_rforeach<int>(A, lam(x) => println!(x))
val () =
array0_iforeach<int>(A, lam(i, x) => println!("A[", i, "] = ", x))
}

(* ****** ****** *)

(* end of [myarray.dats] *)

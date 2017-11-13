(* ****** ****** *)

#include
"share/atspre_staload.hats"
#include
"share/HATS/atspre_staload_libats_ML.hats"

(* ****** ****** *)
//
// i2sz: casting int to size_t
// sz2i: casting size_t to int
//
(* ****** ****** *)

val M = matrix0_make_elt<int>(i2sz(10), i2sz(10), ~1)

(* ****** ****** *)

(*
fun{a:vt0p}
matrix0_iforeach
  (M: matrix0 (a), f: (size_t, size_t, &a >> _) -<cloref1> void): void
// end of [matrix0_iforeach]
*)
val () =
matrix0_iforeach<int>(M, lam(i, j, x) => x := sz2i(i) + sz2i(j))

(* ****** ****** *)

implement main0() =
{
val () = println! ("M = ", M)
}

(* ****** ****** *)

(* end of [myarray.dats] *)

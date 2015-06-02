(*
** Some string manipulation functions
*)
(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
//
#include
"share/HATS/atspre_staload_libats_ML.hats"
//
(* ****** ****** *)
//
extern
fun
isAnagram(w1: string, w2: string): bool
//
(* ****** ****** *)

fun
normalize
(
  w: string
) : list0(char) = let
  val cs = string_explode(w)
in
  list0_mergesort(cs, lam(c1, c2) => compare(c1, c2))
end // end of [normalize]
 
(* ****** ****** *)

implement
isAnagram(w1, w2) =
list0_equal
(
  normalize(w1), normalize(w2), lam(c1, c2) => c1 = c2
)

(* ****** ****** *)

val () = assertloc(isAnagram("listen", "silent"))

(* ****** ****** *)

implement main0 () = ()

(* ****** ****** *)

(* end of [string.dats] *)

(* ****** ****** *)
//
// HX-2014-01-30:
// An abstract interface for integer arrays
//
(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
#include
"share/HATS/atspre_staload_libats_ML.hats"
//
(* ****** ****** *)

staload "./intarray.sats"

(* ****** ****** *)

assume intarray = array0 (int)

(* ****** ****** *)

implement
intarray_make
  (n, x0) = let
  val n = g1ofg0(n)
in
  if n >= 0
    then array0_make_elt<int> (i2sz(n), x0)
    else $raise IllegalArgExn("intarray_make: negative size")
  // end of [if]
end // end of [intarray_make]

(* ****** ****** *)

implement
intarray_get_at (A, i) = array0_get_at_gint (A, i)
implement
intarray_set_at (A, i, x) = array0_set_at_gint (A, i, x)

(* ****** ****** *)

implement intarray_length (A) = g0u2i (A.size())

(* ****** ****** *)

(* end of [intarray.dats] *)

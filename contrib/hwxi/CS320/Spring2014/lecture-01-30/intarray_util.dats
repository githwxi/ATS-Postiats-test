(* ****** ****** *)
//
// HX-2014-01-30:
// An abstract interface for integer arrays
//
(* ****** ****** *)

#define ATS_DYNLOADFLAG 0

(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
//
(* ****** ****** *)

staload "./intarray.sats"

(* ****** ****** *)
//
implement
print_intarray (A) =
  fprint_intarray (stdout_ref, A)
//
(* ****** ****** *)

implement
fprint_intarray
  (out, A) = let
//
val n = length (A)
//
fun loop
  (i: int): void =
  if i < n then let
    val () = if i > 0 then fprint (out, "; ")
    val () = fprint (out, A[i])
  in
    loop (i+1)
  end else () // end of [if]
//
in
  loop (0)
end // end of [fprint_intarray]

(* ****** ****** *)

(* end of [intarray_util.dats] *)

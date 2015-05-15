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

staload "./intarray2.sats"

(* ****** ****** *)
//
implement
print_intarray2 (A) =
  fprint_intarray2 (stdout_ref, A)
//
(* ****** ****** *)

implement
fprint_intarray2
  (out, A) = let
//
val nrow = A.nrow()
val ncol = A.ncol()
//
fun loop_row
  (i: int): void =
(
  if i < nrow
    then (loop_col (i, 0); loop_row (i+1)) else ()
  // end of [if]
)

and loop_col
  (i: int, j: int): void =
(
  if j < ncol then let
    val () =
    if j > 0 then fprint (out, ", ")
    val () = fprint (out, A[i, j])
  in
    loop_col (i, j+1)
  end else fprint_newline (out)
)
//
in
  loop_row (0)
end // end of [fprint_intarray2]

(* ****** ****** *)

(* end of [intarray2_util.dats] *)

(* Matrices *)

#include "share/atspre_staload.hats"

staload "libats/ML/SATS/basis.sats"
staload "libats/ML/SATS/matrix0.sats"
staload _ = "libats/ML/DATS/matrix0.dats"

(* Transpose a matrix. *)
fun {a : t@ype} transpose (matrix : matrix0 a) : void =
  goRows (i2sz(0))
  where {
    val nrow = matrix0_get_nrow (matrix)
    fnx goRows (i : size_t) :<cloref1> void =
      if i < nrow
         then goCols (i,i2sz(0))
         else ()
    and goCols (i : size_t,j : size_t) :<cloref1> void =
      if j < i
         then let val tmp = matrix[i,j]
              in begin matrix[i,j] := matrix[j,i];
                       matrix[j,i] := tmp;
                       goCols (i,succ(j))
                 end
              end
         else goRows (succ(i))
  }

implement main0 () = ()

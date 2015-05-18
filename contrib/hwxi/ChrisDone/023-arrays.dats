(* Arrays *)

#include "share/atspre_staload.hats"

staload "libats/ML/SATS/basis.sats"
staload "libats/ML/SATS/array0.sats"
staload _ = "libats/ML/DATS/array0.dats"

(* Insertion sort. *)
fun {a : t@ype} insertionSort (array : array0 (a),cmp : (a,a) -> int) : void =
  go 1
  where {
    val arraySize = array.size()
    val length = g0u2i(arraySize)
    fun ins (x : a,i : int) :<cloref1> void =
      if i >= 0
         then
           if cmp (x,array[i]) < 0
              then begin array[i+ 1] := array[i];
                         ins (x,i - 1);
                   end
              else array[i+1] := x
         else array[0]  := x
    fun go (i : int) :<cloref1> void =
      if i < length
         then begin ins (array[i],i - 1);
                    go (i + 1);
              end
         else ()
  }

implement main0 () = ()

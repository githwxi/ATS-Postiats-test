(*
** Code for lecture-10-13
*)

(* ****** ****** *)
//
extern
fun
swap(int, int): void
//
typedef cont = () -<cloref1> void
//
(* ****** ****** *)
//
fun
revarr2
(
  i: int, j: int, k: cont
) : void =
//
if j <= i
  then k()
  else let
    val () = swap(i, j)
  in
    revarr2 (i+1, j-1, lam () => (swap(i, j); k()))
  end // end of [else]
//
(* ****** ****** *)

(* end of [revarr.dats] *)

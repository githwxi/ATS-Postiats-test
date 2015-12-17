(*
** Code for lecture-10-05
*)

(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
//
(* ****** ****** *)
//
datatype
mystream =
mystream of () -<cloref1> (int, mystream)
//
(* ****** ****** *)

extern
fun from : int -> mystream

(* ****** ****** *)
  
implement from(n) = mystream (lam () => (n, from(n+1)))
  
(* ****** ****** *)

implement
main0 () = () where
{
//
val xs0 = from(0)
//
val+mystream(fxs0) = xs0
val (x0, xs1) = fxs0 ()
val () = println! ("x0 = ", x0)
//
val+mystream(fxs1) = xs1
val (x1, xs2) = fxs1 ()
val () = println! ("x1 = ", x1)
//
val+mystream(fxs2) = xs2
val (x2, xs3) = fxs2 ()
val () = println! ("x2 = ", x2)
//
} (* end of [main0] *)

(* ****** ****** *)

(* end of [mystream.dats] *)

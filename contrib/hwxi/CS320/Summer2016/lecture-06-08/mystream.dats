(* ****** ****** *)

#include
"share/atspre_staload.hats"
#include
"share/HATS/atspre_staload_libats_ML.hats"

(* ****** ****** *)

staload "./../mylib/mylist.dats"

(* ****** ****** *)
//
(*
datatype
mystream(a:t@ype) =
  mystream_cons of (a, mystream(a))  
*)
//
datatype
mystream(a:t@ype) =
  mystream_cons of (() -<cloref1> $tup(a, mystream(a))) // thunk
//
(* ****** ****** *)

typedef ints = mystream(int)

(* ****** ****** *)
//
fun
from(n: int): ints =
  mystream_cons(lam() => $tup(n, from(n+1)))
//
(* ****** ****** *)
//
val xs = from(0)
val _(*ignored*) =
int_foldleft_cloref<ints>
  ( 10, xs
  , lam(xs, i) => let val+mystream_cons(fxs) = xs; val $tup(x, xs) = fxs() in println!(x); xs end
  )
//
(* ****** ****** *)

implement main0 () = ()

(* ****** ****** *)

(* end of [mystream.dats] *)

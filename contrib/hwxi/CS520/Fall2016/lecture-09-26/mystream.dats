(* ****** ****** *)
//
// HX: for teaching CS520, Fall, 2016
//
(* ****** ****** *)

#include
"share/atspre_staload.hats"
#include
"share/HATS/atspre_staload_libats_ML.hats"

(* ****** ****** *)

(*
extern
fun
ints_from(start: int): list0(int)
//
implement
ints_from(start) =
  list0_cons(start, ints_from(start+1))
//
*)

(* ****** ****** *)

extern
fun
ints_from(start: int): stream(int)

implement
ints_from(start) =
  $delay(stream_cons(start, ints_from(start+1)))

(* ****** ****** *)

val theNats = ints_from(0)

(* ****** ****** *)
//
val xs = theNats
//
val-stream_cons(x, xs) = !xs
val () = println!("x = ", x)
//
val-stream_cons(x, xs) = !xs
val () = println!("x = ", x)
val-stream_cons(x, xs) = !xs
val () = println!("x = ", x)
val-stream_cons(x, xs) = !xs
val () = println!("x = ", x)
val-stream_cons(x, xs) = !xs
val () = println!("x = ", x)
val-stream_cons(x, xs) = !xs
val () = println!("x = ", x)
val-stream_cons(x, xs) = !xs
val () = println!("x = ", x)
//
(* ****** ****** *)

val () = println! ("theNats[0] = ", theNats[0])
val () = println! ("theNats[1] = ", theNats[1])
val () = println! ("theNats[2] = ", theNats[2])
val () = println! ("theNats[1000] = ", theNats[1000])

(* ****** ****** *)

implement main0 () = ()

(* ****** ****** *)

(* end of [mystream.dats] *)

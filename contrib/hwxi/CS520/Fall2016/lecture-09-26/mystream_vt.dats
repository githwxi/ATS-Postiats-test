(* ****** ****** *)
//
// HX: for teaching CS520, Fall, 2016
//
(* ****** ****** *)

#include
"share/atspre_staload.hats"
#include
"share/HATS/atspre_staload_libats_ML.hats"

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
//
extern
fun
ints_from(start: int): stream_vt(int)

implement
ints_from(start) =
  $ldelay(stream_vt_cons(start, ints_from(start+1)))
//
(* ****** ****** *)

val theNats = ints_from(0)

(* ****** ****** *)
//
fun
foo
(
  xs: stream_vt(int)
) : void = let
//
val-
~stream_vt_cons(x, xs) = !xs
val () = println!("x = ", x)
val-
~stream_vt_cons(x, xs) = !xs
val () = println!("x = ", x)
val-
~stream_vt_cons(x, xs) = !xs
val () = println!("x = ", x)
//
in
  ~xs // = stream_vt_free(xs)
end // end of [foo]

(* ****** ****** *)

(*
val () = println! ("theNats[0] = ", theNats[0])
*)

(* ****** ****** *)

val () = foo(theNats)

(* ****** ****** *)

implement main0 () = ()

(* ****** ****** *)

(* end of [mystream_vt.dats] *)

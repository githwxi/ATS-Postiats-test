(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
#include
"share/HATS\
/atspre_staload_libats_ML.hats"
//
(* ****** ****** *)

extern
fun
from(i: int): stream(int)

(* ****** ****** *)

implement
from(i) =
$delay(stream_cons(i, from(i+1)))

(* ****** ****** *)

val theNats = from(0)

(* ****** ****** *)

val theNats_2 = stream_filter_cloref<int>(theNats, lam(x) => x % 2 = 0)
val theNats_3 = stream_filter_cloref<int>(theNats, lam(x) => x % 3 = 0)
val theNats_5 = stream_filter_cloref<int>(theNats, lam(x) => x % 5 = 0)

(* ****** ****** *)

val xs =
stream_map_cloref<int><int>(theNats_5, lam(x) => x * x)

val-
stream_cons(x, xs) = !xs
val () = println!("x = ", x)
val-
stream_cons(x, xs) = !xs
val () = println!("x = ", x)
val-
stream_cons(x, xs) = !xs
val () = println!("x = ", x)
val-
stream_cons(x, xs) = !xs
val () = println!("x = ", x)
val-
stream_cons(x, xs) = !xs
val () = println!("x = ", x)
val-
stream_cons(x, xs) = !xs
val () = println!("x = ", x)
val-
stream_cons(x, xs) = !xs
val () = println!("x = ", x)
val-
stream_cons(x, xs) = !xs
val () = println!("x = ", x)
val-
stream_cons(x, xs) = !xs
val () = println!("x = ", x)
val-
stream_cons(x, xs) = !xs
val () = println!("x = ", x)
val-
stream_cons(x, xs) = !xs
val () = println!("x = ", x)
val-
stream_cons(x, xs) = !xs
val () = println!("x = ", x)
val-
stream_cons(x, xs) = !xs
val () = println!("x = ", x)
val-
stream_cons(x, xs) = !xs
val () = println!("x = ", x)

(* ****** ****** *)

(*
val () = println! ("theNats[0] = ", theNats[0])
val () = println! ("theNats[1] = ", theNats[1])
val () = println! ("theNats[2] = ", theNats[2])
*)

(* ****** ****** *)

implement main0() = ()

(* ****** ****** *)

(* end of [mystream.dats] *)

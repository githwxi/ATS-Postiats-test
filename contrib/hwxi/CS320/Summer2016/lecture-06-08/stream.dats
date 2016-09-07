(* ****** ****** *)

#include
"share/atspre_staload.hats"
#include
"share/HATS/atspre_staload_libats_ML.hats"

(* ****** ****** *)

staload "./../mylib/mylist.dats"
staload "./../mylib/mystream.dats"

(* ****** ****** *)

(*
typedef ints = list0(int)
*)
typedef ints = stream(int)

(* ****** ****** *)
//
fun
from(n: int): ints =
  $delay(stream_cons(n, from(n+1)))
//
(* ****** ****** *)
//
val xs = from(0)
val _(*ignored*) =
int_foldleft_cloref<ints>
  (10, xs, lam(xs, i) => let val-stream_cons(x, xs) = !xs in println!(x); xs end)
//
(* ****** ****** *)
//
val xs = from(0)
val ys = mystream_map_cloref<int,int>(xs, lam x => x * x)
val _(*ignored*) = let
//
exception Finished
//
in
try
mystream_iforeach_cloref<int>
  (ys, lam(i, x) => if i < 10 then (println! x) else $raise Finished())
with ~Finished() => ((*void*))
//
end // end of [val]
//
(* ****** ****** *)
//
val xs = from(0)
val ys = mystream_filter_cloref<int>(xs, lam x => x % 2 = 0)
val _(*ignored*) = let
//
exception Finished2
//
in
try
mystream_iforeach_cloref<int>
  (ys, lam(i, x) => if i < 10 then (println! x) else $raise Finished2())
with ~Finished2() => ((*void*))
//
end // end of [val]
//
(* ****** ****** *)

implement main0 () = ()

(* ****** ****** *)

(* end of [stream.dats] *)

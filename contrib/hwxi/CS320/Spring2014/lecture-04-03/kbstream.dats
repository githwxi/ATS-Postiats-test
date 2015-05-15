(* ****** ****** *)

#include
"share/atspre_staload.hats"
#include
"share/HATS/atspre_staload_libats_ML.hats"

(* ****** ****** *)
  
fun fibgen
(
  r0: int, r1: int
) : stream (int) =
  $delay (stream_cons (r0, fibgen (r1, r0 + r1)))
      
(* ****** ****** *)

fun kbsgen
(
  // argumentless
) : stream(int) = $delay
(
let
//
val line =
fileref_get_line_string (stdin_ref)
//  
in
//
case+ line of
| "quit" => stream_nil ()
| _ => stream_cons (0, kbsgen ())
//
end
) (* end of [kbsgen] *)

(* ****** ****** *)

(*
val xs = kbsgen ()
val-stream_cons (_, xs) = !xs
val-stream_cons (_, xs) = !xs
*)

(* ****** ****** *)

val xs = fibgen (0, 1)
val ys = kbsgen ()
val zs = stream_map2_fun<int,int><int> (xs, ys, lam (x, y) => x)

(* ****** ****** *)

local
typedef tenv = int
implement
stream_foreach$fwork<int><tenv>
  (x, env) = let
  val n = env
  val () = env := n + 1
in
  println! ("fib(", n, ") = ", x)
end // end of [stream_foreach$fwork]
in
var env: tenv = 0
val () = stream_foreach_env<int><tenv> (zs, env)
end // end of [local]

(* ****** ****** *)

implement main0 () = ()

(* ****** ****** *)

(* end of [kbstream.dats] *)

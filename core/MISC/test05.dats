(*
** Testing prelude/grandom
*)

(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
//
staload
TIME = "libc/SATS/time.sats"
staload
STDLIB = "libc/SATS/stdlib.sats"
//
(* ****** ****** *)
//
implement
grandom_int<> () =
  $UNSAFE.cast{int}($STDLIB.random()) % 10
//
(* ****** ****** *)

val () = $STDLIB.srandom($UNSAFE.cast($TIME.time()))

(* ****** ****** *)
//
val xs = grandom_list<int>(10)
val ys = grandom_list<int>(20)
//
val () = println! ("xs = ", xs)
val () = println! ("ys = ", ys)
//
val () = assertloc(length(xs)+length(ys) = length(list_append(xs, ys)))
//
(* ****** ****** *)
//
typedef n = intBtw(0,10)
//
val ns = grandom_list<int>(10)
val ns = $UNSAFE.cast{List(n)}(ns)
//
val xss =
list_map_fun(ns, lam(n) => grandom_list_vt<int>(n))
val xs0 = list_vt_concat<int>(xss)
//
local
implement
list_foldleft$fopr<int><int>
  (acc, n) = acc + n
in
//
val ntot = list_foldleft<int><int>(ns, 0)
//
end // end of [local]
//
val () = assertloc(ntot = length(xs0))
//
val () = list_vt_free (xs0)
//
(* ****** ****** *)

implement main0() = ((*void*))

(* ****** ****** *)

(* end of [test05.dats] *)

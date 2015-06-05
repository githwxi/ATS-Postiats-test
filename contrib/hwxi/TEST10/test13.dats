(*
** HX: testing 'ifint(...)'
*)

(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
//
(* ****** ****** *)

stadef
mymax(m: int, n: int) = ifint(m >= n, m, n)

(* ****** ****** *)

fun
mymax{m,n:int}
(
  m: int m, n: int n
) : int(mymax(m,n)) = half(m+n+abs(m-n))

(* ****** ****** *)
//
implement
main0 () =
{
  val () = assertloc (mymax(~1, 1) = max(1, ~1))
}
//
(* ****** ****** *)

(* end of [test13.dats] *)

(*
** A simple example
** on dependent types
*)

(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
//
(* ****** ****** *)
//
extern
fun{a:t@ype}
list_length
  : {n:nat} list(a, n) -> int(n)
//
(* ****** ****** *)

implement
{a}(*tmp*)
list_length(xs) = let
//
fun
loop{i,j:nat}
(
  xs: list(a, i), j: int(j)
) : int(i+j) =
  case+ xs of
  | list_nil() => j
  | list_cons(_, xs) => loop(xs, j+1)
//
in
  loop(xs, 0)
end // end of [list_length]

(* ****** ****** *)
//
implement
main0 () =
assertloc
(
  list_length($list{int}(0,1,2,3,4,5,6,7,8,9)) = 10
) (* end of [main0] *)
//
(* ****** ****** *)

(* end of [list_length.dats] *)
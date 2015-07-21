(*
** Explicitly boxed types
*)

(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
//
(* ****** ****** *)

staload UN = $UNSAFE

(* ****** ****** *)
//
fun
list_length_boxed
  {a:type}{n:int}
  (xs: list(a, n)): int(n) = list_length<a> (xs)
//
(* ****** ****** *)
//
implement
main0() =
{
#define N 26
//
val xs1 =
list_tabulate_fun<ptr>
(
  N, lam(i) => $UN.int2ptr(i)
) (* end of [val] *)
val xs1 = list_vt2t(xs1)
//
val xs2 =
list_tabulate_fun<string>
(
  N, lam(i) => $UN.castvwtp0{string}(string_sing($UN.cast{charNZ}('A' + i)))
) (* end of [val] *)
val xs2 = list_vt2t(xs2)
//
val () = assertloc(list_length_boxed(xs1) = N)
val () = assertloc(list_length_boxed(xs2) = N)
//
} (* end of [main0] *)
//
(* ****** ****** *)

(* end of [test02.dats] *)

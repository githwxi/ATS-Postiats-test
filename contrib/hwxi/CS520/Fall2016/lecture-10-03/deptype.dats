(*
** Dependent types
*)

(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
//
(* ****** ****** *)

extern
fun
fact :
{i:nat} int(i) -> [r:int] int(r)

(* ****** ****** *)

implement
fact(x) =
if x > 0 then x * fact(x-1) else 1

(* ****** ****** *)
//
val
fact3 = fact(3)
//
// val
// fact_1 = fact(~1) // type-error
//
val
factfact3 = let
  val fact3 = fact(3)
  val ((*void*)) = assertloc (fact3 >= 0)
in
  println! ("fact(fact3) = ", fact(fact3))
end // end of [val]
//
(* ****** ****** *)

extern
fun
{a:t0ype}
mylist_length : {n:nat} list(a, n) -> int(n)

(* ****** ****** *)

implement
{a}(*tmp*)
mylist_length(xs) = let
//
fun
loop{i,j:nat}(xs: list(a, i), j: int(j)): int(i+j) =
(
case+ xs of
| list_nil() => j
| list_cons(_, xs) => loop(xs, j+1)
)
//
in
  loop(xs, 0)
end (* end of [mylist_length] *)

(* ****** ****** *)

implement
main0() = {
  val () = println! ("Hello from [deptype]!")
} (* end of [main0] *)

(* ****** ****** *)

(* end of [deptype.dats] *)

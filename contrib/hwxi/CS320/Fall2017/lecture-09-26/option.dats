#include
"share/atspre_staload.hats"
#include
"share/atspre_staload_libats_ML.hats"


(*
datatype
option(a:t@ype) =
  | None of ()
  | Some of (a)
*)
  
extern
fun
{a:t@ype}
list0_head_exn
  (xs: list0(a)): a

implement
{a}
list0_head_exn
  (xs) = let
//
val () =
assertloc(~list0_is_nil(xs))
//
in
  case- xs of list0_cons(x, _) => x
end
  

extern
fun
{a:t@ype}
list0_head_opt
  (xs: list0(a)): option0(a)

implement
{a}
list0_head_opt(xs) =
(
case+ xs of
| list0_nil() => None0()
| list0_cons(x, _) => Some0(x)
)

extern
fun
{a:t@ype}
list0_last_opt
  (xs: list0(a)): option0(a)

(*
implement
{a}
list0_last_opt(xs) =
(
case+ xs of
| list0_nil() => None0()
| list0_cons(x, xs) =>
  (
    case+ xs of
    | list0_nil() => Some0(x)
    | list0_cons _ => list0_last_opt<a>(xs)
  )
)
*)
implement
{a}
list0_last_opt(xs) = let
//
fun
loop(x0: a, xs: list0(a)): a =
(
case+ xs of
| list0_nil() => x0
| list0_cons(x1, xs) => loop(x1, xs)
)
//
in
  case+ xs of
  | list0_nil() => None0()
  | list0_cons(x0, xs) => Some0(loop(x0, xs))
end

(* ****** ****** *)

(*
val _ =
list0_head_exn<int>(list0_nil())
*)

(* ****** ****** *)

implement main0() = ()

(* ****** ****** *)

(* end of [option.dats] *)

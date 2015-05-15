//
// Can we
// have a cake and eat it?
//
(* ****** ****** *)
//
// A linear type
// is referred to as a viewtype
//
(*
absvtype
for
absviewtype
*)
absvtype cake

(* ****** ****** *)

extern
fun cake_make (): cake
extern
fun cake_eat(cake): void

(* ****** ****** *)

extern
fun
Can_have_cake_and_eat_it(cake): cake

// (*
//
// HX: the function is ill-typed
//
implement
Can_have_cake_and_eat_it(x0) =
  let val () = cake_eat(x0) in x0 end
// end of [Can_have_cake_and_eat_it]
//
// *)

(* ****** ****** *)

(* end of [cake.dats] *)

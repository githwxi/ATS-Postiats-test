(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
//
(* ****** ****** *)

staload "./lambda.sats"

(* ****** ****** *)

staload "libats/ML/SATS/basis.sats"
staload "libats/ML/SATS/list0.sats"

(* ****** ****** *)

assume context_type = list0 (vname)

(* ****** ****** *)

implement
context_find (ctx, x0) = let
//
fun loop
(
  xs: list0 (vname), i: int
) : Option(int) =
  case+ xs of
  | list0_nil () => None ()
  | list0_cons (x, xs) =>
      if x0 = x then Some{int}(i) else loop (xs, i+1)
    // end of [list0_cons]
//
in
  loop (ctx, 0)
end // end of [context_find]

(* ****** ****** *)

(* end of [lambda_context.dats] *)

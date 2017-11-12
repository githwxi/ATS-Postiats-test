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

typedef xv = @(vname, value)

(* ****** ****** *)

assume environ_type = list0 (xv)

(* ****** ****** *)

implement
environ_nil () = list0_nil ()

(* ****** ****** *)

implement
environ_find (env, x0) = let
//
fun loop
  (xvs: list0 (xv)): value =
//
case+ xvs of
| list0_cons
    (xv, xvs) =>
    if x0 = xv.0 then xv.1 else loop (xvs)
| list0_nil () => $raise UnboundVarExn(x0)
//
in
  loop (env)
end // end of [loop]

(* ****** ****** *)

implement
environ_extend
  (env, x, v) = list0_cons{xv}((x, v), env)
// end of [environ_extend]

(* ****** ****** *)

(* end of [lambda_environ.dats] *)

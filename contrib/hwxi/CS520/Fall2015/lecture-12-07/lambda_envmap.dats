(* ****** ****** *)
//
// Implement <envmap>
//
(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
//
(* ****** ****** *)

staload "./lambda.sats"

(* ****** ****** *)
//
assume
envmap_type =
  List0 @(vnam, value)
//
(* ****** ****** *)

implement
envmap_make_nil() = list_nil()

(* ****** ****** *)

implement
envmap_insert(map, x, v) = list_cons ((x, v), map)

(* ****** ****** *)

implement
envmap_search_opt
  (map, x0) = let
//
fun
loop:
$d2ctype
(
  envmap_search_opt
) = (
//
lam (xvs, x0) =>
(
case+ xvs of
  | nil() => None_vt()
  | cons(xv, xvs) => if x0 = xv.0 then Some_vt(xv.1) else loop(xvs, x0)
)  
//
) (* end of [loop] *)
//
in
  loop (map, x0)
end // end of [envmap_search_opt]

(* ****** ****** *)

(* end of [lambda_envmap.dats] *)

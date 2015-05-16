(*
** Implementing UTFPL
*)

(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
//
(* ****** ****** *)

staload "./utfpl.sats"

(* ****** ****** *)

val x = var_make "x"
val f = var_make "f"
val l = var_make "l"
val r = var_make "r"
val xs = var_make "xs"
val res = var_make "res"
val fopr = var_make "fopr"

(* ****** ****** *)
//
(*
intrange
*)
//
local

val
intrange =
TMfix
(
f,
TMlam
(
l,
TMlam
(
r,
TMcond
(
  TMilt(TMvar(l), TMvar(r))
, TMcons(TMvar(l), TMapp2 (TMvar(f), TMadd(TMvar(l), TMint(1)), TMvar(r))), TMnil()
)
)
)
)

in (* in-of-local *)

val () = bind0_cst ("intrange", eval0_cbval(comp0_fix(intrange)))

end // end of [local]
//
(* ****** ****** *)
//
(*
list_length
*)
//
local

val
list_length =
TMfix
(
f,
TMlam
(
xs,
TMcond
(
  TMiscons(TMvar(xs)), TMadd(TMint(1), TMapp(TMvar(f), TMcdr(TMvar(xs)))), TMint(0)
)
)
)

in (* in-of-local *)

val () = bind0_cst ("list_length", eval0_cbval(comp0_fix(list_length)))

end // end of [local]
//
(* ****** ****** *)

(*
val list_map = ...
*)

(* ****** ****** *)

(*

list_foldl(xs, res, fopr) =
  if iscons(xs) then list_foldl(cdr(xs), fopr(res, car(xs)), fopr) else res

list_foldr(xs, res, fopr) =
  if iscons(xs) then fopr(car(xs), list_foldr(cdr(xs), res, fopr)) else res

*)

(* ****** ****** *)

local

val
list_foldl =
TMfix
(
f,
TMlam
(
xs,
TMlam
(
res,
TMlam
(
fopr,
TMcond(
  TMiscons(TMvar(xs)),
  TMapp3(TMvar(f), TMcdr(TMvar(xs)), TMapp2(TMvar(fopr), TMvar(res), TMcar(TMvar(xs))), TMvar(fopr)),
  TMvar(res)
)
)
)
)
)

in (* in-of-local *)

val () = bind0_cst ("list_foldl", eval0_cbval(comp0_fix(list_foldl)))

end // end of [local]

(* ****** ****** *)

local

val
list_foldr =
TMfix
(
f,
TMlam
(
xs,
TMlam
(
res,
TMlam
(
fopr,
TMcond(
  TMiscons(TMvar(xs)),
  TMapp2(TMvar(fopr), TMcar(TMvar(xs)), TMapp3(TMvar(f), TMcdr(TMvar(xs)), TMvar(res), TMvar(fopr))),
  TMvar(res)
)
)
)
)
)

in (* in-of-local *)

val () = bind0_cst ("list_foldr", eval0_cbval(comp0_fix(list_foldr)))

end // end of [local]

(* ****** ****** *)

local

val
list_tally =
TMlam(xs, TMapp3(TMcst("list_foldl"), TMvar(xs), TMint(0), TMlam(res, TMlam(x, TMadd(TMvar(res), TMvar(x))))))

in (* in-of-local *)

val () = bind0_cst ("list_tally", eval0_cbval(list_tally))

end // end of [local]

(* ****** ****** *)

(* end of [utfpl_mylib.dats] *)

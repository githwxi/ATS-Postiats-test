(* ****** ****** *)
//
// HX: Optional values
//
(* ****** ****** *)
//
staload
"libats/ML/SATS/basis.sats"
//
(* ****** ****** *)

(*
datatype
option0 (a:t@ype) = Some0 of (a) | None0 (a)
*)

extern
fun{
a:t@ype
} mylist0_head_opt (xs: list0(a)): option0 (a)

implement
{a}(*tmp*)
mylist0_head_opt
  (xs) =
(
  case+ xs of
  | cons0 (x, _) => Some0 (x) | nil0 () => None0 ()
)

(* ****** ****** *)

implement main0 () = ()

(* ****** ****** *)

(* end of [option.dats] *)

(* ****** ****** *)

staload "libats/ML/SATS/basis.sats"
staload "libats/ML/SATS/list0.sats"

(* ****** ****** *)

extern
fun{
a,b:t@ype
} list0_cross (xs: list0(a), ys: list0(b)): list0 @(a, b)

(*
implement
{a,b}(*tmp*)
list0_cross (xs, ys) =
(
case+ xs of
| nil0 () => nil0 ()
| cons0 (x, xs) => let
    val res1 =
      list0_map<b><(a,b)> (ys, lam y => @(x, y))
    // end of [val]
  in
    list0_append (res1, list0_cross<a,b> (xs, ys))
  end // end of [cons0]
)
*)

implement
{a,b}(*tmp*)
list0_cross
  (xs, ys) = let
//
typedef ab = (a, b)
//
in
//
list0_concat<ab>
(
  list0_map<a><list0(ab)> (xs, lam x => list0_map<b><ab> (ys, lam y => (x,
  y)))
)
//
end // end of [list0_cross]

(* ****** ****** *)

implement main0 () = ()

(* ****** ****** *)

(* end of [list0_cross.dats] *)

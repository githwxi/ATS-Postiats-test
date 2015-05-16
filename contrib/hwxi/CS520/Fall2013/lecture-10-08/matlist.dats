(*
Matrix transpose
*)
(* ****** ****** *)

staload "libats/ML/SATS/basis.sats"
staload "libats/ML/SATS/list0.sats"

(* ****** ****** *)

typedef
matlist (a:t@ype) = list0 (list0 (a))

(* ****** ****** *)

extern
fun{a:t@ype}
matlist_transpose // 20 points
  (M: matlist (a), nrow: int, ncol: int): matlist (a)
// end of [matlist_transpose]

(* ****** ****** *)

implement{a}
matlist_transpose
  (xss, nrow, ncol) = let
//
fun uncons
(
  xss: matlist(a)
) : (list0(a), matlist(a)) =
//
case+ xss of
| list0_nil () => (list0_nil, list0_nil)
| list0_cons (xs, xss) => let
    val-list0_cons (x, xs) = xs
    val (hxs, txss) = uncons (xss)
  in
    (list0_cons{a}(x, hxs), list0_cons{list0(a)}(xs, txss))
  end // end of [list0_cons]
//
in
  if ncol > 0 then let
    val (hcol, tcol) = uncons (xss)
  in
    cons0{list0(a)}(hcol, matlist_transpose<a> (tcol, nrow, ncol-1))
  end else nil0() // end of [if]
end // end of [matlist_transpose]

(* ****** ****** *)

implement main() = 0

(* ****** ****** *)

(* end of [matlist.dats] *)

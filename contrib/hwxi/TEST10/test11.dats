(*
** HX:
** Code taken from jats-ug by master-q
*)

(* ****** ****** *)

#include "share/atspre_define.hats"
#include "share/atspre_staload.hats"

(* ****** ****** *)

staload UN = "prelude/SATS/unsafe.sats"

// Global value: macaddr
typedef struct_macaddr = @[int][6]
extern praxi addback_macaddr {l:addr} (pf: struct_macaddr @ l): void
local
  var _dat_macaddr: struct_macaddr // hide
in
  fun takeout_macaddr (): [l:addr] (struct_macaddr @ l | ptr l) =
  $UN.castvwtp0 (addr@_dat_macaddr)
end

implement
main0 () = {
  // 1st session
  val (pf | p) = takeout_macaddr ()
  val () = p->[0] := 1
  val () = p->[1] := 2
  val () = p->[2] := 3
  val () = p->[3] := 4
  val () = p->[4] := 5
  val () = p->[5] := 6
  prval () = addback_macaddr (pf)
  // 2nd session
  val (pf | p) = takeout_macaddr ()
  val () = println! ("macaddr = ", p->[0], p->[1], p->[2], p->[3], p->[4],
  p->[5])
  prval () = addback_macaddr (pf)
}

(* ****** ****** *)

(* end of [test11.dats] *)

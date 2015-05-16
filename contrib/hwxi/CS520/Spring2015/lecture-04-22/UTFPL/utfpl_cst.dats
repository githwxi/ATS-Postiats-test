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

implement
fprint_val<value> = fprint_value

(* ****** ****** *)

local

typedef
key = tcst and itm = value

in (* in-of-local *)

#include "libats/ML/HATS/myhashtblref.hats"

end // end of [local]

(* ****** ****** *)

local

val
mycstmap =
myhashtbl_make_nil(1024)

in (* in-of-local *)

(* ****** ****** *)

implement
eval0_cst (c) = let
//
val opt =
  myhashtbl_search(mycstmap, c)
//
in
//
case+ opt of
| ~Some_vt v => v
| ~None_vt _ => $raise UNSUPPORTED(c)
//
end // end of [eval0_cst]

(* ****** ****** *)
//
implement
bind0_cst (c, v_def) = let
  val opt =
    myhashtbl_insert(mycstmap, c, v_def)
  // end of [val]
in
  case+ opt of ~Some_vt _ => () | ~None_vt () => ()
end // end of [bind0_cst]
//
(* ****** ****** *)

end // end of [local]

(* ****** ****** *)

(* end of [utfpl_cst.dats] *)

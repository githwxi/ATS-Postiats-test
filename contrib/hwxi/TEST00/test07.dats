(*
** Testing
** libats/ML/HATS/myhashtblref
*)

(* ****** ****** *)
//
#include
"share/atspre_define.hats"
#include
"share/atspre_staload.hats"
#include
"share/HATS/atspre_staload_libats_ML.hats"
//
(* ****** ****** *)

staload UN = $UNSAFE

(* ****** ****** *)

local
//
typedef
key = int and itm = string
//
in (* in-of-local *)

#include "libats/ML/HATS/myfunmap.hats"

end // end of [local]

(* ****** ****** *)
//
val
mymap = myfunmap_make_nil()
//
val () = assertloc (mymap.size() = 0)
//
(* ****** ****** *)
//
var mymap = mymap
val-~None_vt() = mymap.insert(0, "0")
val-~None_vt() = mymap.insert(1, "1")
val-~None_vt() = mymap.insert(2, "2")
val-~None_vt() = mymap.insert(3, "3")
val-~None_vt() = mymap.insert(4, "4")
//
val ((*void*)) = assertloc (mymap.size() = 5)
//
(* ****** ****** *)

val ((*void*)) =
fprintln! (stdout_ref, "mymap = ", mymap)

(* ****** ****** *)
//
val
mymap_kxs = mymap.listize()
//
val ((*void*)) =
fprintln! (stdout_ref, "mymap_kxs = ", mymap_kxs)
//
(* ****** ****** *)
//
val-true = mymap.remove(0)
val-false = mymap.remove(0)
val-true = mymap.remove(1)
val-false = mymap.remove(1)
val-~Some_vt("2") = mymap.takeout(2)
val-~Some_vt("3") = mymap.takeout(3)
val-~Some_vt("4") = mymap.takeout(4)
//
val () = assertloc (mymap.size() = 0)
//
(* ****** ****** *)

implement main0 () = ()

(* ****** ****** *)

(* end of [test07.dats] *)

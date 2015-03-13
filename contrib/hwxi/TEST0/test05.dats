(*
** Testing
** libats/ML/HATS/myhashtblref
*)

(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
//
(* ****** ****** *)

staload UN = $UNSAFE

(* ****** ****** *)
//
staload "libats/SATS/hashfun.sats"
staload "libats/ML/SATS/hashtblref.sats"
//
implement
hash_key<int>
  (int) =
(
$UN.cast{ulint}
  (inthash_jenkins($UN.cast{uint32}(int)))
)
//
(* ****** ****** *)

local
//
typedef
key = int and itm = string
//
in (* in-of-local *)

#include "libats/ML/HATS/myhashtblref.hats"

end // end of [local]

(* ****** ****** *)
//
val
mymap = myhashtbl_make_nil(1000)
//
(* ****** ****** *)
//
val () =
  assertloc (mymap.size = 0)
val () =
  assertloc (mymap.capacity = 1000)
//
(* ****** ****** *)
//
val () = mymap.insert_any(0, "0")
val () = mymap.insert_any(1, "1")
val () = mymap.insert_any(2, "2")
val () = mymap.insert_any(3, "3")
val () = mymap.insert_any(4, "4")
//
val () = assertloc (mymap.size = 5)
//
(* ****** ****** *)
//
val () =
fprintln!
  (stdout_ref, "mymap = ", mymap)
//
(* ****** ****** *)
//
val mymap_kxs = mymap.listize1()
//
val () =
fprintln!
  (stdout_ref, "mymap_kxs = ", mymap_kxs)
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
val () = assertloc (mymap.size = 0)
//
(* ****** ****** *)

implement main0 () = ()

(* ****** ****** *)

(* end of [test05.dats] *)

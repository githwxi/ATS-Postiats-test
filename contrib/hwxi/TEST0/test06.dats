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

local
//
typedef elt = int
//
in (* in-of-local *)

#include "libats/ML/HATS/myfunset.hats"

end // end of [local]

(* ****** ****** *)
//
val
myset = myfunset_make_nil()
//
val () = assertloc (myset.size = 0)
//
(* ****** ****** *)
//
var myset = myset
//
(* ****** ****** *)
//
val-false = myset.insert(0)
val-(true) = myset.insert(0)
//
val-false = myset.insert(1)
val-(true) = myset.insert(1)
//
val-false = myset.insert(2)
val-(true) = myset.insert(2)
//
(* ****** ****** *)
//
val () = assertloc (myset.size() = 3)
//
(* ****** ****** *)

val () = assertloc (myset.is_member(0))
val () = assertloc (myset.is_member(1))
val () = assertloc (myset.is_member(2))
val () = assertloc (myset.isnot_member(3))
val () = assertloc (myset.isnot_member(4))
val () = assertloc (myset.isnot_member(5))

(* ****** ****** *)
//
val () =
fprintln! (stdout_ref, "myset = ", myset)
//
(* ****** ****** *)
//
val-true = myset.remove(0)
val-false = myset.remove(0)
//
val-false = myset.insert(3)
val-(true) = myset.insert(3)
//
(* ****** ****** *)
//
val xs = myset.listize()
//
val () =
fprintln! (stdout_ref, "myset = ", myset)
val () =
fprintln! (stdout_ref, "myset: xs = ", xs)
//
(* ****** ****** *)
//
val () =
myset.foreach()(lam(x) => println! ("x=", x))
//
(* ****** ****** *)

staload UN = $UNSAFE

(* ****** ****** *)

val () = let
//
var res: int = 0
val p_res = addr@res
//
fun
fwork
(
  x: int
) : void =
$UN.ptr0_set<int>
  (p_res, $UN.ptr0_get<int>(p_res)+x)
//
val ((*void*)) =
myfunset_foreach_cloref(myset, lam(x) => fwork(x))
//
in
  fprintln! (stdout_ref, "tally(myset) = ", res)
end // end of [val]

(* ****** ****** *)
//
val
myset2 = myfunset_nil()
//
var
myset2 = myset2
val-false = myset2.insert(4)
val-false = myset2.insert(5)
val-false = myset2.insert(6)
//
(* ****** ****** *)
//
val () = assertloc(myset = myset)
val () = assertloc(myset != myset2)
val () = assertloc(compare(myset, myset) = 0)
val () = assertloc(compare(myset, myset2) < 0)
val () = assertloc(compare(myset2, myset) > 0)
//
(* ****** ****** *)
//
val () = myset.union(myset2)
val () = myset.intersect(myset2)
//
val () = myset.differ(myset2)
val () = myset.symdiff(myset2)
//
(* ****** ****** *)
//
val () =
fprintln! (stdout_ref, "myset = ", myset)
//
(* ****** ****** *)
//
macdef int_t = TYPE{int}()
macdef tabulate = myfunset_tabulate_cloref
//
fun
fact(n:intGte(0)): int =
  (tabulate(n, lam(x) => x+1)).foldleft(int_t)(1, lam(res, x) => res*x)
//
(* ****** ****** *)

val () = println! ("fact(12) = ", fact(12))

(* ****** ****** *)

implement main0 () = ()

(* ****** ****** *)

(* end of [test06.dats] *)

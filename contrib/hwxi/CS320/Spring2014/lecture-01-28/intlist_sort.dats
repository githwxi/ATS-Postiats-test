(* ****** ****** *)
//
// HX-2014-01-23:
// Some list utility functions
//
(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
//
(* ****** ****** *)

#define ATS_DYNLOADFLAG 0

(* ****** ****** *)

staload "./intlist.sats"

(* ****** ****** *)

extern
fun insord (int, intlist): intlist

implement
intlist_sort (xs) =
(
if isneqz (xs) then
  insord (xs.head(), intlist_sort (xs.tail()))
else intlist_nil ()
)

implement
insord (x0, xs) =
(
//
if
isneqz(xs)
then let
  val x1 = xs.head()
in
  if x0 <= x1 then
    intlist_cons (x0, xs)
  else
    intlist_cons (x1, insord (x0, xs.tail()))
  // end of [if]
end // end of [then]
else intlist_cons (x0, intlist_nil ())
//
) (* end of [insort] *)

(* ****** ****** *)

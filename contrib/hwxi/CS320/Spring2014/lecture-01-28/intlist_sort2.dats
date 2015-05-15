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
intlist_sort2 (xs) = let
//
fun loop
  (xs: intlist, res: intlist): intlist =
  if isneqz (xs)
    then loop (xs.tail(), insord (xs.head(), res)) else res
  // end of [if]
//
in
  loop (xs, intlist_nil())
end // end of [intlist_sort2]

implement
insord (x0, xs) =
(
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
)

(* ****** ****** *)

(* ****** ****** *)
//
// HX: Braun trees
//
(* ****** ****** *)
//
datatype
brauntree
(a:t@ype, int) =
| bt_nil(a, 0)
| {nl,nr:nat |
   nl >= nr ; nr+1 >= nl
  } bt_cons(a, nl+1+nr) of
    (brauntree(a, nl), a, brauntree(a, nr))
//
(* ****** ****** *)

extern
fun
{a:t0ype}
brauntree_size{n:nat}(brauntree(a, n)): int(n)

(* ****** ****** *)

implement
{a}(*tmp*)
brauntree_size
  (t0) =
(
  case+ t0 of
  | bt_nil() => 0
  | bt_cons(tl, _, tr) =>
      brauntree_size(tl) + 1 + brauntree_size(tr)
    // end of [bt_cons]
)

(* ****** ****** *)

extern
fun
{a:t0ype}
brauntree_get_at{n,i:nat | i < n}(brauntree(a, n), int(i)): a

(* ****** ****** *)

implement
{a}
brauntree_get_at
  (t0, i) = let
//
val+bt_cons(tl, x0, tr) = t0
//
in
//
if
i = 0
then x0
else (
  if nmod(i, 2) > 0
    then brauntree_get_at(tl, half(i))
    else brauntree_get_at(tr, half(i)-1)
  // end of [if]
) (* end of [else] *)
//
end // end of [brauntree_get_at]

(* ****** ****** *)

(* end of [brauntree.dats] *)

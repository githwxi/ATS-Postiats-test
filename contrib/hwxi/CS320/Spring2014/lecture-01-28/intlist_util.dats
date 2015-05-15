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

staload "./intlist.sats"

(* ****** ****** *)

implement
fprint_intlist
  (out, xs) = let
//
fun loop
  (xs: intlist, i: int): void =
  if isneqz(xs) then let
    val () =
    if i > 0 then fprint (out, "; ")
    val () = fprint (out, xs.head())
  in
    loop (xs.tail(), i+1)
  end else () // end of [if]
//
in
  loop (xs, 0)
end // end of [fprint_intlist]

(* ****** ****** *)

(*
implement
intlist_length (xs) =
  if isneqz (xs)
    then 1 + intlist_length (xs.tail) else 0
  // end of [if]
// end of [intlist_length]
*)
implement
intlist_length (xs) = let
//
fun loop (xs: intlist, res: int): int =
  if isneqz (xs) then loop (xs.tail(), res+1) else res
//
in
  loop (xs, 0)
end // end of [intlist]

(* ****** ****** *)

implement
intlist_nth (xs, n) =
(
if n > 0
  then intlist_nth (xs.tail(), n-1) else xs.head()
)  
(* ****** ****** *)

implement
intlist_append
  (xs, ys) = let
in
  if isneqz (xs) then
    intlist_cons (xs.head(), intlist_append (xs.tail(), ys))
  else ys // end of [if]
end // end of [intlist_append]

(* ****** ****** *)

implement
intlist_is_ordered (xs) = let
//
fun loop
  (x: int, xs: intlist): bool =
  if isneqz (xs)
    then let
      val x1 = xs.head()
    in
      if x <= x1 then loop (x1, xs.tail()) else false
    end // end of [then]
    else true
  // end of [if]
//
in
  if isneqz(xs) then loop (xs.head(), xs.tail()) else true
end // end of [intlist_isordered]

(* ****** ****** *)

(* end of [intlist_util.dats] *)

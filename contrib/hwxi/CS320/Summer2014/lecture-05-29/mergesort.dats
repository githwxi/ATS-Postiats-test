
abstype mylist

extern
fun mergesort : mylist -> mylist

extern
fun length : mylist -> int

extern
fun split : mylist -> (mylist, mylist)

extern
fun merge : (mylist, mylist) -> mylist

(*
implement
mergesort (xs) = let
  val (xs1, xs2) = split (xs)
  val ys1 = mergesort (xs1)
  and ys2 = mergesort (xs2)
in
  merge (ys1, ys2)
end // end of [mergesort]
*)

implement
mergesort (xs) = let
  val n = length (xs)
in
  if n >= 2 then let
    val (xs1, xs2) = split (xs)
    val ys1 = mergesort (xs1)
    and ys2 = mergesort (xs2)
  in
    merge (ys1, ys2)
  end else (xs) // end of [if]
end // end of [mergesort]





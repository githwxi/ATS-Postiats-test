//
// Code used during Lecture-09-12
//

(* ****** ****** *)

fun tally (n: int): int =
  if n > 0 then n + tally (n-1) else 0

(* ****** ****** *)

fun tally2 (n: int, res: int): int =
  if n > 0 then tally2 (n-1, n + res) else res

(* ****** ****** *)

(* end of [tailrec.dats] *)

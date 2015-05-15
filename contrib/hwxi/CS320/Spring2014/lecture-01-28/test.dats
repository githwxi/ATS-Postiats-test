(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
//
(* ****** ****** *)

staload "./intlist.sats"

(* ****** ****** *)

(*
dynload "./intlist.sats"
*)
dynload "./intlist.dats"
dynload "./intlist_util.dats"

(* ****** ****** *)

val digits = (
  0::1::2::3::4::5::6::7::8::9::nil()
) (* end of [val] *)

(* ****** ****** *)

fun fromTo (i: int, n: int): intlist =
  if i < n then i :: fromTo (i+1, n) else nil()

(* ****** ****** *)

val () = fprint (stdout_ref, "digits = ")
val () = fprint_intlist (stdout_ref, digits)
val () = fprint_newline (stdout_ref)

(* ****** ****** *)

val digits2 = fromTo (0, 10)
val () = fprint (stdout_ref, "digits2 = ")
val () = fprint_intlist (stdout_ref, digits2)
val () = fprint_newline (stdout_ref)

(* ****** ****** *)

val () = assertloc (intlist_nth (digits, 5) = 5)

(* ****** ****** *)

val () = assertloc (length(digits) = 10)
val () = assertloc (intlist_is_ordered(digits) = true)

(* ****** ****** *)
//
val xs = 1 :: 3 :: 4 :: 2 :: 5 :: 0 :: nil()
//
val xs_sorted = intlist_sort (xs)
val xs_sorted2 = intlist_sort2 (xs)
//
val () = fprint (stdout_ref, "xs_sorted = ")
val () = fprint_intlist (stdout_ref, xs_sorted)
val () = fprint_newline (stdout_ref)
//
val () = fprint (stdout_ref, "xs_sorted2 = ")
val () = fprint_intlist (stdout_ref, xs_sorted2)
val () = fprint_newline (stdout_ref)
//
(* ****** ****** *)

implement
main0 () =
{
  val () = println! ("Congrats: Testing is done successfully!")
}

(* ****** ****** *)

(* end of [test.dats] *)

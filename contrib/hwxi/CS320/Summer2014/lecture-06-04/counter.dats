(*
** A simple counter
*)

(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
//
(* ****** ****** *)
//
abstype counter = ptr
//
extern
fun counter_create (): counter
and counter_get (counter): int
and counter_incby1 (counter): void
and counter_reset (counter): void
//
(* ****** ****** *)

assume counter = ref(int)

(* ****** ****** *)

implement
counter_create
(
// argumentless
) =  ref_make_elt<int> (0)

(* ****** ****** *)

implement
counter_get (cntr) = !cntr

implement
counter_incby1 (cntr) = !cntr := !cntr + 1

implement
counter_reset (cntr) = !cntr := 0

(* ****** ****** *)

implement
main0 () =
{
//
val counter = counter_create ()
val () = println! ("counter_get(counter) = ", counter_get (counter))
val () = counter_incby1 (counter)
val () = println! ("counter_get(counter) = ", counter_get (counter))
val () = counter_incby1 (counter)
val () = println! ("counter_get(counter) = ", counter_get (counter))
val () = counter_reset (counter)
val () = println! ("counter_get(counter) = ", counter_get (counter))
//
} (* end of [main0] *)
                
(* ****** ****** *)

(* end of [counter.dats] *)

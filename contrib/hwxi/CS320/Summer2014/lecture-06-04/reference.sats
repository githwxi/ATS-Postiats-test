(*
** A reference is an array of size one
*)

(* ****** ****** *)
//
// This is a minimal interface for references
//
(* ****** ****** *)

fun{a:t@ype}
ref_make_elt (x: a): ref (a)

fun{a:t@ype} ref_get (r: ref(a)): a
fun{a:t@ype} ref_set (r: ref(a), x: a): void

(* ****** ****** *)

(* end of [reference.sats] *)

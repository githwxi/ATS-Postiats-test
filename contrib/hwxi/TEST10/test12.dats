(*
** HX:
** Code taken from jats-ug by master-q
*)

(* ****** ****** *)

(* File: test_template.dats *)

#include "share/atspre_staload.hats"

extern fun{} plus1: () -> int
extern fun{} call_plus1: () -> int

implement{} plus1 () = 0 + 1                (* default implementation *)
implement{} call_plus1 () = plus1 ()

implement main0 () = {
  val () = println! (call_plus1 ())         (* => 1 *)
  val v = 10
  val () = let implement{} plus1 () = v + 1 (* local implementation *)
           in println! (call_plus1 ()) end  (* => 11 *)
}

(* ****** ****** *)

(* end of [test12.dats] *)

(*
** Implementing UTLC
*)

(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
//
(* ****** ****** *)

staload "./utlc.sats"

(* ****** ****** *)
//
val () =
println!
(
  "Hello from UTLC!"
) (* end of [val] *)
//
dynload "./utlc_var.dats"
dynload "./utlc_term.dats"
dynload "./utlc_eval.dats"
dynload "./utlc_test.dats"
//
(* ****** ****** *)

implement main0 () = ()

(* ****** ****** *)

(* end of [utlc.dats] *)

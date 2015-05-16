(*
** Implementing UTFPL
*)

(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
//
(* ****** ****** *)

staload "./utfpl.sats"

(* ****** ****** *)
//
val () =
println!
  ("Hello from UTFPL!")
//
(* ****** ****** *)
//
dynload "./utfpl_var.dats"
dynload "./utfpl_cst.dats"
dynload "./utfpl_term.dats"
dynload "./utfpl_value.dats"
dynload "./utfpl_comp.dats"
dynload "./utfpl_eval.dats"
//
dynload "./utfpl_mylib.dats"
//
dynload "./utfpl_mytest.dats"
//
(* ****** ****** *)

implement main0 () = ()

(* ****** ****** *)

(* end of [utfpl.dats] *)

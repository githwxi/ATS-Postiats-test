(*
** HX-2015-08-30:
** For testing mixed records
*)

(* ****** ****** *)
//
#include
"share/atspre_define.hats"
#include
"share/atspre_staload.hats"
#include
"share/HATS/atspre_staload_libats_ML.hats"
//
(* ****** ****** *)

staload
UN = "prelude/SATS/unsafe.sats"

(* ****** ****** *)
//
val
state = gvhashtbl_make_nil(16)
//
(* ****** ****** *)
//
val () =
  state["test_arg1"] := GVint(1)
//
val () =
  state["test_arg2"] := GVint(2)
//
(* ****** ****** *)
//
val () =
  state["passwd_passed"] := GVbool(false)
//
(* ****** ****** *)
//
val-GVint(1) = state["test_arg1"]
val-GVint(2) = state["test_arg2"]
//
val-GVbool(false) = state["passwd_passed"]
//
(* ****** ****** *)
//
val-GVint(1) =
  gvhashtbl_exch_atkey(state, "test_arg1", GVint(2))
val-GVint(2) =
  gvhashtbl_exch_atkey(state, "test_arg1", GVint(1))
//
(* ****** ****** *)

implement main0() = ()

(* ****** ****** *)

(* end of [test10.dats] *)

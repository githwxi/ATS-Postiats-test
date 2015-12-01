(*
** HX-2015-08-30:
** For testing mixed records
*)

(* ****** ****** *)

vtypedef
foo_vt(l:addr) =
@{
  pf0= int @ l | ptr= ptr l
} (* end of [foo_vt] *)

(* ****** ****** *)

fun
bar{l:addr}
(
  x: &foo_vt(l)
) : void = () where
{
//
  val x_ptr = x.ptr
  val () = x.ptr := x_ptr
//
  prval x_pf0 = x.pf0
  prval () = x.pf0 := x_pf0
}

(* ****** ****** *)

implement main0() = ()

(* ****** ****** *)

(* end of [test09.dats] *)

(*
HX-2017-02-06:
I cannot make it work, either:
https://mail.google.com/mail/u/0/#inbox/15a13eb6c6a36e23
*)

(* ****** ****** *)

#include "share/atspre_define.hats"
#include "share/atspre_staload.hats"

(* ****** ****** *)


vtypedef X = @{
  a= int,
  b= int
}

fun
get_b_ref
{l:agz} .<>.
(
pfX: X @ l | x: ptr l
) :<>
[l2:agz]
( int @ l2
, int @ l2 -<lin> X @ l
| ptr l2 
) = let
  val addr_x_b = addr@(x->b)
in
  $UNSAFE.castvwtp0((pfX | addr_x_b))
end // end of [get_b_ref]

(* ****** ****** *)

implement
main0((*void*)) = let
  var x: X = @{ a=1, b=2 }
  val (pf, pff | p) = get_b_ref(view@ x | addr@ x)
  val _ = !p := 3
  prval () = view@ x := pff(pf)
in
  println!("x.b = ", x.b)
end // end of [main0]

(* ****** ****** *)

(* end of [test13.dats] *)

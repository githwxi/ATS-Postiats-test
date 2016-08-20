(* ****** ****** *)

(*
//
The code is taken from:
https://groups.google.com/forum/#!topic/ats-lang-users/yCU3FHaEzm0
//
*)

(* ****** ****** *)

#include "share/atspre_define.hats"
#include "share/atspre_staload.hats"

%{^
struct foo {
  int a;
  int *p;
};
struct foo foo_var;
%}

absvt@ype struct_foo
vtypedef struct_foo_impl = $extype_struct"struct foo" of {
  a = int,
  p = ptr
}

vtypedef pstruct_foo = [l:addr] (struct_foo@l | ptr(l))

assume struct_foo = struct_foo_impl
macdef takeout_pstruct_foo = $extval(pstruct_foo, "&foo_var")
extern praxi addback_pstruct_foo (pstruct_foo): void

implement main0 () = {
  val (pf | pfoo) = takeout_pstruct_foo
//
  val () = println! !pfoo.a
  val () = !pfoo.a := 1
  val () = println! !pfoo.a
//
  var x0: int = 10
//
  val () = println! !pfoo.p
  val () = !pfoo.p := addr@(x0)
  val () = println! !pfoo.p // some addr
  val () = println! !(!pfoo.p) // print 10
//
  prval () = addback_pstruct_foo @(pf | pfoo)
}

(* ****** ****** *)

(* end of [test39.dats] *)

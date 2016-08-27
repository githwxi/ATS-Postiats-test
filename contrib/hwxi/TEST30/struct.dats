#include "share/atspre_define.hats"
#include "share/atspre_staload.hats"

staload UN = "prelude/SATS/unsafe.sats"

%{^
struct foo;
struct bar {
  int x;
  struct foo *p;
};
struct foo {
  int x;
  struct bar *p;
};


int
struct_foo_ptr_get_x (struct foo *obj) { return obj->x ; }
int
struct_bar_ptr_get_x (struct bar *obj) { return obj->x ; }

%}

absvtype struct_foo_ptr = ptr
absvtype struct_bar_ptr = ptr

(* ****** ****** *)

vtypedef
struct_foo = $extype_struct
"struct foo" of
{
  x= int
, p= struct_bar_ptr
}

vtypedef
struct_bar = $extype_struct
"struct bar" of
{
  x= int
, p= struct_foo_ptr
}

(* ****** ****** *)

extern
fun
struct_foo_ptr_get_x
  : (!struct_foo_ptr) -> int = "mac#"
extern
fun
struct_bar_ptr_get_x
  : (!struct_bar_ptr) -> int = "mac#"

(* ****** ****** *)

overload .x with struct_foo_ptr_get_x
overload .x with struct_bar_ptr_get_x

(* ****** ****** *)

implement
main0 () = {
//
  var vfoo : struct_foo
  var vbar : struct_bar
//
  val () = vfoo.x := 0
  val () =
  vfoo.p := $UN.castvwtp0{struct_bar_ptr}(addr@vbar)
//
  val () = vbar.x := 1
  val () =
  vbar.p := $UN.castvwtp0{struct_foo_ptr}(addr@vfoo)
//
  val () = println! vfoo.x
  val () = println! ((vfoo.p).x())
//
  val () = println! vbar.x
  val () = println! ((vbar.p).x())
//
  prval () = $UN.cast2void(vfoo.p)
  prval () = $UN.cast2void(vbar.p)
//
} (* end of [main0] *)

(* ****** ****** *)

(* end of [struct.dats] *)

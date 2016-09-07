(* ****** ****** *)

#include
"share/atspre_staload.hats"
#include
"share/HATS/atspre_staload_libats_ML.hats"

(* ****** ****** *)

staload "./../mylib/mylist.dats"

(* ****** ****** *)

val () = (50).foreach()(lam(i) => print("*"))
val () = print_newline()

(* ****** ****** *)

extern
fun
mul_int_string (n: int, s: string): string
//
implement
mul_int_string(n, s) =
  int_foldleft_cloref<string>(n, "", lam(res, i) => s + res)
//
overload * with mul_int_string
//
(* ****** ****** *)

implement main0() = println! (3 * "Hello")

(* ****** ****** *)

(* end of [intrange.dats] *)

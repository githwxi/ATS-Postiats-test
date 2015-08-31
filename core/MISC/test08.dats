(*
** HX-2015-08-30:
** For testing $d2ctype
*)

(* ****** ****** *)
//
// How to compile and test: 
// patscc -DATS_MEMALLOC_LIBC -o test08 test08.dats && ./test08
//
(* ****** ****** *)

#include "share/atspre_define.hats"
#include "share/atspre_staload.hats"

(* ****** ****** *)
//
extern
fun{a:t@ype}
list_revappend
  : {m,n:nat} (list(a, m), list(a, n)) -> list(a, m+n)
//
(* ****** ****** *)

implement
{a}(*tmp*)
list_revappend
  (xs, ys) = loop(xs, ys) where
{
//
fun loop: $d2ctype(list_revappend<a>) =
  lam (xs, ys) => (case+ xs of list_nil() => ys | list_cons(x, xs) => loop(xs, list_cons(x, ys)))
//
} (* end of [list_revappend] *)

(* ****** ****** *)

val xs = cons(1, cons(2, cons(3, nil{int}())))
val ys = list_revappend<int>(xs, list_nil(*void*))
val zs = list_revappend<int>(ys, list_nil(*void*))

(* ****** ****** *)

implement main0() = assertloc(list_equal<int>(xs, zs))

(* ****** ****** *)

(* end of [test08.dats] *)

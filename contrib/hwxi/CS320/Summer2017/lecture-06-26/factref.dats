(* ****** ****** *)

#include
"share/atspre_staload.hats"
#include
"share/HATS/atspre_staload_libats_ML.hats"

(* ****** ****** *)
(*
** Abusing references
*)
(* ****** ****** *)
//
// This is inefficient
// both memory-wise and time-wise.
//
(*
fun
fact
(n: int): int = let
//
val i0 = ref<int>(0)
val res = ref<int>(1)
//
fun
loop(): void = let
  val i = ref_get_elt(i0)
  val r = ref_get_elt(res)
in
  if i < n then
    (ref_set_elt(res, r * i); ref_set_elt(i0, i+1); loop())
  // end of [if]
end // end of [loop]
//
in
  loop(); ref_get_elt(res)
end // end of [fact]
*)
extern
fun
fact(n: int): int
//
implement
fact(n) = let
//
val i0 = ref<int>(0)
val res = ref<int>(1)
//
fun
loop(): void = let
  val i = !i0
  val r = !res
in
  if i < n then
    (!res := r * (i+1); !i0 := i+1; loop())
  // end of [if]
end // end of [loop]
//
in
  loop(); !res
end // end of [fact]

(* ****** ****** *)

implement
main0() = println! ("fact(10) = ", fact(10))

(* ****** ****** *)

(* end of [factref.dats] *)


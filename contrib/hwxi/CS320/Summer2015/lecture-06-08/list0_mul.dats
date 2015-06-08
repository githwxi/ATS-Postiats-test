//
#include
"share/atspre_staload.hats"
//
#include
"share/HATS/atspre_staload_libats_ML.hats"
//
(* ****** ****** *)

extern
fun list0_mul1 (list0(int)): int

(* ****** ****** *)

implement
list0_mul1 (xs) =
(
case+ xs of
| nil0 () => 1
| cons0 (x, xs) => x * list0_mul1(xs)
)

(* ****** ****** *)

extern
fun list0_mul2 (list0(int)): int

(* ****** ****** *)

implement
list0_mul2 (xs) =
(
case+ xs of
| nil0 () => 1
| cons0 (x, xs) =>
    if x = 0
      then 0
      else let
        val r = list0_mul2(xs)
        val () = println! ("list0_mul2: computing x(", x, ") * r(", r, ")")
      in
        x * r
      end // end of [else]
  // end of [cons0]
)

(* ****** ****** *)

extern
fun list0_mul3 (list0(int)): int

(* ****** ****** *)

implement
list0_mul3 (xs) = let
//
exception ZERO of ()
//
fun
aux
(
  xs: list0(int)
) : int =
case+ xs of
| nil0 () => 1
| cons0 (x, xs) =>
    if x = 0
      then $raise ZERO()
      else let
        val r = aux(xs)
        val () = println! ("list0_mul3: aux: computing x(", x, ") * r(", r, ")")
      in
        x * aux(xs)
      end // end of [else]
    // end of [if]
  // end of [cons0]
//
in
//
(
try
//
aux(xs)
//
with
| ~ZERO() => (println! ("ZERO() is caught!"); 0)
)
//
end // end of [list0_mul3]

(* ****** ****** *)
//
val xs =
  list0_make_intrange(1, 1000000)
//
val xs = list0_insert_at_exn(xs, 10, 0)
//
(* ****** ****** *)

val ans = list0_mul2(xs)
val ans = list0_mul3(xs)

(* ****** ****** *)

implement main0 () = ()

(* ****** ****** *)

(* end of [list0_mul.dats] *)

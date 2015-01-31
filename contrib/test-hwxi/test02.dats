(*
** Various styles of
** function implementation
*)

(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
//
(* ****** ****** *)
//
dataprop
FACT(int, int) =
| FACTbas (0, 1) of ()
| {n:pos}{r1:int}
  FACTind (n, n*r1) of FACT (n-1, r1)
//
(* ****** ****** *)
//
(*
** HX-2015-01-27:
** This [withtype] syntax orginates from
** the early days of DML!
*)
fun
fact(n) =
(
case n of
| 0 => (FACTbas() | 1)
| _ =>> let
    val pfr1 = fact(n-1)
  in
    (FACTind(pfr1.0) | n * pfr1.1)
  end // end of [n > 0]
)
withtype
{n:nat} int(n) -> [r:int] (FACT(n, r) | int(r))
//  
val () =
  assertloc((fact(10)).1 = 1*2*3*4*5*6*7*8*9*10)
//
(* ****** ****** *)
//
val fact2 =
  fix f(x:int):int => if x > 0 then x*f(x-1) else 1
//
val () = assertloc (fact2(10) = 1*2*3*4*5*6*7*8*9*10)
//
(* ****** ****** *)
//
val
rec fact3: int -> int =
  lam (x) => if x > 0 then x*fact3(x-1) else 1
//
val () = assertloc (fact3(10) = 1*2*3*4*5*6*7*8*9*10)
//
(* ****** ****** *)
//
val
fact4 = ref<int->int>($UNSAFE.cast(0))
val () =
!fact4 :=
(
  lam (x:int):int => if x > 0 then x * !fact4(x-1) else 1
) (* end of [val] *)
//
val () = assertloc (!fact4(10) = 1*2*3*4*5*6*7*8*9*10)
//
(* ****** ****** *)

implement main0 () = ()

(* ****** ****** *)

(* end of [test02.dats] *)

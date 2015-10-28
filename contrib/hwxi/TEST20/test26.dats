(*
//
// HX-2015-10-27:
// Testing syntax for statics
// that is of higher-order style
//
*)

(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
//
(* ****** ****** *)

typedef
intsub(p:int->bool) = [i:int | p(i)] int(i)

(* ****** ****** *)

stadef
intBtwe(i:int, j:int) =
  lam (a:int): bool => (i <= a && a <= j)
typedef
intBtwe(i:int, j:int) = intsub(intBtwe(i, j))
typedef
intBtwe2(i1:int, j1:int, i2:int, j2:int) =
  intsub(lam(a) => intBtwe(i1, j1)(a) || intBtwe(i2, j2)(a))

(* ****** ****** *)

typedef hex = intBtwe2(0x30, 0x39, 0x41, 0x46)

(* ****** ****** *)

fun
int2hex
  (i:int): hex = let
  val i = g1ofg0(i)
  val _0_ = 0x30 and _9_ = 0x39
  val _A_ = 0x41 and _F_ = 0x46
in
  if i < _0_
    then _0_
    else (
      if i > _9_
        then (if i < _A_ then _0_ else (if i > _F_ then _0_ else i)) else i
      // end of [if]
    ) (* else *)
end // end of [int2hex]

(* ****** ****** *)

implement
main0 () =
{
//
val a = char2int0('0')
val b = char2int0('1')
val A = char2int0('A')
val B = char2int0('B')
val C = char2int0('C')
val D = char2int0('D')
val E = char2int0('E')
val F = char2int0('F')
val G = char2int0('G')
val () = assertloc(int2hex(a) = a)
val () = assertloc(int2hex(b) = b)
val () = assertloc(int2hex(A) = A)
val () = assertloc(int2hex(B) = B)
val () = assertloc(int2hex(G) = 0x30)
//
} (* end of [main0] *)

(* ****** ****** *)

(* end of [test26.dats] *)

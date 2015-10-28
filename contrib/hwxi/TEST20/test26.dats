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

typedef hex = intBtwe2('0', '9', 'A', 'F')

(* ****** ****** *)

fun
int2hex
  (i:int): hex = let
  val i = g1ofg0(i)
  val _0_ = char2int1('0')
  and _9_ = char2int1('9')
  val _A_ = char2int1('A')
  and _F_ = char2int1('F')
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
val _0_ = char2int1('0')
val _1_ = char2int1('1')
val _A_ = char2int1('A')
val _B_ = char2int1('B')
val _C_ = char2int1('C')
val _D_ = char2int1('D')
val _E_ = char2int1('E')
val _F_ = char2int1('F')
val _G_ = char2int1('G')
val () = assertloc(int2hex(_0_) = _0_)
val () = assertloc(int2hex(_1_) = _1_)
val () = assertloc(int2hex(_A_) = _A_)
val () = assertloc(int2hex(_B_) = _B_)
val () = assertloc(int2hex(_G_) = _0_)
//
} (* end of [main0] *)

(* ****** ****** *)

(* end of [test26.dats] *)

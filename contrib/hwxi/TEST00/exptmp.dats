(*
**
** Expression Templates
** Based on the article:
** http://www.angelikalanger.com/Articles/Cuj/ExpressionTemplates/ExpressionTemplates.htm
**
** Author: Artyom Shalkhakov
** Date: Mar 14, 2015
** License: Public Domain
**
*)

(*
** Rewriting
** Author: Hongwei Xi
** Start Date: Mar 14, 2015
** License: Public Domain
*)

(* ****** ****** *)
//
// How to compile and test:
// patscc -o exptmp exptmp.dats && ./exptmp
//
(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
//
(* ****** ****** *)

typedef Eide_() = int
typedef Ecst_() = double
typedef Eadd_(E1:t@ype, E2:t@ype) = @(E1, E2)
typedef Esub_(E1:t@ype, E2:t@ype) = @(E1, E2)
typedef Emul_(E1:t@ype, E2:t@ype) = @(E1, E2)
typedef Ediv_(E1:t@ype, E2:t@ype) = @(E1, E2)

(* ****** ****** *)

abst@ype Eide() = Eide_()
abst@ype Ecst() = Ecst_()
abst@ype Eadd(E1:t@ype, E2:t@ype) = Eadd_(E1, E2)
abst@ype Esub(E1:t@ype, E2:t@ype) = Esub_(E1, E2)
abst@ype Emul(E1:t@ype, E2:t@ype) = Emul_(E1, E2)
abst@ype Ediv(E1:t@ype, E2:t@ype) = Ediv_(E1, E2)

(* ****** ****** *)
//
extern
fun{} Eide(): Eide()
extern
fun{} Ecst(x: double): Ecst()
//
macdef Eint(x) = Ecst(g0i2f(,(x)))
//
(* ****** ****** *)

extern
fun{E1,E2:t@ype} Eadd(INV(E1), INV(E2)): Eadd(E1, E2)
extern
fun{E1,E2:t@ype} Esub(INV(E1), INV(E2)): Esub(E1, E2)
extern
fun{E1,E2:t@ype} Emul(INV(E1), INV(E2)): Emul(E1, E2)
extern
fun{E1,E2:t@ype} Ediv(INV(E1), INV(E2)): Ediv(E1, E2)

(* ****** ****** *)
//
extern
fun{E:t@ype}
eval (expr: &INV(E)): double
//
(* ****** ****** *)

local

assume Eide() = Eide_()
assume Ecst() = Ecst_()
assume Eadd(E1:t@ype, E2:t@ype) = Eadd_(E1, E2)
assume Esub(E1:t@ype, E2:t@ype) = Esub_(E1, E2)
assume Emul(E1:t@ype, E2:t@ype) = Emul_(E1, E2)
assume Ediv(E1:t@ype, E2:t@ype) = Ediv_(E1, E2)

in (* in-of-local *)
//
implement{} Eide() = 0
implement{} Ecst(x) = x
implement{E1,E2} Eadd(E1, E2) = @(E1, E2)
implement{E1,E2} Esub(E1, E2) = @(E1, E2)
implement{E1,E2} Emul(E1, E2) = @(E1, E2)
implement{E1,E2} Ediv(E1, E2) = @(E1, E2)
//
implement
eval<Ecst()> (x) = x
//
implement
(E1,E2)
eval<Eadd(E1,E2)> (x) = eval<E1>(x.0) + eval<E2>(x.1)
//
implement
(E1,E2)
eval<Esub(E1,E2)> (x) = eval<E1>(x.0) - eval<E2>(x.1)
//
implement
(E1,E2)
eval<Emul(E1,E2)> (x) = eval<E1>(x.0) * eval<E2>(x.1)
//
implement
(E1,E2)
eval<Ediv(E1,E2)> (x) = eval<E1>(x.0) / eval<E2>(x.1)
//
end // end of [local]

(* ****** ****** *)

fun
{E:t@ype}
integrate
(
  E: &INV(E)
, l0: double, r0: double, n: intGte(1)
) : double = let
//
var sum: double = 0.0
//
val step: double = (r0-l0) / n
//
fun
loop
(
  pf: !double@sum >> _ | E: &E, i0: double
) : void = let
//
implement
eval<Eide()> (x) = i0
//
in
//
if
i0 < r0
then let
//
val () =
  sum := sum + eval(E)
//
in
  loop (pf | E, i0 + step)
end // end of [then]
else () // end of [else]
//
end // end of [loop]
//
val () = loop(view@sum | E, l0 + step/2)
//
in
  sum * step
end // end of [integrate]

(* ****** ****** *)

overload + with Eadd
overload - with Esub
overload * with Emul
overload / with Ediv

(* ****** ****** *)
//
var exp1 = Ecst(1.0) + Ecst(2.0)
val ((*void*)) = println! ("eval(exp1) = ", eval(exp1))
//
(* ****** ****** *)
//
var exp2 =
(
  Eint(1) * Eint(2) * Eint(3) * Eint(4) * Eint(5)
) (* end of [var] *)
val ((*void*)) = println! ("eval(exp2) = ", eval(exp2))
//
(* ****** ****** *)
//
val x = Eide()
var exp3 = x / (Eint(1) + x)
val ((*void*)) =
  println! ("integrate(exp3) = ", integrate(exp3, 1.0, 5.0, 100))
//
(* ****** ****** *)

implement main0 () = ()

(* ****** ****** *)

(* end of [exptmp.dats] *)

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

abstype exp(E:t@ype) = ref(E)

(* ****** ****** *)

typedef Eide_() = int
typedef Ecst_() = double
typedef Eadd_(E1:t@ype, E2:t@ype) = @(exp(E1), exp(E2))
typedef Esub_(E1:t@ype, E2:t@ype) = @(exp(E1), exp(E2))
typedef Emul_(E1:t@ype, E2:t@ype) = @(exp(E1), exp(E2))
typedef Ediv_(E1:t@ype, E2:t@ype) = @(exp(E1), exp(E2))

(* ****** ****** *)

abst@ype Eide() = Eide_()
abst@ype Ecst() = Ecst_()
abst@ype Eadd(E1:t@ype, E2:t@ype) = Eadd_(E1, E2)
abst@ype Esub(E1:t@ype, E2:t@ype) = Esub_(E1, E2)
abst@ype Emul(E1:t@ype, E2:t@ype) = Emul_(E1, E2)
abst@ype Ediv(E1:t@ype, E2:t@ype) = Ediv_(E1, E2)

(* ****** ****** *)

extern
fun{E:t@ype} eval(E: exp(E)): double

(* ****** ****** *)
//
extern
fun{} exp_ide(): exp(Eide())
//
extern
fun{} exp_int(int): exp(Ecst())
extern
fun{} exp_cst(double): exp(Ecst())
//
extern
fun
{E1,E2:t@ype}
exp_add(exp(E1), exp(E2)): exp(Eadd(E1, E2))
extern
fun
{E1,E2:t@ype}
exp_sub(exp(E1), exp(E2)): exp(Esub(E1, E2))
//
extern
fun
{E1,E2:t@ype}
exp_mul(exp(E1), exp(E2)): exp(Emul(E1, E2))
extern
fun
{E1,E2:t@ype}
exp_div(exp(E1), exp(E2)): exp(Ediv(E1, E2))
//
(* ****** ****** *)

local
//
assume
exp(E:t@ype) = ref(E)
//
assume Eide() = Eide_()
assume Ecst() = Ecst_()
assume Eadd(E1:t@ype, E2:t@ype) = Eadd_(E1, E2)
assume Esub(E1:t@ype, E2:t@ype) = Esub_(E1, E2)
assume Emul(E1:t@ype, E2:t@ype) = Emul_(E1, E2)
assume Ediv(E1:t@ype, E2:t@ype) = Ediv_(E1, E2)
//
in (* in-of-local *)

implement
{}(*tmp*)
exp_ide() = ref<int>(0)

implement
{}(*tmp*)
exp_cst(x) = ref<double>(x)
implement
{}(*tmp*)
exp_int(x) = exp_cst(g0i2f(x))

implement
{E1,E2}
exp_add(e1, e2) = ref<Eadd(E1,E2)>((e1, e2))
implement
{E1,E2}
exp_sub(e1, e2) = ref<Esub(E1,E2)>((e1, e2))
implement
{E1,E2}
exp_mul(e1, e2) = ref<Emul(E1,E2)>((e1, e2))
implement
{E1,E2}
exp_div(e1, e2) = ref<Ediv(E1,E2)>((e1, e2))

implement
eval<Ecst()> (e) = !e

implement
(E1,E2)
eval<Eadd(E1,E2)> (e) = eval(!e.0) + eval(!e.1)

implement
(E1,E2)
eval<Esub(E1,E2)> (e) = eval(!e.0) - eval(!e.1)

implement
(E1,E2)
eval<Emul(E1,E2)> (e) = eval(!e.0) * eval(!e.1)

implement
(E1,E2)
eval<Ediv(E1,E2)> (e) = eval(!e.0) / eval(!e.1)

end // end of [local]

(* ****** ****** *)

fun
{E:t@ype}
integrate
(
  E: exp(E)
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
  pf: !double@sum >> _ | E: exp(E), i0: double
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

overload + with exp_add
overload - with exp_sub
overload * with exp_mul
overload / with exp_div

(* ****** ****** *)
//
var exp1 = exp_cst(1.0) + exp_cst(2.0)
val ((*void*)) = println! ("eval(exp1) = ", eval(exp1))
//
(* ****** ****** *)
//
var exp2 =
(
  exp_int(1)
* exp_int(2) * exp_int(3)
* exp_int(4) * exp_int(5)
) (* end of [var] *)
val ((*void*)) = println! ("eval(exp2) = ", eval(exp2))
//
(* ****** ****** *)
//
val x = exp_ide()
var exp3 = x / (exp_int(1) + x)
val ((*void*)) =
  println! ("integrate(exp3) = ", integrate(exp3, 1.0, 5.0, 100))
//
(* ****** ****** *)

implement main0 () = ()

(* ****** ****** *)

(* end of [exptmp_ref.dats] *)

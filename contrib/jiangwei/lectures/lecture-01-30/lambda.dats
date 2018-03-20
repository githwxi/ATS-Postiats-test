#include
"share/atspre_staload.hats"
#include
"share/atspre_staload_libats_ML.hats"

implement main0() = ()

(* ****** ****** *)

(*
fun foo(x: int): int = x + x
*)
val foo =
lam(x: int): int => x + x // \x. x + x //abstraction //why use val? not fun?
val bar =
lam(x: int): int => x * x // \x. x * x

val () = println! ("foo(10) = ", foo(10)) //application
val () = println! ("bar(10) = ", bar(10))

(* ****** ****** *)

val add =
lam (x: int)
  : cfun(int, int) => lam (y: int): int => x+y // \x. \y. x+y //abstraction

val add10 = add(10) //"add10" is a function which takes an int and return an int. "add10" function is the return value of "add". "add10" is an application, and reduced to an abstraction.

val () =
println! ("add10(500) = ", add10(500))

(* ****** ****** *)

fun
twice
(
f: cfun(int, int)
): cfun(int, int) =
  lam(x: int): int => f(f(x))
//twice take an "int function(int)"
//also returns an "int function(int)"
//the returned function is "f(f(x))"
val quad =
twice(lam(x) => x + x) // (x+x)+(x+x) = 4*x

val () = println! ("quad(100) = ", quad(100))

(* ****** ****** *)

fun {
a:t@ype
} twice
(
f: cfun(a, a)
): cfun(a, a) = lam(x: a): a => f(f(x))
//template
(* ****** ****** *)

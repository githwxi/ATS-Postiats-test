#include
"share/atspre_staload.hats"

//
// monomorphic list
//
datatype intlist =
| nil of () // nil: () -> intlist
| cons of (int, intlist) // cons: (int, intlist) -> intlist

val xs0 = nil() // []
val xs1 = cons(1, xs0) // [1]
val xs2 = cons(2, xs1) // [2, 1]
val xs2 = cons(3, xs2) // [3, 2, 1]

fun
intlist_length(xs: intlist): int =
(*
// declarative
case1: if xs is empty => 0
case2: if xs is not empty => 1 + intlist_length(tail(xs))
*)
(
case xs of
| nil() => 0
| cons(_(*x0*), xs1) => 1 + intlist_length(xs1)
)

val () =
println! ("length(xs2) = ", intlist_length(xs2))

fun
intlist_make_interval
(m: int, n: int): intlist =
if m < n then cons(m, intlist_make_interval(m+1, n)) else nil()

val xs1000 = intlist_make_interval(0, 1000)

val () =
println! ("length(xs1000) = ", intlist_length(xs1000))

implement main0() = ()


#include
"share/atspre_staload.hats"

//
// polymorphic list
//
datatype
mylist(a:t@ype) = // a type constructor
| nil of () // nil: () -> mylist(a)
| cons of (a, mylist(a)) // cons: (a, mylist(a)) -> mylist(a)

fun
{a:t@ype}
mylist_length(xs: mylist(a)): int =
(
case xs of
| nil() => 0
| cons(_(*x0*), xs1) => 1 + mylist_length<a>(xs1)
)

val xs = cons(0, cons(1, nil()))
val ys = cons("0", cons("1", nil()))

val () = println! ("length(xs) = ", mylist_length<int>(xs))
val () = println! ("length(ys) = ", mylist_length<string>(ys))

fun
{a:t@ype}
mylist_append
(xs: mylist(a), ys: mylist(a)): mylist(a) =
(
case xs of
| nil() => ys
| cons(x0, xs1) => cons(x0, mylist_append<a>(xs1, ys))
)

val xs2 = mylist_append<int>(xs, xs)
val ys2 = mylist_append<string>(ys, ys)

val () = println! ("length(xs2) = ", mylist_length<int>(xs2))
val () = println! ("length(ys2) = ", mylist_length<string>(ys2))

implement main0() = ()

(*
** Implementing
** some list operations
*)

(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
//
(* ****** ****** *)

datatype
list(a:t@ype, int) =
| list_nil(a, 0) of ()
| {n:nat}
  list_cons(a, n+1) of (a, list(a, n))

(* ****** ****** *)

extern
fun
{a:t@ype}
length{n:nat} (xs: list(a, n)): int(n)

implement
{a}(*tmp*)
length(xs) =
case+ xs of
| list_nil () => 0
| list_cons (_, xs2) => 1 + length(xs2)

(* ****** ****** *)
//
extern
fun
{a:t@ype}
append{m:nat}{n:nat}
  (xs: list(a, m), ys: list(a, n)): list(a, m+n)
//
implement
{a}(*tmp*)
append (xs, ys) =
(
case+ xs of
| list_nil () => ys
| list_cons (x, xs2) => list_cons(x, append(xs2, ys))
)
(* ****** ****** *)
//
extern
fun
{a:t@ype}
revappend{m:nat}{n:nat}
  (xs: list(a, m), ys: list(a, n)): list(a, m+n)
//
implement
{a}(*tmp*)
revappend (xs, ys) =
(
case+ xs of
| list_nil () => ys
| list_cons (x, xs2) => revappend (xs2, list_cons(x, ys))
)
(* ****** ****** *)

extern
fun
{a:t@ype}
reverse{n:nat} (xs: list(a, n)): list(a, n)

(*
implement
{a}(*tmp*)
reverse (xs) =
case+ xs of
| list_nil () => list_nil ()
| list_cons (x, xs) => append(reverse(xs), list_cons(x, list_nil))
*)

implement
{a}(*tmp*)
reverse (xs) = revappend (xs, list_nil())

(* ****** ****** *)
//
extern
fun
{a:t@ype}
{b:t@ype}
map{n:nat}
  (xs: list(a, n), f: a -<cloref1> b): list(b, n)
//
implement
{a}{b}
map(xs, f) =
(
case+ xs of
| list_nil () => list_nil ()
| list_cons (x, xs) => list_cons (f(x), map<a><b> (xs, f))
)
//
(* ****** ****** *)
//
extern
fun
{a,b:t@ype}
cross{m,n:nat}
  (xs: list(a, m), ys: list(b, n)): list( @(a,b), m*n )
//
implement
{a,b}
cross
{m,n}(xs, ys) =
(
case xs of
| list_nil () => list_nil
| list_cons (x, xs2) => let
    prval () = mul_gte_gte_gte{m-1,n}()
  in
    append (map<b><(a,b)> (ys, lam y => (x, y)), cross(xs2, ys))
  end // end of [list_cons]
)
//
(* ****** ****** *)

#define nil list_nil
#define :: list_cons
#define cons list_cons

(* ****** ****** *)

val xs =
1 :: 2 :: 3 :: 4 :: 5 :: nil{int}()

(* ****** ****** *)

val () = assertloc(length(xs) = 5)

(* ****** ****** *)

val () = assertloc(length(reverse(xs)) = 5)

(* ****** ****** *)

val () = assertloc(length(append(xs, reverse(xs))) = 10)

(* ****** ****** *)

val ys = map<int><int>(xs, lam (x) => x*x)

(* ****** ****** *)

val () = assertloc(length(cross<int,int>(xs, ys)) = 25)

(* ****** ****** *)

implement
main0 () = println! "Testing for [list] is done."

(* ****** ****** *)

(* end of [list.dats] *)

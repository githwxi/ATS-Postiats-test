(*
** For lecture-05-27
*)

(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
//
(* ****** ****** *)
//
datatype
mylist(a:t@ype) =
  | mylist_nil of ()
  | mylist_cons of (a, mylist(a))
//
(* ****** ****** *)
//
extern
fun{a:t@ype}
print_mylist (xs: mylist(a)): void
extern
fun{a:t@ype}
fprint_mylist (out: FILEref, xs: mylist(a)): void
//
overload print with print_mylist
overload fprint with fprint_mylist
//
(* ****** ****** *)

implement
{a}(*tmp*)
print_mylist(xs) = fprint_mylist<a>(stdout_ref, xs)

(* ****** ****** *)
//
implement
{a}(*tmp*)
fprint_mylist
  (out, xs) =
  case+ xs of
  | mylist_nil() => fprint! (out, "nil")
  | mylist_cons(x, xs) =>
    {
      val () = fprint_val<a> (out, x)
      val () = fprint! (out, "::", xs)    
    }
//
(* ****** ****** *)

extern
fun
intrange (start:int, finish: int): mylist(int)

implement
intrange (m, n) =
  if m < n then
    mylist_cons(m, intrange(m+1, n)) else mylist_nil()
  // end of [if]

(* ****** ****** *)

extern
fun{a:t@ype}
mylist_length(xs: mylist(a)): int

(* ****** ****** *)

implement
{a}(*tmp*)
mylist_length(xs) =
(
case+ xs of
| mylist_nil() => 0
| mylist_cons(x, xs) => mylist_length(xs) + 1
)

(* ****** ****** *)

extern
fun{a:t@ype}
mylist_append : (mylist(a), mylist(a)) -> mylist(a)

implement
{a}(*tmp*)
mylist_append
  (xs, ys) =
(
case+ xs of
| mylist_nil() => ys
| mylist_cons(x, xs) => mylist_cons(x, mylist_append<a> (xs, ys))
)

(* ****** ****** *)

extern
fun{a:t@ype}
mylist_reverse : (mylist(a)) -> mylist(a)
extern
fun{a:t@ype}
mylist_revappend : (mylist(a), mylist(a)) -> mylist(a)

(* ****** ****** *)

implement
{a}(*tmp*)
mylist_reverse(xs) =
  mylist_revappend(xs, mylist_nil())

implement
{a}(*tmp*)
mylist_revappend(xs, ys) =
case+ xs of
| mylist_nil() => ys
| mylist_cons(x, xs) =>
    mylist_revappend(xs, mylist_cons(x, ys))

(* ****** ****** *)
//
implement
fprint_val<string>
  (out, x) = fprint! (out, '"', x, '"')
//
(* ****** ****** *)

val xs0 = mylist_nil{int}()
val xs1 = mylist_cons(1, xs0)
val xs2 = mylist_cons(2, xs1)

(* ****** ****** *)

val ys0 = mylist_nil{string}()
val ys1 = mylist_cons("1", ys0)
val ys2 = mylist_cons("2", ys1)

(* ****** ****** *)

val () = println! ("xs2 = ", xs2)
val () = println! ("length(xs2) = ", mylist_length<int>(xs2))

val () = println! ("ys2 = ", ys2)
val () = println! ("length(ys2) = ", mylist_length<string>(ys2))

(* ****** ****** *)

(*
implement
fprint_val<int>
  (out, x) = $extfcall(void, "fprintf", out, "%02d", x)
*)

(* ****** ****** *)

val xs3 = intrange(0, 16)
val () = println! ("xs3 = ", xs3)
val () = println! ("length(xs3) = ", mylist_length<int>(xs3))

(* ****** ****** *)

val xs_10 = intrange(0, 10)
val xs_10_10 = mylist_append(xs_10, xs_10)
val () = println! ("xs_10_10 = ", xs_10_10)
val () = println! ("length(xs_10_10) = ", mylist_length(xs_10_10))

(* ****** ****** *)

implement main0 () = ()

(* ****** ****** *)

(* end of [mylist.dats] *)

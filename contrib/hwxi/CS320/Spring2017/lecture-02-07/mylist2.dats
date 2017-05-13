(* ****** ****** *)
//
// Code for lecture-02-07
//
(* ****** ****** *)
//
// HX: polymorphic list type
//
datatype
mylist2(a:t@ype) =
| mylist2_nil of ()
| mylist2_cons of (a, mylist2(a))
//
(* ****** ****** *)

typedef mylist2_int = mylist2(int)
typedef mylist2_string = mylist2(string)

(* ****** ****** *)

extern
fun{a:t@ype}
length : mylist2(a) -> int

(* ****** ****** *)

implement
{a}
length(xs) =
case xs of
| mylist2_nil() => 0
| mylist2_cons(_, xs) => 1 + length<a>(xs)

(* ****** ****** *)

implement main0() =
{
  val () = println! ("Hello from [mylist2]!")
}

(* ****** ****** *)

(* end of [mylist2.dats] *)

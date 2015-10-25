(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
//
(* ****** ****** *)

datatype
bool(bool) =
  | False(false) | True(true)
typedef bool = [b:bool] bool(b)

(* ****** ****** *)

#define true True()
#define false False()

(* ****** ****** *)
//
fun
print_bool
  (x: bool): void =
  case+ x of
  | true => print "true"
  | false => print "false"
//
overload print with print_bool
//
(* ****** ****** *)

implement
main0() =
{
//
val () = println!(true)
val () = println!(false)
//
}

(* ****** ****** *)

(* end of [test22.dats] *)

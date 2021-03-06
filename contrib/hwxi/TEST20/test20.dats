(*
//
// HX-2015-10-24:
//
// RPS:
// rock, paper, scissors
//
// For answering the following question:
// https://groups.google.com/forum/#!topic/ats-lang-users/iM6S1KBlQF0
//
*)

(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
//
(* ****** ****** *)

datasort rps = r | p | s

(* ****** ****** *)
//
datatype
rps(rps) = r(r) | p(p) | s(s)
//
typedef rps = [x: rps] rps (x)
//
(* ****** ****** *)
//
extern
fun print_rps : rps -> void
//
overload print with print_rps
//
(* ****** ****** *)

implement
print_rps (x) =
(
case+ x of
| r() => print ("Rock")
| p() => print ("Paper")
| s() => print ("Scissors")
)

(* ****** ****** *)
//
extern
fun
rps_compare : (rps, rps) -> Sgn
//
implement
rps_compare
  (x, y) =
(
  case+ x of
  | r() => (case+ y of r() =>  0 | p() => ~1 | s() =>  1)
  | p() => (case+ y of r() =>  1 | p() =>  0 | s() => ~1)
  | s() => (case+ y of r() => ~1 | p() =>  1 | s() =>  0)
)
//
overload compare with rps_compare
//
(* ****** ****** *)

implement
main0 () =
{
//
val () = println!("r is ", r)
val () = println!("p is ", p)
val () = println!("s is ", s)
//
val () = assertloc (compare(r, p) < 0)
val () = assertloc (compare(r, s) > 0)
val () = assertloc (compare(p, r) > 0)
val () = assertloc (compare(p, s) < 0)
val () = assertloc (compare(s, r) < 0)
val () = assertloc (compare(s, p) > 0)
//
} (* end of [main0] *)

(* ****** ****** *)

(* end of [test20.dats] *)

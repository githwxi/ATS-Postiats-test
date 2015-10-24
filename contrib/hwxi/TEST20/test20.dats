(*
** RPS:
** rock, paper, scissors
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

implement
main0 () =
{
val () = println!("r is ", r)
val () = println!("p is ", p)
val () = println!("s is ", s)
}

(* ****** ****** *)

(* end of [test20.dats] *)

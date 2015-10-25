(*
//
// HX-2015-10-25:
//
// RPS:
// rock, paper, scissors
//
// For answering the following question:
// https://groups.google.com/forum/#!topic/ats-lang-users/YcdEzhJdJzs
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

stacst
rps_win : (rps, rps) -> bool

(* ****** ****** *)
//
extern
praxi
rps_win_r_s(): [rps_win(r, s)] void
extern
praxi
rps_win_p_r(): [rps_win(p, r)] void
extern
praxi
rps_win_s_p(): [rps_win(s, p)] void
//
(* ****** ****** *)

fun
rps_win
  {x1:rps}
(
  x1: rps (x1)
) :
[ x2:rps
| rps_win(x2, x1)
] rps (x2) = let
//
prval () = rps_win_r_s()
prval () = rps_win_p_r()
prval () = rps_win_s_p()
//
in
//
case+ x1 of
| r() => p()
| p() => s()
| s() => r()
//
end (* end of [rps_win] *)

(* ****** ****** *)

implement
main0 () =
{
//
val () = println!("r is ", r)
val () = println!("p is ", p)
val () = println!("s is ", s)
//
val () = println!("win(r) is ", rps_win(r))
val () = println!("win(p) is ", rps_win(p))
val () = println!("win(s) is ", rps_win(s))
//
} (* end of [main0] *)

(* ****** ****** *)

(* end of [test25.dats] *)

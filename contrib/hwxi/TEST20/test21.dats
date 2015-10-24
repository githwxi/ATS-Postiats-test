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

datasort
rps = r | p | s

(* ****** ****** *)

abst@ype rps(rps) = int

(* ****** ****** *)

typedef rps = [x:rps] rps(x)

(* ****** ****** *)
//
%{^
#define r_rps 0
#define p_rps 1
#define s_rps 2
//
#define is_r(x) (x == r_rps)
#define is_p(x) (x == p_rps)
#define is_s(x) (x == s_rps)
//
%} // end of [{%^]
//
extern
val r: rps(r) = "mac#r_rps"
and p: rps(p) = "mac#p_rps"
and s: rps(s) = "mac#s_rps"
//
(* ****** ****** *)

extern
fun is_r : rps -> bool = "mac#"
and is_p : rps -> bool = "mac#"
and is_s : rps -> bool = "mac#"

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
case- x of
| _ when is_r(x) => print ("Rock")
| _ when is_p(x) => print ("Paper")
| _ when is_s(x) => print ("Scissors")
)

(* ****** ****** *)

implement
main0 () =
{
//
val () = println!("r is ", r)
val () = println!("p is ", p)
val () = println!("s is ", s)
//
} (* end of [main0] *)

(* ****** ****** *)

(* end of [test21.dats] *)

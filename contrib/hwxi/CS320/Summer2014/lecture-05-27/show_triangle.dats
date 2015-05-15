//
#include
"share/atspre_staload.hats"
//

(* ****** ****** *)

extern
fun show_triangle (level: int): void

(*
//
// HX:
// this one is a non-tail-recursive
//
implement
show_triangle
  (level) =
if
level > 0 // test
then let
  val () = println! (level-1)
  val () = show_triangle (level-1)
in
end // end of [then]
else () // end of [else]
*)

(* ****** ****** *)

(*
for (i = 0; i < level ; i++) ...
*)

extern
fun show2_triangle (level: int, i: int): void

implement
show_triangle (level) = show2_triangle (level, 0)

implement
show2_triangle
  (level, i) =
if
i < level // test
then let
  val () = println! (i)
  val () = show2_triangle (level, i+1)
in
  // nothing
end // end of [then]
else () // end of [else]

(* ****** ****** *)

#define DEFAULT 10

implement
main0 (argc, argv) =
{
//
val () =
println! ("argv[0] = ", argv[0])
//
val level =
(
if argc >= 2
  then g0string2int (argv[1]) else DEFAULT
) : int // end of [val]
//
val () = show_triangle (level)
//
} // end of [main0]

(* ****** ****** *)

(* end of [show_triangle.dats] *)

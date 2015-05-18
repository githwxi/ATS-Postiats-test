(* Macros *)

#include
"share/atspre_staload.hats"

(* A macro to compute cubes. *)
macrodef cube (x) =
  `(let val x = ,(x) in x * x * x end)

(* Example of using cube. *)
fun cubesum (i : int,j : int) : int =
  ,(cube `(i)) + ,(cube `(j))

implement main0 () = println! ("cubesum(1, 2) = ", cubesum(1, 2))


#include
"share/atspre_staload.hats"
#include
"share/atspre_staload_libats_ML.hats"

(*
for (i = 0; i < N; i = i + 1) do_something(...)
*)

extern
fun
int_foreach(N: int, fwork: cfun(int, void)): void

(*
(fwork(i); loop(i+1))

means

let
  val () = fwork(i) in loop(i+1)
end
*)

implement
int_foreach
(N, fwork) = let
//
fun loop(i: int): void =
  if i < N then (fwork(i); loop(i+1)) else ()
//
in
  loop(0)
end // end of [int_foreach]

val () =
int_foreach(10, lam(i) => println!(i, ": Hello!"))

(* ****** ****** *)

(*

fun
fact3(n: int, i: int, res: int) =
 if i < n then fact3(n, i+1, (i+1) * res) else res

*)

extern
fun
int_foldleft
( N: int
, res: int
, fopr: cfun(int, int, int)): int

implement
int_foldleft
  (N, res, fopr) = let
//
fun loop(i: int, res: int): int =
  if i < N
    then loop(i+1, fopr(res, i)) else res
  // end of [if]
//
in
  loop(0, res)
end // end of [int_foldleft]

(* ****** ****** *)
//
fun
fact(n: int): int = // 1*...*n
int_foldleft(n, 1, lam(res, i) => res * (i+1))
fun
tally(n: int): int = // 1+...+n
int_foldleft(n, 0, lam(res, i) => res + (i+1))
//
(* ****** ****** *)

val () = println! ("fact(10) = ", fact(10))
val () = println! ("tally(10) = ", tally(10))

(* ****** ****** *)

extern
fun
int_forall(N: int, test: cfun(int, bool)): bool

implement
int_forall(N, test) =
(fix f(i: int): bool =<cloref1>
 if i < N
 then (if test(i) then f(i+1) else false) else true
)(0) // end of [int_forall]

(* ****** ****** *)

extern
fun
int_exists
(N: int, test: cfun(int, bool)): bool

implement
int_exists(N, test) =
(fix f(i: int): bool =<cloref1>
 if i < N
 then (if test(i) then true else f(i+1)) else false
)(0) // end of [int_exists]

(* ****** ****** *)

implement main0() = ()

(* ****** ****** *)

(* end of [combinators.dats] *)

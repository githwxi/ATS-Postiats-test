(*
** Code for lecture-10-13
*)

(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
//
(* ****** ****** *)
//
fun
fact(n: int): int =
  if n > 0 then n * fact(n-1) else 1
//
(* ****** ****** *)
//
typedef
cont(a: t@ype, ans: t@ype) = (a) -<cloref1> ans
//
(* ****** ****** *)
//
fun
{ans:t@ype}
kfact(n: int, k: cont(int, ans)): ans =
  if n > 0 then kfact(n-1, lam(res) => k(n * res)) else k(1)
//
(* ****** ****** *)
//
fun{
ans:t0p
} kfact2
(
  n: int, k: cont(int, ans)
): ans = let
  val () = println! ("kfact2: n = ", n)
in
//
if
n > 0
then
kfact2
(n-1
,
lam(res) => (println! ("kfact2(", n-1, ") = ", res); k(n * res))
) (* end of [kfact2] *)
else k(1)
//
end // end of [kfact2]
//
(* ****** ****** *)

implement
main0 () = () where
{
//
val N = 10
//
val () = kfact<void>(N, lam (res) => println! ("fact(", N, ") = ", res))
//
val () = kfact2<void>(N, lam (res) => println! ("fact(", N, ") = ", res))
//
} (* end of [main0] *)

(* ****** ****** *)

(* end of [kfact.dats] *)

(*
** Code for lecture-10-13
*)

(* ****** ****** *)
//
datatype
intbin(int) =
| intbin$z(0)
| {n:pos}
  intbin$b0(2*n) of intbin(n)
| {n:nat}
  intbin$b1(2*n+1) of intbin(n)
//
(* ****** ****** *)
//
fun
intbin_iseqz
  {n:nat}
  (n: intbin(n)): bool(n==0) =
(
case+ n of
| intbin$z() => true | _ =>> false
)
//
overload iseqz with intbin_iseqz
//
fun
intbin_b0{n:nat}
  (n: intbin(n)): intbin(2*n) =
(
case+ n of
| intbin$z() => n | _ =>> intbin_b0(n)
)
//
(* ****** ****** *)
//
extern
fun
intbin_succ
  {n:int}: (intbin(n)) -> intbin(n+1)
extern
fun
intbin_pred
  {n:pos}: (intbin(n)) -> intbin(n-1)
overload
succ with intbin_succ
overload
pred with intbin_pred
//
(* ****** ****** *)

implement
intbin_succ(n) =
(
case+ n of
| intbin$z() =>
    intbin$b1(intbin$z())
  // end of [intbin$z]
| intbin$b0(n2) => intbin$b1(n2)
| intbin$b1(n2) => intbin$b0(succ(n2))
)

(* ****** ****** *)

implement
intbin_pred(n) =
(
case+ n of
| intbin$b1(n2) => intbin_b0(n2)
| intbin$b0(n2) => intbin$b1(pred(n2))
)

(* ****** ****** *)
//
extern
fun
intbin_add
  {m,n:int}
: (intbin(m), intbin(n)) -> intbin(m+n)
//
overload + with intbin_add
//
implement
intbin_add(m, n) =
(
case+ (m, n) of
| (intbin$z(), _) => n
| (_, intbin$z()) => m
| (intbin$b0(m2), intbin$b0(n2)) => intbin$b0(m2+n2)
| (intbin$b0(m2), intbin$b1(n2)) => intbin$b1(m2+n2)
| (intbin$b1(m2), intbin$b0(n2)) => intbin$b1(m2+n2)
| (intbin$b1(m2), intbin$b1(n2)) => intbin$b0(succ(m2+n2))
)
//
(* ****** ****** *)

implement main0 () = ()

(* ****** ****** *)

(* end of [intbin.dats] *)
